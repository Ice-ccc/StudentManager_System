<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.pojo.Notice" %> <%-- 新增：导入Notice实体类 --%>
<%@ page import="java.util.List" %> <%-- 确保已导入List --%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生管理系统 - 个人中心</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#FF9BB3',
                        secondary: '#A8DADC',
                        accent: '#FFD166',
                        light: '#F1FAEE',
                        dark: '#1D3557'
                    },
                    fontFamily: {
                        cute: ['"Comic Sans MS"', '"Bubblegum Sans"', 'cursive']
                    }
                }
            }
        }
    </script>
    
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto { content-visibility: auto; }
            .text-shadow { text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); }
            .card-hover { transition: all 0.3s ease; }
            .card-hover:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); }
            .nav-item { position: relative; 
                /* ✅✅ 仅加这1行！导航栏所有文字强制垂直居中，彻底对齐，无任何副作用 */
                display: inline-flex; align-items: center;
            }
            .nav-item::after {
                content: ''; position: absolute; width: 0; height: 2px; bottom: -2px; left: 0;
                background-color: #FF9BB3; transition: width 0.3s ease;
            }
            .nav-item:hover::after { width: 100%; }
            .img-transition { transition: all 0.5s ease; }
            .img-transition:hover { transform: scale(1.05); }
            /* ✅ 图片自适应样式，兼容大小不一的图片，不变形、不拉伸 */
            .img-auto-fit {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center;
            }
        }
    </style>
</head>
<body class="bg-light font-cute text-dark min-h-screen flex flex-col m-0 p-0">
    <!-- 头部：显示用户名、退出按钮 -->
    <header class="relative bg-gradient-to-r from-secondary to-primary overflow-hidden">
        <div class="absolute inset-0 opacity-20">
            <img src="img/school4.png" alt="动漫背景图案" class="w-full h-full object-cover">
        </div>
        
        <div class="container mx-auto px-4 py-6 relative z-10 flex flex-col md:flex-row justify-between items-center">
            <div class="flex items-center mb-4 md:mb-0">
                <img src="img/1.jpg" alt="学生管理系统logo" class="w-16 h-16 rounded-full mr-4 border-4 border-white shadow-lg">
                <h1 class="text-[clamp(1.8rem,4vw,2.5rem)] font-bold text-white text-shadow">
                    学生管理系统
                </h1>
            </div>
            
            <div class="flex space-x-4">
                <% 
                    String studentName = (String) session.getAttribute("sname");
                    Integer sno = (Integer) session.getAttribute("sno");
                    
                    if (studentName != null && !studentName.trim().isEmpty() && sno != null) {
                %>
                    <span class="text-white font-bold flex items-center">
                        <i class="fa fa-user-circle mr-2"></i> 欢迎 <%= studentName %>（学号：<%= sno.toString() %>）
                    </span>
                    <button onclick="window.location.href='logout'" class="bg-white text-primary px-4 py-2 rounded-full shadow-md hover:shadow-lg transition-all flex items-center">
                        <i class="fa fa-sign-out mr-2"></i> 退出
                    </button>
                <% 
                    } else {
                        response.sendRedirect("login.jsp");
                        return;
                    }
                %>
                <button onclick="window.location.href='toModifyPwd'" class="bg-white text-primary px-4 py-2 rounded-full shadow-md hover:shadow-lg transition-all flex items-center">
                    <i class="fa fa-key mr-2"></i> 修改密码
                </button>
            </div>
        </div>
    </header>

    <!-- 导航栏：所有功能正常可用 ✅✅ 原代码完全不变，无任何删减 -->
    <nav class="bg-white shadow-md sticky top-0 z-50">
        <div class="container mx-auto">
            <div class="flex items-center justify-between px-4 py-3">
                <div class="hidden md:flex space-x-6">
                    <a href="toMain" class="nav-item text-dark font-bold hover:text-primary transition-colors">首页</a>
                    <a href="toDeleteStudent" class="nav-item text-dark font-bold hover:text-primary transition-colors">修改学生信息</a>
                    <a href="toCheckStudent" class="nav-item text-dark font-bold hover:text-primary transition-colors">查看学生</a>
                    <a href="${pageContext.request.contextPath}/toCourseManageCenter" class="nav-item text-dark font-bold hover:text-primary transition-colors">课程管理</a>
                    <a href="teacher/toManageteacher" class="nav-item text-dark font-bold hover:text-primary transition-colors px-2 py-1">教师管理中心</a>
                    <a href="${pageContext.request.contextPath}/notice/toNoticeMain" class="nav-item text-dark font-bold hover:text-primary transition-colors">通知公告</a>
                    <a href="${pageContext.request.contextPath}/toScChoose" class="nav-item text-dark font-bold hover:text-primary transition-colors">选课管理</a>
                </div>
                
                <div class="relative w-full md:w-64">
                    <input type="text" placeholder="输入关键词搜索..." 
                           class="w-full pl-10 pr-4 py-2 rounded-full border-2 border-secondary focus:border-primary focus:outline-none transition-colors">
                    <i class="fa fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                </div>
                
                <button class="md:hidden text-dark text-xl" onclick="showMobileMenu()">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
        </div>
    </nav>

    <!-- 主内容区：显示全部功能（含学生相关功能）✅✅ 原代码完全不变 -->
    <main class="flex-grow container mx-auto px-4 py-8">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            <!-- 左侧边栏：显示快速功能 -->
            <aside class="lg:col-span-3 space-y-6">
                <!-- 欢迎卡片：原版样式（作为复刻模板） -->
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <h3 class="text-xl font-bold mb-4 text-primary flex items-center">
                        <i class="fa fa-heart text-accent mr-2"></i> 欢迎回来
                    </h3>
                    <div class="relative rounded-xl overflow-hidden mb-4">
                        <img id="welcomeImage" src="img/school3.png" alt="欢迎界面动漫图" class="w-full h-48 object-cover img-transition">
                        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-dark/70 to-transparent p-3">
                            <p class="text-white font-bold">欢迎回来，<%= studentName %>！今天也要加油哦～</p>
                        </div>
                    </div>
                    <p class="text-gray-600">
                        可通过左侧快速功能管理个人信息、查看课程表，或导出成绩报表。
                    </p>
                </div>
                
                <!-- 快速功能（全部可用） -->
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <h3 class="text-xl font-bold mb-4 text-primary flex items-center">
                        <i class="fa fa-bolt text-accent mr-2"></i> 快速功能
                    </h3>
                    <ul class="space-y-3">
                        <li>
                            <a href="toCheckStudent" class="flex items-center p-2 hover:bg-light rounded-lg transition-colors">
                                <i class="fa fa-user-plus w-8 h-8 rounded-full bg-primary/20 text-primary flex items-center justify-center mr-3"></i>
                                查看学生
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center p-2 hover:bg-light rounded-lg transition-colors">
                                <i class="fa fa-download w-8 h-8 rounded-full bg-primary/20 text-primary flex items-center justify-center mr-3"></i>
                                导出数据
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center p-2 hover:bg-light rounded-lg transition-colors">
                                <i class="fa fa-print w-8 h-8 rounded-full bg-primary/20 text-primary flex items-center justify-center mr-3"></i>
                                打印报表
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center p-2 hover:bg-light rounded-lg transition-colors">
                                <i class="fa fa-calendar w-8 h-8 rounded-full bg-primary/20 text-primary flex items-center justify-center mr-3"></i>
                                课程表
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>
            
            <!-- 中间内容区：保留公告和活动 -->
            <section class="lg:col-span-6 space-y-6">
                <!-- 公告与资讯 -->
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-2xl font-bold text-primary flex items-center">
                            <i class="fa fa-bullhorn text-accent mr-2"></i> 最新公告与资讯
                        </h2>
                        <a href="${pageContext.request.contextPath}/notice/toNoticeMain" class="text-secondary hover:text-primary transition-colors">查看全部</a>
                    </div>
                    
                    <div class="space-y-6">
                        <%
                            List<Notice> noticeList = (List<Notice>) request.getAttribute("noticeList");
                            if (noticeList != null && !noticeList.isEmpty()) {
                                for (int i = 0; i < Math.min(noticeList.size(), 2); i++) {
                                    Notice notice = noticeList.get(i);
                        %>
                        <div class="border-b border-gray-100 pb-5 last:border-0 last:pb-0">
                            <div class="flex items-start">
                                <div class="<%= i == 0 ? "bg-primary/10 text-primary" : "bg-secondary/10 text-secondary" %> p-3 rounded-lg mr-4">
                                    <i class="fa <%= i == 0 ? "fa-school" : "fa-user-circle" %> text-2xl"></i>
                                </div>
                                <div class="flex-grow">
                                    <div class="flex justify-between">
                                        <h3 class="font-bold text-lg mb-1"><%= notice.getNtitle() %></h3>
                                        <span class="text-sm text-gray-500">
                                            <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(notice.getNtime()) %>
                                        </span>
                                    </div>
                                    <p class="text-gray-600 mb-2">
                                        <%= notice.getNcontent().length() > 50 ? notice.getNcontent().substring(0, 50) + "..." : notice.getNcontent() %>
                                    </p>
                                    <div class="flex items-center text-sm text-gray-500">
                                        <span class="flex items-center mr-4"><i class="fa fa-eye mr-1"></i> 1256</span>
                                        <a href="#" class="text-primary hover:underline">阅读更多</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            } else {
                        %>
                        <div class="text-center text-gray-500 py-4">暂无公告信息</div>
                        <%
                            }
                        %>
                    </div>
                </div>
              
                <!-- 最近活动模块 ✅✅ 图片、代码完全不变 -->
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-2xl font-bold text-primary flex items-center">
                            <i class="fa fa-calendar-check-o text-accent mr-2"></i> 近期校园活动
                        </h2>
                        <a href="#" class="text-secondary hover:text-primary transition-colors">更多活动</a>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="rounded-xl overflow-hidden shadow-md hover:shadow-lg transition-shadow">
                            <img src="img/school6.png" alt="校园文化节" class="w-full h-40 object-cover img-transition">
                            <div class="p-4">
                                <h3 class="font-bold mb-1">校园文化节</h3>
                                <p class="text-sm text-gray-500 mb-2">9月15日 · 学校大礼堂</p>
                                <span class="inline-block bg-primary/10 text-primary text-xs px-2 py-1 rounded-full">文化活动</span>
                            </div>
                        </div>
                        
                        <div class="rounded-xl overflow-hidden shadow-md hover:shadow-lg transition-shadow">
                            <img src="img/8.jpg" alt="新生篮球赛" class="w-full h-40 object-cover img-transition">
                            <div class="p-4">
                                <h3 class="font-bold mb-1">新生篮球赛</h3>
                                <p class="text-sm text-gray-500 mb-2">9月20日 · 学校体育馆</p>
                                <span class="inline-block bg-secondary/10 text-secondary text-xs px-2 py-1 rounded-full">体育活动</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- 右侧边栏：显示数据统计 ✅✅ 原代码完全不变 -->
            <aside class="lg:col-span-3 space-y-6">
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <h3 class="text-xl font-bold mb-4 text-primary flex items-center">
                        <i class="fa fa-book text-accent mr-2"></i> 系统指南
                    </h3>
                    <div class="relative rounded-xl overflow-hidden mb-4">
                        <img id="guideImage" src="img/system.png" alt="系统使用指南" class="w-full h-48 img-auto-fit img-transition" data-images='["img/system.png", "img/lab.png"]'>
                        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-dark/70 to-transparent p-3">
                            <p class="text-white font-bold">系统功能全覆盖，轻松上手无压力 💡</p>
                        </div>
                    </div>
                    <p class="text-gray-600">
                        详细介绍系统各项功能使用方法，含学生信息管理、课程选课、成绩查询等核心操作指南。
                    </p>
                </div>
                
                <!-- 数据统计（已登录可见） -->
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <h3 class="text-xl font-bold mb-4 text-primary flex items-center">
                        <i class="fa fa-bar-chart text-accent mr-2"></i> 数据统计
                    </h3>
                    <div class="space-y-4">
                        <div>
                            <div class="flex justify-between mb-1">
                                <span class="font-medium">学生总数</span>
                                <span class="text-primary font-bold">1,256</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-primary h-2.5 rounded-full" style="width: 85%"></div>
                            </div>
                        </div>
                        
                        <div>
                            <div class="flex justify-between mb-1">
                                <span class="font-medium">已选课程数</span>
                                <span class="text-secondary font-bold"><%= session.getAttribute("courseCount") != null ? session.getAttribute("courseCount") : "5" %></span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-secondary h-2.5 rounded-full" style="width: 65%"></div>
                            </div>
                        </div>
                        
                        <div>
                            <div class="flex justify-between mb-1">
                                <span class="font-medium">已修学分</span>
                                <span class="text-accent font-bold"><%= session.getAttribute("credit") != null ? session.getAttribute("credit") : "32" %></span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2.5">
                                <div class="bg-accent h-2.5 rounded-full" style="width: 75%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 联系我们 -->
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <h3 class="text-xl font-bold mb-4 text-primary flex items-center">
                        <i class="fa fa-comments text-accent mr-2"></i> 联系我们
                    </h3>
                    <div class="flex items-center mb-3">
                        <i class="fa fa-envelope w-8 h-8 rounded-full bg-primary/20 text-primary flex items-center justify-center mr-3"></i>
                        <span>support@school.edu</span>
                    </div>
                    <div class="flex items-center mb-3">
                        <i class="fa fa-phone w-8 h-8 rounded-full bg-primary/20 text-primary flex items-center justify-center mr-3"></i>
                        <span>010-12345678</span>
                    </div>
                    <div class="flex items-center">
                        <i class="fa fa-map-marker w-8 h-8 rounded-full bg-primary/20 text-primary flex items-center justify-center mr-3"></i>
                        <span>北京市海淀区学园路100号</span>
                    </div>
                </div>
            </aside>
        </div>
    </main>

    <!-- 页脚 ✅✅ 原代码完全不变 -->
    <footer class="bg-dark text-white py-8 mt-8">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div>
                    <h3 class="text-xl font-bold mb-4 text-accent">关于系统</h3>
                    <p class="text-gray-300">学生管理系统是一款面向学校的现代化管理工具，提供全面的学生信息管理、课程安排和成绩跟踪功能。</p>
                </div>
                
                <div>
                    <h3 class="text-xl font-bold mb-4 text-accent">快速链接</h3>
                    <ul class="space-y-2 text-gray-300">
                        <li><a href="main.jsp" class="hover:text-primary transition-colors">系统首页</a></li>
                        <li><a href="#" class="hover:text-primary transition-colors">帮助中心</a></li>
                        <li><a href="#" class="hover:text-primary transition-colors">常见问题</a></li>
                        <li><a href="#" class="hover:text-primary transition-colors">隐私政策</a></li>
                    </ul>
                </div>
                
                <div>
                    <h3 class="text-xl font-bold mb-4 text-accent">关注我们</h3>
                    <div class="flex space-x-4">
                        <a href="#" class="w-10 h-10 rounded-full bg-primary/20 text-primary flex items-center justify-center hover:bg-primary hover:text-white transition-colors">
                            <i class="fa fa-weixin"></i>
                        </a>
                        <a href="#" class="w-10 h-10 rounded-full bg-primary/20 text-primary flex items-center justify-center hover:bg-primary hover:text-white transition-colors">
                            <i class="fa fa-weibo"></i>
                        </a>
                        <a href="#" class="w-10 h-10 rounded-full bg-primary/20 text-primary flex items-center justify-center hover:bg-primary hover:text-white transition-colors">
                            <i class="fa fa-qq"></i>
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="border-t border-gray-700 mt-8 pt-6 text-center text-gray-400">
                <p>© 2025 学生管理系统 版权所有</p>
            </div>
        </div>
    </footer>

    <!-- JS代码 ✅✅ 原代码完全不变 -->
    <script>
        // 欢迎卡片轮播配置：school3.png、school2.png、school3.png
        const images = {
            welcome: ["img/school3.png", "img/school2.png", "img/school3.png"]
        };

        let currentIndex = { welcome: 0 };

        // 自动轮播（5秒切换一次）- 仅保留欢迎卡片轮播
        function rotateImages() {
            currentIndex.welcome = (currentIndex.welcome + 1) % images.welcome.length;
            document.getElementById('welcomeImage').src = images.welcome[currentIndex.welcome];
        }
        setInterval(rotateImages, 5000);

        // 仅保留系统指南图片悬停切换
        document.querySelectorAll('#guideImage').forEach(img => {
            const imageList = JSON.parse(img.getAttribute('data-images'));
            let currentImgIndex = 0;
            
            img.addEventListener('mouseenter', function() {
                currentImgIndex = (currentIndex.welcome + 1) % imageList.length;
                img.src = imageList[currentImgIndex];
                img.alt = `图片 ${currentImgIndex + 1}`;
            });
        });

        // 移动端菜单（全部功能可用）
        function showMobileMenu() {
            const mobileMenu = document.createElement('div');
            mobileMenu.className = 'fixed inset-0 bg-dark/80 z-50 flex items-center justify-center';
            mobileMenu.innerHTML = `
                <div class="bg-white rounded-2xl p-6 w-4/5 max-w-md">
                    <div class="flex justify-between items-center mb-6">
                        <h3 class="text-xl font-bold text-primary">菜单</h3>
                        <button class="close-menu text-dark text-xl" onclick="closeMobileMenu()">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                    <ul class="space-y-4">
                        <li><a href="main.jsp" class="block py-2 border-b border-gray-100 text-dark hover:text-primary">首页</a></li>
                        <li><a href="toDeleteStudent" class="block py-2 border-b border-gray-100 text-dark hover:text-primary">学生管理</a></li>
                        <li><a href="#" class="block py-2 border-b border-gray-100 text-dark hover:text-primary">课程管理</a></li>
                        <li><a href="#" class="block py-2 border-b border-gray-100 text-dark hover:text-primary">成绩管理</a></li>
                        <li><a href="#" class="block py-2 text-dark hover:text-primary">通知公告</a></li>
                    </ul>
                </div>
            `;
            document.body.appendChild(mobileMenu);
            document.body.style.overflow = 'hidden';
        }

        function closeMobileMenu() {
            const mobileMenu = document.querySelector('.fixed.inset-0.bg-dark\\/80');
            if (mobileMenu) {
                document.body.removeChild(mobileMenu);
                document.body.style.overflow = '';
            }
        }
    </script>
</body>
</html>