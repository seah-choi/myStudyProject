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
        #btn {
            display: flex;
            justify-content: center;
            background-color: #4da6e7;
            height: 60px;
            border-radius: 7px;
        }
        #text {
            margin-top: 40px;
            margin-bottom: 40px;
        }
        p {
            color: #5d5d5d !important;
        }
        #btn2 {
            display: flex;
            justify-content: center;
            background-color: #9ba3ab;
            height: 60px;
            border-radius: 7px;
        }
        #btn2 > button:hover, #btn2 > button:focus {
            background-color: #9ba3ab;
        }

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<%@include file="../common/header.jsp"%>
<body>
<form name="frm" id="frm" method="post" action="/login/pwdSearch">
    <div class="card-body">
        <br>
        <div id="h4">
            <h4 style="font-weight: bold;">비밀번호를 찾고자 하는 아이디를 입력하세요.</h4>
        </div>
        <br>
        <div class="form-floating mb-3" style="display: flex">
            <input type="text" class="form-control" name="user_id" id="user_id" maxlength="20" placeholder="id">
            <label for="user_id">아이디</label>
            <div id="div_err_user_id" style="display: none "></div>
        </div>
        <div id="result" style="font-size: small;"></div>
        <div id="btn">
            <button class="btn" type="submit" id="btn_send"><span style="color: #fff;font-size: large;">임시 비밀번호 발송</span></button>&nbsp;&nbsp;
        </div>
        <div id="text">
            <p>* 아이디 입력 후 임시비밀번호 발송 버튼을 눌러주세요.</p>
            <p>* 가입하신 이메일 주로소 임시비밀번호가 발송됩니다.<p/>
            &nbsp;&nbsp;&nbsp;메일 서비스에 따라 다소 시간이 걸릴 수 있습니다.</p>
            <p>* 임시비밀번호는 발송 후, 1시간 이내에만 유효합니다.</p>
        </div>
        <div id="btn2">
            <button class="btn" type="button" onclick="location.href='/login/login'"><span style="color: #fff;font-size: large;">취소</span></button>&nbsp;&nbsp;
        </div>
    </div>
</form>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

    //아이디 중복체크
    // function idCheck() {
    //     let user_id = $('#user_id').val();
    //
    //     if(user_id != null || !(user_id.isEmpty()) || user_id != "") {
    //         $.ajax({
    //             type: "post",
    //             url: "/login/idCheck",
    //             data: {"user_id": user_id},
    //             contentType: "application/json; charset=utf-8",
    //             success: function (data) {
    //                 console.log(user_id);
    //
    //                 if (data == "N") {
    //                     let msg = "일치하는 아이디가 없습니다..";
    //                     $("#result").html(msg).css("color", "red");
    //                     //$("#result").css("display", "none");
    //                  } else {
    //                  }
    //
    //             },
    //             error: function (error) {
    //                 alert(error);
    //             }
    //         });
    //     }
    // }

    //임시비밀번호 발급
    $(document).ready(function(){
        $("#btn_send").click(function(){
            let user_id = $("#user_id").val();
            $.ajax({
                type: "POST",
                url: "/login/idCheck",
                data: { user_id: user_id },
                success: function(response){
                    alert("임시 비밀번호가 생성되었습니다.");
                },
                error: function(error){
                    alert("오류가 발생했습니다.");
                }
            });
        });
    });

    // document.querySelector("#btn_send").addEventListener("click", function (e){
    //     e.preventDefault();
    //     let id = document.querySelector("#user_id");
    //     let result = document.querySelector("#result");
    //     let frm = document.querySelector("#frm");
    //
    //     if(id.value == null || id.value == ""){
    //         result.innerHTML="아이디를 입력해주세요.";
    //         result.style.color="red";
    //         return false;
    //     } else {
    //         result.innerHTML="";
    //     }
    //
    // })
</script>
</body>
</html>

