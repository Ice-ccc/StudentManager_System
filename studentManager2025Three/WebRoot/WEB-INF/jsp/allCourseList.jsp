<%@ page language="java" import="java.util.List,com.pojo.Course" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>所有课程列表</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
* {margin: 0;padding: 0;box-sizing: border-box;}
body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
}
/* ✅ 核心改造：添加2px深紫色主边框 + 毛玻璃效果 + 统一圆角阴影 */
#courseBox {
    margin: 3% auto 0;
    width: 1000px;
    padding: 30px 20px;
    border-radius: 16px;
    background-color: rgba(255, 255, 255, 0.45);
    box-shadow: 0 8px 24px rgba(128, 0, 128, 0.15);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080; /* ✅ 必加：深紫色主边框，全项目统一 */
}
/* ✅ 表格样式优化：适配毛玻璃风格，配色统一主色系 */
table {
    width: 100%;
    border-collapse: collapse;
}
td, th {
    text-align: center;
    height: 45px;
    font-size: 17px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
}
/* ✅ 表头样式：深紫底色+白字，匹配项目主色系 */
th {
    background-color: #800080;
    color: white;
    font-weight: bold;
    font-size: 18px;
}
/* ✅ 表格行样式：hover高亮+浅紫边框，强化交互与风格统一 */
.showTR {
    border-bottom: 1px solid rgba(128, 0, 128, 0.2);
}
.showTR:hover {
    background-color: rgba(128, 0, 128, 0.08);
    font-weight: bold;
    color: #800080;
    font-size: 18px;
}
/* ✅ 返回按钮容器：居中排版，适配整体风格 */
.back-btn {
    text-align: center;
    margin-top: 30px;
}
/* ✅ 按钮统一：紫框透明底+hover填充特效，与所有页面按钮一致 */
.back-button {
    display: inline-block;
    width: 140px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    padding: 10px 0;
    border-radius: 8px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font-size: 17px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: bold;
    margin: 0 10px;
    transition: all 0.35s ease;
}
.back-button:hover {
    background-color: #800080;
    color: #ffffff;
    text-decoration: none;
    box-shadow: 0 5px 12px rgba(128, 0, 128, 0.2);
}
/* ✅ 错误提示样式：深紫配色+毛玻璃，统一项目风格 */
.errorMsg {
    color: #800080;
    text-align: center;
    margin: 15px auto;
    width: fit-content;
    padding: 10px 25px;
    border-radius: 8px;
    background-color: rgba(255, 255, 255, 0.45);
    font-size: 17px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: 500;
    border: 1px solid rgba(128,0,128,0.2);
}
/* ✅ 分页控件样式优化：毛玻璃+紫系配色，与整体风格统一 */
.pagination {
    margin: 30px auto;
    width: fit-content;
    text-align: center;
    padding: 15px 25px;
    border-radius: 12px;
    background-color: rgba(255, 255, 255, 0.45);
    backdrop-filter: blur(5px);
    border: 1px solid rgba(128,0,128,0.2);
}
.pagination button, .pagination input, .pagination span {
    padding: 8px 12px;
    margin: 0 5px;
    border: 1px solid rgba(128,0,128,0.2);
    border-radius: 6px;
    background-color: rgba(255,255,255,0.6);
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-size: 16px;
}
.pagination button:hover {
    background-color: rgba(128, 0, 128, 0.1);
    color: #800080;
    cursor: pointer;
}
.pagination .disabled {
    color: #999;
    cursor: not-allowed;
    background-color: rgba(255,255,255,0.3);
}
.pagination input {width: 60px;text-align: center;}
</style>

<!-- 分页跳转脚本 -->
<script type="text/javascript">
function jumpCoursePage() {
    var pageNo = document.getElementById("coursePageNoInput").value;
    window.location.href = "${pageContext.request.contextPath}/showAllCourseByPageNo?pageNo=" + pageNo;
}
</script>

</head>
<body>
    <!-- 返回按钮 -->
    <div class="back-btn">
        <a href="${pageContext.request.contextPath}/toQueryCourse" class="back-button">返回查询页面</a>
        <a href="${pageContext.request.contextPath}/toMain" class="back-button">返回首页</a>
    </div>

    <div id="courseBox">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th width="25%">课程编号</th>
                <th width="25%">课程名称</th>
                <th width="25%">课程学分</th>
                <th width="25%">课程备注</th>
            </tr>
            <%
                List<Course> allCourse = (List<Course>) session.getAttribute("allCourse");
                if (allCourse != null && !allCourse.isEmpty()) {
                    for (Course c : allCourse) {
            %>
            <tr class="showTR">
                <td> <%=c.getCno() %> </td>
                <td> <%=c.getCname()%> </td>
                <td> <%=c.getCredit() %> </td>
                <td> <%=c.getComment() != null ? c.getComment() : "无" %> </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" style="color: #800080; text-align: center; height: 60px; font-size:18px;">暂无课程信息！</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

    <!-- 分页控件 -->
    <div class="pagination">
        <%
            Integer currentPage = (Integer) session.getAttribute("currentPage");
            Integer totalPages = (Integer) session.getAttribute("totalPages");
            Integer totalCount = (Integer) session.getAttribute("totalCount");
            if (currentPage == null) currentPage = 1;
            if (totalPages == null) totalPages = 1;
            if (totalCount == null) totalCount = 0;
        %>
        <button onclick="window.location.href='${pageContext.request.contextPath}/showAllCourseByPageNo?pageNo=1'" 
                <%=currentPage == 1 ? "class='disabled'" : "" %>>首页</button>
        <button onclick="window.location.href='${pageContext.request.contextPath}/coursePrevPage'" 
                <%=currentPage == 1 ? "class='disabled'" : "" %>>上一页</button>
        <span>当前第 <%=currentPage%> 页 / 共 <%=totalPages%> 页（总计 <%=totalCount%> 条）</span>
        <input type="text" id="coursePageNoInput" placeholder="页号">
        <button onclick="jumpCoursePage()">跳转</button>
        <button onclick="window.location.href='${pageContext.request.contextPath}/courseNextPage'" 
                <%=currentPage == totalPages ? "class='disabled'" : "" %>>下一页</button>
        <button onclick="window.location.href='${pageContext.request.contextPath}/showAllCourseByPageNo?pageNo=<%=totalPages%>'" 
                <%=currentPage == totalPages ? "class='disabled'" : "" %>>尾页</button>
    </div>

    <!-- 错误信息 -->
    <% String errorMsg = (String) session.getAttribute("errorMsg"); %>
    <% if (errorMsg != null && !errorMsg.trim().isEmpty()) { %>
        <div class="errorMsg"><%= errorMsg %></div>
        <% session.removeAttribute("errorMsg"); %>
    <% } %>
</body>
</html>