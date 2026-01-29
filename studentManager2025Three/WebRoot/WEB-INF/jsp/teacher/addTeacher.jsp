<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新增教师信息</title>
<style type="text/css">
/* ✅ 核心修改：毛玻璃紫色半透明质感 + 背景图替换为loginbackground.png */
body {
    background-image: url("../img/loginbackground.png"); /* ✅ 更换为指定背景图 */
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    font-family: 楷体;
}
.container {
    width: 600px;
    margin: 50px auto;
    background-color: rgba(255, 255, 255, 0.4); /* ✅ 核心：0.4透明度实现毛玻璃通透感 */
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    border: 2px solid #800080; /* ✅ 紫色边框保留 */
    backdrop-filter: blur(8px); /* ✅ 毛玻璃模糊核心效果 */
    -webkit-backdrop-filter: blur(8px); /* ✅ 兼容Safari浏览器 */
}
h2 {
    color: #800080;
    text-align: center;
    margin-bottom: 30px;
    border-bottom: 2px solid #800080;
    padding-bottom: 10px;
    font-size: 28px;
    font-weight: bold;
}
span {
    font-family: 楷体;
    font-weight: bolder;
    color: #800080;
    font-size: 18px;
    display: inline-block;
    width: 120px;
}
input {
    margin-bottom: 15px;
    padding: 8px 10px;
    width: 350px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-family: 楷体;
    font-size: 16px;
    background-color: rgba(255,255,255,0.8); /* ✅ 输入框半透，匹配毛玻璃风格 */
}
select {
    margin-bottom: 15px;
    padding: 8px 10px;
    width: 370px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-family: 楷体;
    font-size: 16px;
    color: #666;
    background-color: rgba(255,255,255,0.8); /* ✅ 下拉框半透，匹配毛玻璃风格 */
}
.buttons {
    margin-top: 20px;
    text-align: center;
}
input[type="submit"], input[type="button"] {
    width: 140px;
    background-color: #800080;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 6px;
    cursor: pointer;
    font-family: 楷体;
    font-size: 16px;
    margin: 0 5px;
    transition: all 0.35s ease;
}
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #6a0dad;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
.tip {
    font-size: 14px;
    color: #666;
    margin-left: 125px;
    margin-top: -10px;
    margin-bottom: 15px;
    font-family: 楷体;
}
</style>
</head>
<body>
    <div class="container">
        <h2>新增教师信息</h2>
        <!-- ✅ 跳转逻辑、表单提交地址 完全未变，保留原始写法 -->
        <form action="addTeacher" method="post">
            <span>教师编号：</span>
            <input type="number" name="Tno" required placeholder="如：1007（数字，不可重复）"/><br>
            <div class="tip">提示：编号为数字类型，需唯一，如1001、1008等</div>
            
            <span>教师姓名：</span>
            <input type="text" name="Tname" required placeholder="如：张教授、李老师"/><br>
            
            <span>教师年龄：</span>
            <input type="number" name="Tage" placeholder="如：45（数字，可选）"/><br>
            <div class="tip">提示：仅输入数字，如30、42，不填则为空</div>
            
            <span>授课课程编号：</span>
            <select name="Cno">
                <option value="" selected>请选择（可选）</option>
                <option value="1">1 - 高等数学</option>
                <option value="2">2 - 大学英语（一）</option>
                <option value="3">3 - Java程序设计基础</option>
                <option value="4">4 - 数据库原理与应用</option>
                <option value="5">5 - 体育</option>
            </select><br>
            <div class="tip">提示：选择该教师授课的课程编号，不选则暂未分配课程</div>
            
            <div class="buttons">
                <input type="submit" value="新增教师"/>
                <!-- ✅ 返回跳转路径 完全未改，保持原始状态 -->
                <input type="button" value="返回管理中心" onclick="location.href='toManageteacher'"/>
            </div>
        </form>
    </div>
</body>
</html>