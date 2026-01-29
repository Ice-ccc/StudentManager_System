<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>操作失败</title>
<style type="text/css">
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* ✅ 保留你的动图背景，未做任何修改 */
body{
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    background-image: url("img/123.gif");
    background-size: 50%; 
    background-position: center center;
    background-repeat: no-repeat;
    background-color: #fff;
    background-attachment: fixed;
    margin: 0;
    padding: 20px;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
}

/* ✅ 毛玻璃遮罩：动图不挡字，提升可读性 */
body::before {
    content: "";
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    background-color: rgba(255, 255, 255, 0.6);
    backdrop-filter: blur(3px);
    z-index: -1;
}

/* ✅ 主容器：所有文字严格在框内，宽度适配内容 */
.main-container {
    width: 520px;
    background-color: rgba(255, 255, 255, 0.7);
    backdrop-filter: blur(8px);
    border-radius: 16px;
    padding: 30px 25px;
    text-align: center;
    border: 1px solid rgba(255,255,255,0.9);
    box-shadow: 0 8px 25px rgba(128, 0, 128, 0.15);
    margin-bottom: 25px;
}

/* ✅ 标题样式：全部在框内，层级清晰 */
h1 {
    color: #800080;
    font-weight: bolder;
    font-size: 23px;
    line-height: 1.5;
    margin-bottom: 10px;
    word-break: keep-all; /* 关键：文字不换行，保证完整在框内 */
    white-space: nowrap;  /* 关键：禁止文字换行溢出 */
}
.title-main {
    font-size: 27px;
    margin-bottom: 18px;
}
.countdown-box {
    color: #800080;
    font-size: 21px;
    font-weight: bold;
    margin: 12px 0;
    padding: 8px;
}
#countdown {
    color: #dc3545;
    font-size: 25px;
    font-weight: bolder;
    padding: 0 6px;
}

/* ✅ 错误信息：红色强调，严格在框内 */
.error-details {
    color: #dc3545;
    font-size: 19px;
    font-weight: bold;
    padding: 10px 12px;
    margin: 8px 0 18px;
    background-color: rgba(220, 53, 69, 0.1);
    border-radius: 10px;
    line-height: 1.4;
    word-break: break-all; /* 超长错误信息自动换行，不溢出 */
}

/* ✅ 核心修改：按钮宽度足够，✨星星+文字100%全在框内！ */
.linkBox {
    margin: 12px 0;
}
.linkBox a {
    display: inline-block;
    width: 290px; /* 加宽到足够容纳✨+完整文字，绝不溢出 */
    height: 52px;
    line-height: 52px;
    background-color: transparent;
    color: #800080;
    border: 2px solid #800080;
    border-radius: 10px;
    text-align: center;
    text-decoration: none;
    font-family: "楷体", sans-serif;
    font-size: 18px;
    font-weight: bold;
    transition: all 0.3s ease;
    padding: 0 10px; /* 左右留足空隙，内容不贴边 */
}
/* ✅ hover动效保留，样式不变 */
.linkBox a:hover {
    background-color: #800080;
    color: #fff;
    transform: translateY(-3px);
    box-shadow: 0 8px 15px rgba(128, 0, 128, 0.2);
}

/* ✅ 响应式适配：小屏自动缩放，所有内容仍在框内 */
@media (max-width: 550px) {
    .main-container {
        width: 100%;
        padding: 22px 18px;
    }
    h1 { font-size: 20px; white-space: normal; }
    .title-main { font-size: 23px; }
    #countdown { font-size: 22px; }
    .linkBox a {
        width: 260px;
        height: 48px;
        line-height: 48px;
        font-size: 17px;
    }
    body {
        background-size: 80%;
        padding: 15px;
    }
}
</style>
</head>
<body>
    <div class="main-container">
        <h1 class="title-main">哎呀~ 操作失败了 😣</h1>
        
        <%-- 保留后端取值逻辑，未修改 --%>
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg == null || msg.trim().isEmpty()) {
                msg = "操作失败，请重试";
            }
        %>
        <div class="error-details"><%= msg %></div>

        <h1>请检查信息是否正确后重新尝试~</h1>
        
        <div class="countdown-box">
            自动跳回操作页面还剩 <span id="countdown">20</span> 秒 ⏳
        </div>
        <h1>耐心等一下下哦~</h1>
    </div>

    <%-- ✅ 星星✨直接写在a标签内，和文字一起全部在按钮框里！ --%>
    <div class="linkBox">
       <a href="${pageContext.request.contextPath}/toDeleteStudent">✨ 回到信息修改/删除页面 ✨</a>
    </div>
    <div class="linkBox">
       <a href="${pageContext.request.contextPath}/toMain">🏠 返回首页 🏠</a>
    </div>

<script type="text/javascript">
    // ✅ 倒计时JS未修改，正常生效
    let countdown = 20;
    const countdownEl = document.getElementById('countdown');
    const timer = setInterval(() => {
        countdown--;
        countdownEl.textContent = countdown;
        if (countdown <= 0) {
            clearInterval(timer);
            window.location.href = "${pageContext.request.contextPath}/toDeleteStudent";
        }
    }, 1000);
</script>
</body>
</html>