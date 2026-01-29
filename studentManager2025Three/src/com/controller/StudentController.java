package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.ui.Model;

import com.pojo.Student;
import com.service.StudentService;

//新增导入（关键：添加公告相关的类和服务）
import com.pojo.Notice; // 你的Notice实体类包路径
import com.service.NoticeService; // 你的NoticeService接口包路径

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    
    // 新增注入：公告服务（关键）
    @Autowired
    private NoticeService noticeService;

    // ------------------- 注册相关 -------------------
    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    @RequestMapping("/registerStudent")
    public String registerStudent(Student student) {
        try {
            int result = studentService.register(student);
            return result > 0 ? "registerSuccess" : "zhuceError";
        } catch (DuplicateKeyException e) {
            // 捕获主键冲突异常，跳转到注册错误页面
            return "zhuceError";
        } catch (Exception e) {
            // 捕获其他可能的异常（如参数错误等）
            return "zhuceError";
        }
    }

    // ------------------- 登录相关 -------------------
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/loginStudent")
    public String loginStudent(@RequestParam("sno") String snoStr, @RequestParam("pwd") String pwd, HttpSession session) {
        try {
            int sno = Integer.parseInt(snoStr);
            Student student = studentService.login(sno, pwd);
            if (student != null) {
                session.setAttribute("sname", student.getSname());
                session.setAttribute("sno", student.getSno());
                return "loginSuccess";
            } else {
                return "loginError";
            }
        } catch (NumberFormatException e) {
            return "loginError";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

 // ------------------- 首页相关 -------------------
    @RequestMapping("/index")
    public String toIndex() {
        return "index";
    }

    // 修改后的toMain方法（关键：添加Model参数和公告查询逻辑）
    @RequestMapping("/toMain")
    public String toMain(Model model) {
        // 新增：查询所有公告列表（按时间倒序，确保显示最新的）
        List<Notice> noticeList = noticeService.getAllNotice();
        // 新增：将公告列表存入Model，供main.jsp页面获取
        model.addAttribute("noticeList", noticeList);
        return "main";
    }
    
    // ------------------- 删除学生相关 -------------------
    @RequestMapping("/toDeleteStudent")
    public String toDeleteStudent() {
        return "delete";
    }

    // 新增：处理“修改/删除”请求（核心MyBatis逻辑）
    @RequestMapping("/handleModifyOrDelete")
    public String handleModifyOrDelete(
            @RequestParam("snoStr") String snoStr,
            @RequestParam("sname") String sname,
            @RequestParam("pwd") String pwd,
            @RequestParam("ageStr") String ageStr,
            @RequestParam("hobbit") String hobbit,
            @RequestParam("address") String address,
            @RequestParam("action") String action,
            Model model) {
        
        try {
            int sno = Integer.parseInt(snoStr);
            Student dbStudent = studentService.getStudentBySno(sno);
            if (dbStudent == null) {
                model.addAttribute("msg", "学号不存在，请检查后重试");
                return "deleteError";
            }

            if ("删除学生".equals(action)) {
                if (!sname.equals(dbStudent.getSname()) 
                        || !pwd.equals(dbStudent.getPwd()) 
                        || Integer.parseInt(ageStr) != dbStudent.getAge() 
                        || !hobbit.equals(dbStudent.getHobbit()) 
                        || !address.equals(dbStudent.getAddress())) {
                    model.addAttribute("msg", "字段不一致，无法删除");
                    return "deleteError";
                }

                int deleteResult = studentService.deleteStudentBySno(sno);
                if (deleteResult > 0) {
                    // 删除成功：重定向并携带success标识
                    return "redirect:/toDeleteStudent?success=true";
                } else {
                    model.addAttribute("msg", "删除失败，请重试");
                    return "deleteError";
                }

            } else if ("修改信息".equals(action)) {
                Student updateStudent = new Student();
                updateStudent.setSno(sno);
                if (!sname.trim().isEmpty()) updateStudent.setSname(sname);
                if (!pwd.trim().isEmpty()) updateStudent.setPwd(pwd);
                if (!ageStr.trim().isEmpty()) updateStudent.setAge(Integer.parseInt(ageStr));
                if (!hobbit.trim().isEmpty()) updateStudent.setHobbit(hobbit);
                if (!address.trim().isEmpty()) updateStudent.setAddress(address);

                int updateResult = studentService.updateStudent(updateStudent);
                if (updateResult > 0) {
                    // 修改成功：重定向并携带success标识
                    return "redirect:/toDeleteStudent?success=true";
                } else {
                    model.addAttribute("msg", "修改失败，请重试");
                    return "deleteError";
                }
            } else {
                model.addAttribute("msg", "未知操作");
                return "deleteError";
            }

        } catch (NumberFormatException e) {
            model.addAttribute("msg", "学号或年龄格式错误");
            return "deleteError";
        }
    }

 // ------------------- 修改密码相关 -------------------
    @RequestMapping("/toModifyPwd")
    public String toModifyPwd(HttpSession session, Model model) {
        // 已登录时：自动将当前登录用户的学号传递到页面
        Integer loginSno = (Integer) session.getAttribute("sno");
        if (loginSno != null) {
            model.addAttribute("loginSno", loginSno.toString());
        }
        return "modifyPwd";
    }

    // ------------------- 处理修改密码请求 -------------------
    @RequestMapping("/modifyPwd")
    public String modifyPwd(
            @RequestParam("snoStr") String snoStr, 
            @RequestParam("newPwd") String newPwd, 
            @RequestParam("renewPwd") String renewPwd,
            Model model,
            HttpSession session) {
        
        // 1. 校验新密码与确认密码一致性
        if (!newPwd.equals(renewPwd)) {
            model.addAttribute("errorMsg", "两次输入的密码不一致，请重新输入！");
            model.addAttribute("loginSno", snoStr); // 回显学号
            return "modifyPwd"; // 直接返回修改页（不再跳转到modifyPwdError）
        }

        // 2. 校验学号格式
        int sno;
        try {
            sno = Integer.parseInt(snoStr);
            if (sno <= 0) {
                model.addAttribute("errorMsg", "学号必须为正整数，请检查！");
                model.addAttribute("loginSno", snoStr);
                return "modifyPwd";
            }
        } catch (NumberFormatException e) {
            model.addAttribute("errorMsg", "学号格式错误，请输入数字！");
            model.addAttribute("loginSno", snoStr);
            return "modifyPwd";
        }

        // 3. 调用Service修改密码
        int result = studentService.modifyPassword(sno, newPwd);
        if (result > 0) {
            // 修改成功：添加success标记（前端根据此标记显示弹窗）
            model.addAttribute("modifySuccess", true);
            // 已登录用户：清除Session（但不自动跳转，交给前端弹窗选择）
            if (session.getAttribute("sno") != null) {
                session.invalidate();
            }
            return "modifyPwd"; // 返回修改页，前端显示弹窗
        } else {
            // 学号不存在
            model.addAttribute("errorMsg", "未找到该学号的学生信息，请检查学号！");
            model.addAttribute("loginSno", snoStr);
            return "modifyPwd";
        }
    }
 // ------------------- 查看学生（按学号单查）相关 -------------------
    /**
     * 跳转到“按学号查看学生”页面（对应 check.jsp）
     */
    @RequestMapping("/toCheckStudent")
    public String toCheckStudent() {
        return "check";
    }

    /**
     * 处理“按学号查看学生”的请求，通过 MyBatis 查询后跳转结果页
     */
    @RequestMapping("/checkStudent")
    public String checkStudent(
            // 前端表单 name 为 "sno"，此处参数名需完全一致
            @RequestParam("sno") String snoStr, 
            HttpSession session,
            Model model) {
        try {
            // 1. 校验学号格式（必须为数字）
            int sno = Integer.parseInt(snoStr);
            
            // 2. 调用 Service 层查询（MyBatis 核心：通过 Service 间接调用 Dao）
            Student student = studentService.getStudentBySno(sno);
            
            if (student != null) {
                // 3. 查询成功：将学生信息存入 Session，跳转结果页
                session.setAttribute("student", student);
                return "checkResult";
            } else {
                // 4. 学号不存在：回显错误信息到 check.jsp
                model.addAttribute("snoErrorMsg", "未找到学号为 " + sno + " 的学生信息！");
                return "check";
            }
        } catch (NumberFormatException e) {
            // 5. 学号格式错误：回显错误信息
            model.addAttribute("snoErrorMsg", "学号格式不正确，请输入数字！");
            return "check";
        }
    }
    // ------------------- 新增：查询所有学生相关（复用原有页面和Service方法） -------------------
 // 跳转到“查看所有学生”列表页（不变）
    @RequestMapping("/toShowAllStudents")
    public String toShowAllStudents() {
        return "showAllStudentInfo";
    }

    // 处理“查询所有学生”请求：默认查询第1页
    @RequestMapping("/showAllStudents")
    public String showAllStudents(HttpSession session) {
        return showAllStudentsByPageNo("1", session);
    }

    // 处理“分页查询学生”请求（含异常处理）
    @RequestMapping("/showAllStudentsByPageNo")
    public String showAllStudentsByPageNo(
            @RequestParam(value = "pageNo", required = false) String pageNoStr,
            HttpSession session) {
        int pageNo = 1;
        try {
            pageNo = Integer.parseInt(pageNoStr);
        } catch (NumberFormatException e) {
            session.setAttribute("errorMsg", "页号格式不正确，请输入数字！");
            return "showAllStudentInfo";
        }
        int pageSize = 5;
        int totalCount = studentService.countAllStudents();
        int totalPages = studentService.getTotalPages(pageSize);
        // 页号校验
        if (pageNo < 1) pageNo = 1;
        if (pageNo > totalPages && totalPages > 0) pageNo = totalPages;
        // 查询当前页数据
        List<Student> result = studentService.getAllStudentsFenye(pageNo, pageSize);
        // 存储分页信息到Session
        session.setAttribute("allStudents", result);
        session.setAttribute("currentPage", pageNo);
        session.setAttribute("totalPages", totalPages);
        session.setAttribute("totalCount", totalCount);
        session.removeAttribute("errorMsg");
        return "showAllStudentInfo";
    }

    // 上一页、下一页方法（不变）
    @RequestMapping("/prevPage")
    public String prevPage(HttpSession session) {
        Integer currentPage = (Integer) session.getAttribute("currentPage");
        currentPage = currentPage != null ? currentPage : 1;
        currentPage--;
        if (currentPage < 1) currentPage = 1;
        return "redirect:showAllStudentsByPageNo?pageNo=" + currentPage;
    }

    @RequestMapping("/nextPage")
    public String nextPage(HttpSession session) {
        Integer currentPage = (Integer) session.getAttribute("currentPage");
        currentPage = currentPage != null ? currentPage : 1;
        Integer totalPages = (Integer) session.getAttribute("totalPages");
        // 替换三元运算符为if-else
        if (totalPages == null) {
            totalPages = 1;
        }
        currentPage++;
        if (currentPage > totalPages) {
            currentPage = totalPages;
        }
        return "redirect:showAllStudentsByPageNo?pageNo=" + currentPage;
    }
 // ------------------- 新增：姓名模糊查询相关 -------------------
    /**
     * 跳转到“姓名模糊查询”页面
     */
    @RequestMapping("/toFuzzyQueryStudent")
    public String toFuzzyQueryStudent() {
        return "fuzzyQuery";
    }

    /**
     * 处理“姓名模糊查询”请求
     */
    @RequestMapping("/fuzzyQueryStudent")
    public String fuzzyQueryStudent(
            @RequestParam("sname") String sname, 
            HttpSession session,
            Model model) {
        List<Student> fuzzyStudents = studentService.getStudentsBySnameLike(sname);
        if (fuzzyStudents != null && !fuzzyStudents.isEmpty()) {
            session.setAttribute("fuzzyStudents", fuzzyStudents);
            return "fuzzyQueryResult";
        } else {
            // 改为 snameErrorMsg
            model.addAttribute("snameErrorMsg", "未找到姓名包含“" + sname + "”的学生信息！");
            return "check"; // 返回到合并后的 check.jsp 页面
        }
    }
  //------------------- 新增：性别查询相关 -------------------

    //跳转到性别查询页面
    	@RequestMapping("/toQuerygender")
    	public String toQuerygender() {
    		return "querygender";
    	}
    	
    	//处理性别查询功能相关
    	@RequestMapping("/Querygender")
    	public String Querygender(@RequestParam("gender") String gender,
    			HttpSession session,
    			Model model) {
    			Integer sno=(Integer)session.getAttribute("sno");
    			if(sno==null) {
    				return "redirect:login.jsp";  // 未登录则跳转到登录页
    			}//验证用户是否登入
    			if(gender == null) {
    		        model.addAttribute("errorgender", "请选择性别！");
    		        return "querygenderError";
    		    }
    			if("男".equals(gender)) {
    				List<Student> Malegenders = studentService.getMaleGender(gender);
    				model.addAttribute("studentList", Malegenders);
    				return "querygender";  // 跳转到查看性别页面
    			}
    			if("女".equals(gender)) {
    				List<Student>Femalegenders=studentService.getFemaleGender(gender);
    				model.addAttribute("studentList",Femalegenders);
    				return "querygender";  // 跳转到查看性别页面
    			}
    			if("全部".equals(gender)) {
    				List<Student> Allgenders=studentService.getAllStudents();
    	  			model.addAttribute("studentList",Allgenders);
    				return "querygender";  // 跳转到查看性别页面
    			}
    			model.addAttribute("errorgender","请选择男！女！或者全部！");
    			return "querygenderError";
    	
    	}
    	//------------------- 新增：年龄查询相关 -------------------
    	@RequestMapping("/toage")
    	public String toAge() {
    			return"age";
    	}
    	@RequestMapping("/age")
    	public String age(@RequestParam("age") String age,
    			HttpSession session,
    			Model model) {
	    		// 新增：登录校验（和性别查询逻辑一致）
	    	    Integer sno = (Integer) session.getAttribute("sno");
	    	    if (sno == null) {
	    	        return "redirect:login.jsp";
	    	    }
    			if(age==null) {
    				model.addAttribute("ageError","年龄错误！");
    				return"age";
    				
    			}
    			if("青年".equals(age)) {
    				List<Student>Formalages=studentService.getFormalage(age);
    				model.addAttribute("studentList",Formalages);
    				return"age";
    			}
    			if("中年".equals(age)) {
    				List<Student>Middleages=studentService.getMiddleage(age);
    				model.addAttribute("studentList",Middleages);
    				return"age";
    			}
    			if("老年".equals(age)) {
    				List<Student>Highages=studentService.getHighage(age);
    				model.addAttribute("studentList",Highages);
    				return"age";
    			}
    				model.addAttribute("ageError","年龄错误！");
    				return"age";
    		}
    		
    	
}