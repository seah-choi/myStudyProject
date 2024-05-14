<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원가입</title>
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
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<%@include file="../common/header.jsp"%>
<body>
<form name="frm" id="frm" method="post" action="/member/join">
    <div class="card-body">
        <div id="head">
            <i class="bi bi-person-fill"></i>
            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
            </svg>
            <h1>Join</h1>
        </div>
        <br>
        <div class="form-floating mb-3" style="display: flex">
            <input type="text" class="form-control" name="user_id" id="user_id" maxlength="20" placeholder="id" style="width: 320px;">
            <label for="user_id">id</label>
            <div class="col-auto">
                <button class="btn btn-primary" type="button" id="button-addon2" style="height: 55px;" id="idCheck" onclick="idCheck();">중복확인</button>
            </div>
        </div>
        <div class="result" style="font-size: small;"></div>
        <div class="form-floating mb-3" style="display: flex">
            <input type="password" class="form-control" name="password" id="password" maxlength="100" placeholder="비밀번호 입력">
            <label for="password">비밀번호 입력</label>
            <img src="/resources/img/checked_711239.png" id="img1">
        </div>
        <div id="result" style="font-size: small;"></div>
        <div class="form-floating mb-3" style="display: flex">
            <input type="password" class="form-control" name="password2" id="password2" maxlength="100" placeholder="비밀번호 확인">
            <label for="password2">비밀번호 확인</label>
            <img src="/resources/img/checked_711239.png" id="img2">
        </div>
        <div id="result2" style="font-size: small;"></div>
        <div class="result" style="font-size: small;"></div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="name" id="name" maxlength="20" placeholder="name">
            <label for="name">name</label>
        </div>
        <div class="result" style="font-size: small;"></div>
        <div class="form-floating mb-3" id="em">
            <input type="text" class="form-control" name="email1" id="email1" maxlength="20" placeholder="email">
            <label for="email1">email</label>
            <select class="form-select form-select-lg mb-3" aria-label="Large select example" name="email2" id="email2" style="width: 200px;font-size: initial;margin-left: 20px;">
                <option value="@naver.com">@naver.com</option>
                <option value="@gmail.com">@gmail.com</option>
                <option value="@hanmail.com">@hanmail.com</option>
                <option value="@nate.com">@nate.com</option>
            </select>
        </div>
        <div class="result" style="font-size: small;"></div>
        <div class="form-floating mb-3" id="tel">
            <select class="form-select form-select-lg mb-3" aria-label="Large select example" name="phone_number1" id="phone_number1" style="width: 120px;font-size: initial;margin-right: 20px;">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
            </select>
            <label for="phone_number1">phone</label>
            <input type="text" class="form-control" name="phone_number2" id="phone_number2" maxlength="4" placeholder="phone_number">
            <input type="text" class="form-control" name="phone_number3" id="phone_number3" maxlength="4" placeholder="phone_number">
        </div>
        <div class="result" style="font-size: small;"></div>
        <br><br>
        <div id="btn">
            <button class="btn btn-primary btn-lg" type="submit" id="btn_save">가입</button>&nbsp;&nbsp;
            <button class="btn btn-secondary btn-lg" type="reset" id="btn_reset">취소</button>
        </div>
    </div>
</form>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    <%--const severValResult = {};--%>
    <%--<c:forEach items="${errors}" var="err">--%>
    <%--if(document.getElementById("div_err_${err.getField()}") != null ) {--%>
    <%--    document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color: red'>${err.getField()}를 다시 입력해주세요. </span>";--%>
    <%--    document.getElementById("div_err_${err.getField()}").style.display = "block";--%>
    <%--}--%>
    <%--severValResult['${err.getField()}'] = '${err.defaultMessage}';--%>
    <%--</c:forEach>--%>

    <%--console.log(severValResult);--%>

    let user_id = document.querySelector("#user_id");
    let name = document.querySelector("#name");
    let password = document.querySelector("#password");
    let email1 = document.querySelector("#email1");
    let phone_number3= document.querySelector("#phone_number3");
    let phone_number2= document.querySelector("#phone_number2");
    let err = document.querySelectorAll(".result");
    let frm = document.querySelector("#frm");

    document.querySelector("#btn_save").addEventListener("click", function (e){
        e.preventDefault();

        if(user_id.value == null || user_id.value == "") {
            err[0].innerHTML = "아이디를 입력해주세요.";
            err[0].style.color = "red";
            return false;
        }
        else {
            err[0].innerHTML = "";
        }
        if(password.value == null || password.value == "") {
            err[1].innerHTML = " 패스워드를 입력해주세요.";
            err[1].style.color = "red";
            return false;
        }
        else {
            err[1].innerHTML = "";
        }
        if(name.value == null || name.value == "") {
            err[2].innerHTML = "이름을 입력해주세요.";
            err[2].style.color = "red";
            return false;
        }
        else {
            err[2].innerHTML = "";
        }
        if(email1.value == null || email1.value == "") {
            err[3].innerHTML = "이메일을 입력해주세요.";
            err[3].style.color = "red";
            return false;
        }
        else {
            err[3].innerHTML = "";
        }
        if((phone_number2.value == null || phone_number2.value== "") || (phone_number3.value == null || phone_number3.value == "")) {
            err[4].innerHTML = "번호를 입력해주세요.";
            err[4].style.color = "red";
            return false;
        }
        else {
            err[4].innerHTML = "";
        }

        alert("회원가입이 완료되었습니다.");
        frm.submit();


    })

    //아이디 중복체크
    function idCheck() {
        let user_id = $('#user_id').val();

        if(user_id != null || !(user_id.isEmpty()) || user_id != "") {
            $.ajax({
                type: "post",
                url: "/login/idCheck",
                data: {"user_id": user_id},
                success: function (data) {
                    console.log(user_id);

                    if (data == "N") {
                        let msg = "사용 가능한 아이디입니다.";
                        $("#result_checkId").html(msg).css("color", "green");
                        $("#div_err_user_id").css("display", "none");
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        let msg = "이미 사용 중인 아이디입니다.";
                        $("#result_checkId").html(msg).css("color", "red");
                        $("#div_err_user_id").css("display", "none");
                        alert("중복 아이디입니다.");
                    }

                },
                error: function (error) {
                    alert(error);
                }
            });
        }
    }

    //아이디 체크
    document.querySelector("#user_id").addEventListener("keyup", function (){
        let idCheck= /^(?=.*[a-z])(?=.*[0-9]).{5,15}$/;
        let id = document.querySelector("#user_id");
        let result = document.querySelector(".result");

        if(idCheck.test(id)){
            result.innerHTML ="";
        } else{
            result.innerHTML = "* 5자 이상의 영소문자, 숫자를 입력해주세요."
        }
    })
    //비밀번호 체크
    document.querySelector("#password").addEventListener("keyup", function (){
        let pwdCheck = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{10,20}$/;
        let newpassword = document.querySelector("#password").value;
        let oldpassword = `${member.password}`;
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
        let password = document.querySelector("#password").value;
        let password2 = document.querySelector("#password2").value;
        let img = document.querySelector("#img2");
        let result = document.querySelector("#result2");

        if(password === password2){
            img.src = "/resources/img/green_check.png";
            result.innerHTML = "";
        } else{
            result.innerHTML = "* 비밀번호가 동일하지 않습니다.";
            result.style.color = "red";
            img.src = "/resources/img/red_check.png"
        }
    })


</script>
</body>
</html>
