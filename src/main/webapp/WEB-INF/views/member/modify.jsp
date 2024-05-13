<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>회원정보 수정</title>
    <style>
        .card-body {
            width: 450px;
            margin: 0 auto;
            margin-top: 150px;
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
        #phone_number3, #phone_number2 {
            width: 130px;
        }
        #phone_number2 {
            margin-right: 20px;
        }
        #tel {
            display: flex;
        }
        #em {
            display: flex;
        }
        #email {
            width: 200px;
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
            <h1>Modify</h1>
        </div>
        <br>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="user_id" id="user_id" value="${member.user_id}" maxlength="20" placeholder="id" readonly>
            <label for="user_id">id</label>
            <div id="div_err_user_id" style="display: none "></div>
        </div>
        <c:if test="${password == null || password == ''}">
            <input type="hidden" name="password" value="${member.password}">
        </c:if>
        <div class="form-floating mb-3" style="display: flex">
            <input type="password" class="form-control" name="password" id="password" maxlength="100" placeholder="비밀번호 입력">
            <label for="password">비밀번호 입력</label>
            <img src="/resources/img/checked_711239.png" id="img1">
            <div id="div_err_password" style="display: none "></div>
        </div>
        <div id="result" style="font-size: small;"></div>
        <div class="form-floating mb-3" style="display: flex">
            <input type="password" class="form-control" name="password2" id="password2" maxlength="100" placeholder="비밀번호 확인">
            <label for="password2">비밀번호 확인</label>
            <img src="/resources/img/checked_711239.png" id="img2">
            <div id="div_err_password2" style="display: none "></div>
        </div>
        <div id="result2" style="font-size: small;"></div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="name" id="name" value="${member.name}" maxlength="20" placeholder="name" readonly>
            <label for="name">name</label>
            <div id="div_err_name" style="display: none "></div>
        </div>
        <div class="form-floating mb-3" id="em">
            <input type="text" class="form-control" name="email1" id="email1" value="${fn:split(member.email,'@')[0]}" maxlength="20" placeholder="email">
            <label for="email1">email</label>
            <select class="form-select form-select-lg mb-3" aria-label="Large select example" name="email2" id="email2" style="width: 200px;font-size: initial;margin-left: 20px;">
                <option value="@naver.com" ${fn:split(member.email,'@')[1] =="naver.com" ? "selected" : ""}>@naver.com</option>
                <option value="@gmail.com" ${fn:split(member.email,'@')[1] =="gmail.com" ? "selected" : ""}>@gmail.com</option>
                <option value="@hanmail.com" ${fn:split(member.email,'@')[1] =="hanmail.com" ? "selected" : ""}>@hanmail.com</option>
                <option value="@nate.com" ${fn:split(member.email,'@')[1] =="nate.com" ? "selected" : ""}>@nate.com</option>
            </select>
            <div id="div_err_email" style="display: none "></div>
        </div>
        <div class="form-floating mb-3" id="tel">
            <select class="form-select form-select-lg mb-3" aria-label="Large select example" name="phone_number1" id="phone_number1" style="width: 120px;font-size: initial;margin-right: 20px;">
                <option value="010" ${fn:substring(member.phone_number,0,3) =="010" ? "selected" : ""}>010</option>
                <option value="011" ${fn:substring(member.phone_number,0,3) =="011" ? "selected" : ""}>011</option>
                <option value="016" ${fn:substring(member.phone_number,0,3) =="016" ? "selected" : ""}>016</option>
                <option value="017" ${fn:substring(member.phone_number,0,3) =="017" ? "selected" : ""}>017</option>
                <option value="018" ${fn:substring(member.phone_number,0,3) =="018" ? "selected" : ""}>018</option>
            </select>
            <label for="phone_number1">phone</label>
            <input type="text" class="form-control" name="phone_number2" id="phone_number2" value="${fn:substring(member.phone_number,4,8) }" maxlength="4" placeholder="phone_number">
            <input type="text" class="form-control" name="phone_number3" id="phone_number3" value="${fn:substring(member.phone_number,9,14) }" maxlength="4" placeholder="phone_number">
            <div id="div_err_phone_number" style="display: none "></div>
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

<script>
    document.querySelector("#password").addEventListener("keyup", function (){
        let pwdCheck = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{10,20}$/;
        let newpassword = document.querySelector("#password").value;
        let oldpassword = `${member.password}`;
        let img = document.querySelector("#img1");
        let result = document.querySelector("#result");
        let id = document.querySelector("#user_id").value;


        if(pwdCheck.test(newpassword)){
            img.src = "/resources/img/green_check.png";
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
        let password = document.querySelector("#password").value;
        let password2 = document.querySelector("#password2").value;
        let img = document.querySelector("#img2");
        let result = document.querySelector("#result2");

        if(password === password2){
            img.src = "/resources/img/green_check.png";
        } else{
            result.innerHTML = "* 비밀번호가 동일하지 않습니다.";
            result.style.color = "red";
            img.src = "/resources/img/red_check.png"
        }
    })
</script>
</body>
</html>
