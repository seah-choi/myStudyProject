<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>나의 학습 상세</title>
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
            width: 400px !important;
        }
    </style>
    <link href="signin.css" rel="stylesheet">
</head>
<%@ include file="../common/header.jsp"%>
<body class="text-center">
<div id="list">
    <div style="display: flex;margin-bottom: 20px;">
        <p style="font-size: 20px;font-weight: bold;"><a href="/myStudy/list">나의 학습</a> > <a href="/myStudy/view?study_idx=${myStudy.study_idx}">나의 학습 상세</a> </p>
    </div>
    <table class="table table-bordered border-primary-subtle">
        <thead>
        <tr>
            <th scope="col">제목</th>
            <td colspan="2">${myStudy.title}</td>
            <th scope="col">좋아요</th>
            <td>${myStudy.like}</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th colspan="2" style="font-weight: bold">등록일</th>
            <th>오늘의 학습 노출여부</th>
            <th colspan="2">오늘의 학습 노출기간</th>
        </tr>
        <tr>
            <td colspan="2">${myStudy.reg_date}</td>
            <td>${myStudy.display_status}</td>
            <td colspan="2">${myStudy.display_start} ~ ${myStudy.display_end}</td>
        </tr>
        </tbody>
    </table>
    <div style="display: flex">
        <img src="${myStudy.image}" id="img" width="400px" height="300px">
        <div>
            <textarea cols="90" rows="12" readonly>${myStudy.content}</textarea>
        </div>
    </div>
    <table class="table table-bordered border-primary-subtle">
        <thead>
        <tr>
            <th scope="col">공유한 사람</th>
            <td colspan="6">${myStudy.share_people}</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>분야</th>
            <td colspan="2">${myStudy.field}</td>
            <th>해시태그</th>
            <td colspan="3">${myStudy.hashtag}</td>
        </tr>
        </tbody>
    </table>
    <form id="frm" name="frm" action="/myStudy/delete" method="post">
        <input type="hidden" id="study_idx" name="study_idx" value="${myStudy.study_idx}">
        <div>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/myStudy/list'">목록</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/myStudy/modify?study_idx=${myStudy.study_idx}'">수정</button>
            <button type="submit" class="btn btn-outline-primary" id="delete_btn" onclick="godelete(event)" >삭제</button>
        </div>
    </form>
</div>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script>
    function godelete(e) {
        e.preventDefault();
        if(confirm("해당 글을 정말 삭제하시겠습니까?")) {
            alert("삭제되었습니다.");
            document.getElementById("frm").submit();
        } else {
            return false;
        }
    }
</script>
</html>


