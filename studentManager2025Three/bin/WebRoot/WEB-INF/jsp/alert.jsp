<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>提示信息</title>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
/* ✅ 全局背景 - 与课程/教师/新增页面1:1完全统一 */
body {
    margin: 0;
    padding: 0;
    min-height: 100vh;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    background-image: url("${pageContext.request.contextPath}/img/loginbackground.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

/* ✅ 全屏遮罩层 - 优化透明度+模糊，突出弹窗层级 */
.mask {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.2); /* 浅遮罩不刺眼 */
    display: flex;
    justify-content: center;
    align-items: center;
    backdrop-filter: blur(3px); /* 底层轻微模糊，增强氛围感 */
}

/* ✅ 弹窗主体 - 核心修改：添加紫色边框 + 毛玻璃风格+极致美化 */
.alert-box {
    width: 480px; /* 加宽更大气，适配文字阅读 */
    background-color: rgba(255, 255, 255, 0.45);
    border-radius: 20px; /* 大圆角更柔和，符合项目规范 */
    padding: 50px 30px;
    text-align: center;
    box-shadow: 0 10px 30px rgba(128, 0, 128, 0.15); /* 柔化阴影更高级 */
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 2px solid #800080; /* ✅ 重点：弹窗添加2px深紫色边框，醒目统一 */
}

/* ✅ 提示图标 - 深紫配色+放大，匹配项目主色系 */
.alert-icon {
    font-size: 80px;
    color: #800080; /* 项目统一深紫色，无视觉割裂 */
    margin-bottom: 25px;
    line-height: 1;
}

/* ✅ 提示文字 - 楷体优先+字号适配，保障最佳阅读体验 */
.alert-message {
    font-size: 22px;
    color: #333333;
    margin-bottom: 40px;
    line-height: 1.8; /* ✅ 加大行高，大幅提升文字阅读舒适度 */
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    font-weight: 500;
    padding: 0 15px; /* 左右留白，避免文字贴边 */
}

/* ✅ 核心保留：紫色边框+透明底色按钮（高级镂空样式）- hover渐变特效 */
.confirm-btn {
    width: 220px;
    height: 50px;
    background-color: transparent; /* 透明底色 */
    color: #800080; /* 深紫文字 */
    border: 2px solid #800080; /* 紫色边框，和弹窗边框呼应 */
    border-radius: 30px; /* 胶囊圆角极致美化 */
    font-size: 18px;
    font-family: "楷体", "Microsoft YaHei", sans-serif;
    cursor: pointer;
    transition: all 0.35s ease; /* 丝滑过渡 */
    font-weight: bold;
}
/* ✅ 按钮hover特效 - 边框变填充+文字变白，交互更高级 */
.confirm-btn:hover {
    background-color: #800080;
    color: #ffffff;
    box-shadow: 0 5px 15px rgba(128, 0, 128, 0.2);
}

/* ✅ 倒数秒数 - 深紫高亮+放大，醒目且统一风格 */
.countdown {
    color: #800080;
    font-weight: bold;
    font-size: 22px;
    margin: 0 3px;
}
</style>
</head>
<body>
    <!-- 遮罩层 -->
    <div class="mask">
        <!-- 自定义弹窗 - 带紫色边框 -->
        <div class="alert-box">
            <!-- 错误图标（统一深紫色） -->
            <div class="alert-icon">⚠️</div>
            <!-- 提示文字（读取后端errorMsg，保障功能完整） -->
            <div class="alert-message">
                <%= request.getAttribute("errorMsg") != null ? request.getAttribute("errorMsg") : "操作异常！" %>
            </div>
            <!-- 紫色边框透明底按钮 + 倒计时 -->
            <button class="confirm-btn" onclick="history.back()">
                确认（<span class="countdown">5</span>秒后自动返回）
            </button>
        </div>
    </div>

    <script type="text/javascript">
        // 获取倒数元素
        const countdownEl = document.querySelector('.countdown');
        let seconds = 5;

        // 倒计时定时器
        const countdownInterval = setInterval(() => {
            seconds--;
            countdownEl.textContent = seconds;
            if (seconds <= 0) {
                clearInterval(countdownInterval);
                history.back();
            }
        }, 1000);

        // 点击按钮清除定时器，避免重复回退
        document.querySelector('.confirm-btn').addEventListener('click', () => {
            clearInterval(countdownInterval);
        });
    </script>
</body>
</html>