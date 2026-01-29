<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录失败</title>
<script src="https://cdn.tailwindcss.com"></script>
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
<body class="bg-gradient-to-br from-gray-50 to-gray-100 min-h-screen flex items-center justify-center p-4">
    <div class="max-w-5xl w-full bg-white rounded-2xl shadow-xl overflow-hidden flex flex-col md:flex-row">
        <div class="flex-1 p-8 md:p-12 flex flex-col justify-center items-center md:items-start text-center md:text-left">
            <div class="mb-6 text-red-500">
                <i class="fa fa-times-circle text-5xl"></i>
            </div>
            <h1 class="text-[clamp(1.8rem,5vw,3rem)] font-bold text-gray-800 mb-4 text-shadow">
                登录失败
            </h1>
            <p class="text-gray-600 text-lg mb-6 max-w-md">
                抱歉，用户名或密码不正确，请重新输入。
            </p>
            <p class="text-gray-600 text-lg mb-8 max-w-md">
                请检查您的登录信息，确保输入正确。
            </p>
            <a href="toLogin" class="bg-blue-600 hover:bg-blue-700 text-white font-medium py-3 px-8 rounded-full transition-all duration-300 transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                返回登录页面
            </a>
        </div>
        <div class="w-full md:w-2/5 bg-gray-50 flex items-center justify-center p-8 animate-float">
            <img src="img/789.gif" alt="登录失败提示图" class="max-h-64 md:max-h-80 rounded-lg shadow-lg">
        </div>
    </div>
</body>
</html>