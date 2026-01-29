<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>注册遇到问题</title>
<!-- 引入Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- 引入Font Awesome -->
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

<style type="text/tailwindcss">
@layer utilities {
    .text-shadow {
        text-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .animate-float {
        animation: float 3s ease-in-out infinite;
    }
    @keyframes float {
        0% { transform: translateY(0px); }
        50% { transform: translateY(-10px); }
        100% { transform: translateY(0px); }
    }
}
</style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-50 min-h-screen flex items-center justify-center p-4">
    <div class="max-w-5xl w-full bg-white rounded-2xl shadow-xl overflow-hidden flex flex-col md:flex-row">
        <!-- 文字内容区域 -->
        <div class="flex-1 p-8 md:p-12 flex flex-col justify-center items-center md:items-start text-center md:text-left">
            <div class="mb-6 text-amber-500">
                <i class="fa fa-exclamation-circle text-5xl"></i>
            </div>
            <h1 class="text-[clamp(1.8rem,5vw,3rem)] font-bold text-gray-800 mb-4 text-shadow">
                注册遇到问题
            </h1>
            <p class="text-gray-600 text-lg mb-6 max-w-md">
                抱歉，无法完成注册。可能是网络问题或信息不完整。
            </p>
            <p class="text-gray-600 text-lg mb-8 max-w-md">
                请检查信息后重试，感谢您的耐心。
            </p>
            <!-- 关键修改：将href设为register.jsp -->
            <a href="toRegister" class="bg-blue-600 hover:bg-blue-700 text-white font-medium py-3 px-8 rounded-full transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                返回注册页面
            </a>
        </div>
        
        <!-- 动图区域 -->
        <div class="w-full md:w-2/5 bg-gray-50 flex items-center justify-center p-8 animate-float">
            <img src="img/456.gif" alt="注册失败提示动图" class="max-h-64 md:max-h-80 rounded-lg shadow-lg">
        </div>
    </div>
    
</body>
</html>