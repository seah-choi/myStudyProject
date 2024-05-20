<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>나의 학습</title>
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">
    <style>
        #list{
            width: 1100px;
            margin: 150px auto 0;
        }
        #img {
            width: 300px !important;
        }
        #title {
            margin-bottom: 20px;
            margin-top: 5px;
            font-size: large;
            font-weight: 600;
            color: #6c757d;
        }
        #bt{
            display: flex;
            justify-content: center;
            margin-top: 30px;
            font-size: large;
            font-weight: 600;
            color: #754d4d;
        }
        #box {
            border: 1px solid #ccc;
            border-radius: 30px;
            padding: 25px;
            margin: 0 20px 0 20px;
        }
        .image {
            width: 180px !important;
            height: 200px;
            border-radius: 30px;
        }
        #box2 {
            display: flex;
            flex-direction: column;
        }
        #date{
            font-size: x-large;
            font-weight: 800;
            padding: 20px;
        }
    </style>
    <link href="signin.css" rel="stylesheet">
</head>
<%@ include file="../common/header.jsp"%>
<body class="text-center" id="content">
<div id="list">
    <div style="display: flex;margin-bottom: 20px;">
        <p style="font-size: 20px;font-weight: bold;"><a href="/myStudy/main">오늘의 학습</a> > <a href="/myStudy/main">홈</a> </p>
    </div>
    <div style="display: flex;padding: 30px;">
        <div id="date">
            <div>∧</div>
            <div>월</div>
            <div>화</div>
            <div>수</div>
            <div>목</div>
            <div>금</div>
            <div>토</div>
            <div>일</div>
            <div>∨</div>
        </div>
        <div id="box">
            <div style="display: flex;justify-content: center;">
                <img src="/resources/img/uploads/31b24068.webp" id="img" width="300px" height="300px">
                <div style="display: flex;flex-direction: column;margin-left: 20px;">
                    <span id="title">제목</span>
                    <textarea cols="40" rows="10">내용</textarea>
                </div>
            </div>
            <div id="bt">
                <div style="display: flex;flex-direction: column;margin-right: 250px;">
                    <span>일상, 공부</span>
                    <span>#태그</span>
                </div>
                <div style="display: flex;flex-direction: column;">
                    <span>공유한 사람1</span>
                    <span>공유한 사람2</span>
                </div>
            </div>
        </div>
        <div id="box2">
            <span style="font-size: large;font-weight: bold;color: #4da6e7;margin-bottom: 10px;">공유학습</span>
            <img src="/resources/img/study-group_thumbnail.png" class="image">
            <img src="/resources/img/what-is-study-planner1.png" class="image">
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>




