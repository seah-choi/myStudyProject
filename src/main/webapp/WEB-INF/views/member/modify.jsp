<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원정보 수정</title>
    <style>
        .card-body {
            width: 450px;
            margin: 0 auto;
            margin-top: 50px;
        }
        .form-floating {
            margin-top: 15px;
        }
        #head {
            text-align: center;
        }
        #btn {
            display: flex;
            justify-content: center;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<%@include file="../common/header.jsp"%>
<body>
<form name="frm" id="frm" method="post" action="/member/modify">
    <div class="card-body">
        <div id="head">
            <i class="bi bi-person-fill"></i>
            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
            </svg>
            <h1>Join</h1>
        </div>
        <br>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="user_id" id="user_id" value="${member.user_id}" maxlength="20" placeholder="id" readonly>
            <label for="user_id">id</label>
            <div id="div_err_user_id" style="display: none "></div>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" name="pwd" id="pwd" value="${member.password}" maxlength="100" placeholder="password">
            <label for="pwd">password</label>
            <div id="div_err_pwd" style="display: none "></div>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="name" id="name" value="${member.name}" maxlength="20" placeholder="name" readonly>
            <label for="name">name</label>
            <div id="div_err_name" style="display: none "></div>
        </div>
        <div class="form-floating mb-3">
            <input type="email" class="form-control" name="email" id="email" value="${member.email}" maxlength="100" placeholder="email" readonly>
            <label for="email">email</label>
            <div id="div_err_email" style="display: none "></div>
        </div>
        <br><br>
        <div id="btn">
            <button class="btn btn-primary btn-lg" type="submit" id="btn_save">저장</button>&nbsp;&nbsp;
            <button class="btn btn-secondary btn-lg" type="reset" id="btn_reset">취소</button>
        </div>
    </div>
</form>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
