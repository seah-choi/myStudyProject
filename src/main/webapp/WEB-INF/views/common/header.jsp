<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>DigiMedia - Creative SEO HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-digimedia-v3.css">
    <link rel="stylesheet" href="/resources/assets/css/animated.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">

</head>

<body>

<!-- ***** Preloader Start ***** -->
<div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- ***** Preloader End ***** -->

<!-- Pre-header Starts -->
<div class="pre-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-sm-8 col-7">
                <ul class="info">
                    <li><a href="#"><i class="fa fa-envelope"></i>chltpdk120@naver.com</a></li>
                    <li><a href="#"><i class="fa fa-phone"></i>010-3916-4103</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-sm-4 col-5">
                <ul class="social-media">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-behance"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Pre-header End -->

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/" class="logo">
                        <img src="/resources/assets/images/logo-v3.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="/" class="active">Home</a></li>
                        <c:if test="${not empty loginMemberDTO}">
                            <li class="scroll-to-section"><a href="/member/view?user_id=${user_id}">마이페이지</a></li>
                            <li class="scroll-to-section"><a href="/myStudy/main">오늘의 학습</a></li>
                            <li class="scroll-to-section"><a href="/myStudy/list">나의 학습</a></li>
                            <li class="scroll-to-section"><a href="/shareStudy/list">공유학습</a></li>
                            <li><span style="font-weight: bold">${sessionScope.name}</span>님</li>
                            <li><span onclick="logout(event)">로그아웃</span></li>
                        </c:if>
                        <c:if test="${empty loginMemberDTO}">
                            <li><div class="border-first-button"><a href="/member/join">Join</a></div></li>
                            <li><div class="border-first-button"><a href="/login/login">Login</a></div></li>
                        </c:if>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/owl-carousel.js"></script>
<script src="/resources/assets/js/animation.js"></script>
<script src="/resources/assets/js/imagesloaded.js"></script>
<script src="/resources/assets/js/custom.js"></script>
<script>
    function logout(e) {
        e.preventDefault();
        if(confirm("로그아웃 하시겠습니까?")) {
            location.href="/login/logout";
        } else {
            return false;
        }
    }
</script>
<!-- ***** Header Area End ***** -->
