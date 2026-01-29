<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生管理系统 - 首页</title>
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
            .nav-item { position: relative; }
            .nav-item::after {
                content: ''; position: absolute; width: 0; height: 2px; bottom: -2px; left: 0;
                background-color: #FF9BB3; transition: width 0.3s ease;
            }
            .nav-item:hover::after { width: 100%; }
            .img-transition { transition: all 0.5s ease; }
            .img-transition:hover { transform: scale(1.05); }
            /* 新增：图片自适应，兼容尺寸不一致，不变形 */
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
    <!-- 头部背景图：school4.png -->
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
                <button onclick="window.location.href='toLogin'" class="bg-white text-primary px-4 py-2 rounded-full shadow-md hover:shadow-lg transition-all flex items-center">
                    <i class="fa fa-user-circle mr-2"></i> 登录
                </button>
                <button onclick="window.location.href='toRegister'" class="bg-accent text-dark px-4 py-2 rounded-full shadow-md hover:shadow-lg transition-all flex items-center">
                    <i class="fa fa-pencil-square-o mr-2"></i> 注册
                </button>
                <button onclick="window.location.href='toModifyPwd'" class="bg-white text-primary px-4 py-2 rounded-full shadow-md hover:shadow-lg transition-all flex items-center">
                    <i class="fa fa-key mr-2"></i> 修改密码
                </button>
            </div>
        </div>
    </header>

    <!-- 导航栏 -->
    <nav class="bg-white shadow-md sticky top-0 z-50">
        <div class="container mx-auto">
            <div class="flex items-center justify-between px-4 py-3">
                <div class="hidden md:flex space-x-6">
                    <a href="javascript:alert('请先登录后使用此功能！')" class="nav-item text-gray-400 font-bold cursor-not-allowed">修改学生信息</a>
                    <a href="javascript:alert('请先登录后使用此功能！')" class="nav-item text-gray-400 font-bold cursor-not-allowed">查看学生</a>
                    <a href="javascript:alert('请先登录后使用此功能！')" class="nav-item text-gray-400 font-bold cursor-not-allowed">课程管理</a>
                    <a href="javascript:alert('请先登录后使用此功能！')" class="nav-item text-gray-400 font-bold cursor-not-allowed">通知公告</a>
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

    <!-- 主内容区 -->
    <main class="flex-grow container mx-auto px-4 py-8">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            <!-- 左侧边栏 - 欢迎卡片【原版样式，作为复刻模板】 -->
            <aside class="lg:col-span-3 space-y-6">
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <h3 class="text-xl font-bold mb-4 text-primary flex items-center">
                        <i class="fa fa-heart text-accent mr-2"></i> 欢迎使用
                    </h3>
                    <div class="relative rounded-xl overflow-hidden mb-4">
                        <img src="img/school3.png" alt="欢迎界面动漫图" class="w-full h-48 object-cover img-transition">
                        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-dark/70 to-transparent p-3">
                            <p class="text-white font-bold">请登录系统以使用全部功能</p>
                        </div>
                    </div>
                    <p class="text-gray-600">
                        登录后可管理个人信息、查看课程与成绩，参与校园活动报名。
                    </p>
                </div>
            </aside>
            
            <!-- 中间内容区 -->
            <section class="lg:col-span-6 space-y-6">
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-2xl font-bold text-primary flex items-center">
                            <i class="fa fa-bullhorn text-accent mr-2"></i> 最新公告与资讯
                        </h2>
                        <a href="#" class="text-secondary hover:text-primary transition-colors">查看全部</a>
                    </div>
                    
                    <div class="space-y-6">
                        <div class="border-b border-gray-100 pb-5 last:border-0 last:pb-0">
                            <div class="flex items-start">
                                <div class="bg-primary/10 p-3 rounded-lg mr-4">
                                    <i class="fa fa-school text-2xl text-primary"></i>
                                </div>
                                <div class="flex-grow">
                                    <div class="flex justify-between">
                                        <h3 class="font-bold text-lg mb-1">2023-2024学年第一学期开学通知</h3>
                                        <span class="text-sm text-gray-500">2023-08-15</span>
                                    </div>
                                    <p class="text-gray-600 mb-2">新学期即将开始，现将开学相关事宜通知如下：报到时间为9月1日至9月2日，请学生携带身份证、录取通知书等...</p>
                                    <div class="flex items-center text-sm text-gray-500">
                                        <span class="flex items-center mr-4"><i class="fa fa-eye mr-1"></i> 1256</span>
                                        <a href="#" class="text-primary hover:underline">阅读更多</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="border-b border-gray-100 pb-5 last:border-0 last:pb-0">
                            <div class="flex items-start">
                                <div class="bg-secondary/10 p-3 rounded-lg mr-4">
                                    <i class="fa fa-user-circle text-2xl text-secondary"></i>
                                </div>
                                <div class="flex-grow">
                                    <div class="flex justify-between">
                                        <h3 class="font-bold text-lg mb-1">关于开展2023年度学生信息采集工作的通知</h3>
                                        <span class="text-sm text-gray-500">2023-08-10</span>
                                    </div>
                                    <p class="text-gray-600 mb-2">为完善学生信息管理系统，现开展2023年度学生信息采集工作，请各班级辅导员组织学生登录系统完成信息填写与...</p>
                                    <div class="flex items-center text-sm text-gray-500">
                                        <span class="flex items-center mr-4"><i class="fa fa-eye mr-1"></i> 987</span>
                                        <a href="#" class="text-primary hover:underline">阅读更多</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
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
            
            <!-- 右侧边栏 -->
            <aside class="lg:col-span-3 space-y-6">
                <!-- ✅ ✅ 核心修改：系统指南卡片 1:1 复刻「欢迎使用」样式 | 图片不变（school2.png） -->
                <div class="bg-white rounded-2xl shadow-lg p-6 card-hover">
                    <h3 class="text-xl font-bold mb-4 text-primary flex items-center">
                        <i class="fa fa-book text-accent mr-2"></i> 系统指南
                    </h3>
                    <!-- ✅ 完全复刻「欢迎使用」卡片的图片容器结构 -->
                    <div class="relative rounded-xl overflow-hidden mb-4">
                        <!-- ✅ 保留原图片 school2.png | 尺寸/动效和欢迎卡片完全一致 -->
                        <img src="img/lab.png" alt="系统使用指南" class="w-full h-48 img-auto-fit img-transition">
                        <!-- ✅ 复刻同款渐变遮罩文字层：样式/位置/颜色100%匹配 -->
                        <div class="absolute bottom-0 left-0 right-0 bg-gradient-to-t from-dark/70 to-transparent p-3">
                            <p class="text-white font-bold">功能全覆盖 · 轻松上手无压力💡</p>
                        </div>
                    </div>
                    <!-- ✅ 复刻底部说明文字样式 -->
                    <p class="text-gray-600">
                        详细介绍系统各项功能使用方法，含信息管理、课程选课、成绩查询等核心操作指南。
                    </p>
                </div>
                
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

    <!-- 页脚 -->
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
                        <li><a href="index.jsp" class="hover:text-primary transition-colors">系统首页</a></li>
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

    <!-- 移动端菜单 + 轮播图JS -->
    <script>
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
                        <li><a href="index.jsp" class="block py-2 border-b border-gray-100 text-dark hover:text-primary">首页</a></li>
                        <li><a href="javascript:alert('请先登录后使用此功能！')" class="block py-2 border-b border-gray-100 text-gray-400 cursor-not-allowed">学生管理</a></li>
                        <li><a href="javascript:alert('请先登录后使用此功能！')" class="block py-2 border-b border-gray-100 text-gray-400 cursor-not-allowed">课程管理</a></li>
                        <li><a href="javascript:alert('请先登录后使用此功能！')" class="block py-2 border-b border-gray-100 text-gray-400 cursor-not-allowed">成绩管理</a></li>
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

        // 欢迎卡片轮播图配置：school1/2/3.png
        const welcomeImg = document.querySelector('img[alt="欢迎界面动漫图"]');
        const welcomeImages = ["img/school1.png", "img/school2.png", "img/school3.png"];
        let welcomeIndex = 0;
        
        setInterval(() => {
            welcomeIndex = (welcomeIndex + 1) % welcomeImages.length;
            welcomeImg.src = welcomeImages[welcomeIndex];
        }, 5000);
    </script>
</body>
</html>