<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>비밀번호 찾기</title>
    <style>
        .card-body {
            width: 550px;
            margin: 0 auto;
            margin-top: 150px;
        }
        .form-floating {
            margin-top: 15px;
        }
        #h4 {
            text-align: center;
        }
        #text > p {
            color: #5d5d5d !important;
        }
        #btn2 > button:hover, #btn2 > button:focus {
            background-color: #9ba3ab;
        }

        #text {
            margin-top: 40px;
            margin-bottom: 40px;
        }

        #img0{
            width: 30px;
            height: 30px;
            margin-top: 10px;
            margin-left: 5px;
        }
        #img1{
            width: 30px;
            height: 30px;
            margin-top: 10px;
            margin-left: 5px;
        }
        #img2{
            width: 30px;
            height: 30px;
            margin-top: 10px;
            margin-left: 5px;
        }
        #btn {
            display: flex;
            justify-content: center;
            background-color: #4da6e7;
            height: 60px;
            border-radius: 7px;
            width: 150px;
        }
        #btn2 {
            display: flex;
            justify-content: center;
            background-color: #9ba3ab;
            height: 60px;
            border-radius: 7px;
            width: 150px;
        }
        #btn2 > button:hover, #btn2 > button:focus {
            background-color: #9ba3ab;
        }

        #box{
            display: flex;
            justify-content: center;
        }

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<%@include file="../common/header.jsp"%>
<body>
<form name="frm" id="frm" method="post" action="/login/pwdChange">
    <div class="card-body">
        <input type="hidden" name="user_id" id="user_id" value="${id}">
        <div id="h4">
            <h4 style="font-weight: bold;">개인정보를 위해 비밀번호를 변경하세요.</h4>
        </div>
        <br>
        <div class="form-floating mb-3" style="display: flex">
            <input type="password" class="form-control" name="oldpassword" id="oldpassword" maxlength="100" placeholder="비밀번호 입력">
            <label for="oldpassword">이전 비밀번호</label>
            <img src="/resources/img/checked_711239.png" id="img0">
        </div>
        <div class="result" style="font-size: small;"></div>
        <div class="form-floating mb-3" style="display: flex">
            <input type="password" class="form-control" name="password" id="newpassword" maxlength="100" placeholder="비밀번호 입력">
            <label for="newpassword">새 비밀번호</label>
            <img src="/resources/img/checked_711239.png" id="img1">
        </div>
        <div id="result" class="result" style="font-size: small;"></div>
        <div class="form-floating mb-3" style="display: flex">
            <input type="password" class="form-control" name="password2" id="password2" maxlength="100" placeholder="비밀번호 확인">
            <label for="password2">새 비밀번호 확인</label>
            <img src="/resources/img/checked_711239.png" id="img2">
        </div>
        <div id="result2" class="result" style="font-size: small;"></div>
        <div id="text">
            <p>* 10자 이상의 영문 소문자, 숫자, 특수문자를 모두 조합하여 설정하여 주세요.</p>
            <p>* 아이디와 같은 패스워드는 사용할 수 없습니다.</p>
            <p>* 생년월일, 주민등록번호, 연속된 숫자 등의 패스워드 사용은 삼가해주세요.</p>
        </div>
        <div id="box">
            <button class="btn" id ="btn" type="submit"><span style="color: #fff;font-size: large;margin-top: 10px;">저장</span></button>&nbsp;&nbsp;
            <button class="btn" id ="btn2" type="reset"><span style="color: #fff;font-size: large;margin-top: 10px;">취소</span></button>
        </div>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

    document.querySelector("#newpassword").addEventListener("keyup", function (){
        let pwdCheck = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{10,20}$/;
        let newpassword = document.querySelector("#newpassword").value;
        let oldpassword = `${pwd}`;
        let img = document.querySelector("#img1");
        let result = document.querySelector("#result");
        let id = document.querySelector("#user_id").value;


        if(pwdCheck.test(newpassword)){
            img.src = "/resources/img/green_check.png";
            result.innerHTML = "";
        } else if(id === newpassword){
            result.innerHTML = "* 아이디와 비밀번호는 같을 수 없습니다.";
            result.style.color = "red";
            img.src = "/resources/img/red_check.png"
        } else if(oldpassword === newpassword) {
            result.innerHTML = "* 기존 비밀번호와 동일한 비밀번호는 사용할 수 없습니다.";
            result.style.color = "red";
            img.src = "/resources/img/red_check.png"
        }
        else{
            result.innerHTML = "* 10자 이상의 영소문자, 숫자, 특수문자를 포함하여 입력해주세요.";
            result.style.color = "red";
            img.src = "/resources/img/red_check.png"
        }
    })

    document.querySelector("#password2").addEventListener("keyup", function (){
        let newpassword = document.querySelector("#newpassword").value;
        let password2 = document.querySelector("#password2").value;
        let img = document.querySelector("#img2");
        let result = document.querySelector("#result2");

        if(newpassword === password2){
            img.src = "/resources/img/green_check.png";
            result.innerHTML = "";
        } else{
            result.innerHTML = "* 비밀번호가 동일하지 않습니다.";
            result.style.color = "red";
            img.src = "/resources/img/red_check.png"
        }
    })

    document.querySelector("#btn").addEventListener("click", function (e){
        e.preventDefault();

        let oldpassword = document.querySelector("#oldpassword");
        let newpassword = document.querySelector("#newpassword");
        let password2 = document.querySelector("#password2");
        let result = document.querySelectorAll(".result");
        let frm = document.querySelector("#frm");

        if(oldpassword.value == null || oldpassword.value == ""){
            result[0].innerHTML="이전 비밀번호를 입력해주세요.";
            result[0].style.color="red";
            return false;
        } else {
            result[0].innerHTML ="";
        }
        if(newpassword.value == null || newpassword.value == ""){
            result[1].innerHTML="새 비밀번호를 입력해주세요.";
            result[1].style.color="red";
            return false;
        } else {
            result[1].innerHTML ="";
        }
        if(password2.value == null || password2.value == ""){
            result[2].innerHTML="새 비밀번호를 확인해주세요.";
            result[2].style.color="red";
            return false;
        } else {
            result[2].innerHTML ="";
        }

        alert("비밀번호가 변경되었습니다.");
        frm.submit();
    })

</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>


