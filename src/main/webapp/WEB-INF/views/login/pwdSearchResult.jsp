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

        #btn2 > button:hover, #btn2 > button:focus {
            background-color: #9ba3ab;
        }

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<%@include file="../common/header.jsp"%>
<body>
    <div class="card-body">
        <div id="h4">
            <h4 style="font-weight: bold;">임시 비밀번호</h4>
        </div>
        <br>
        <div>
            <p>뽀리야</p>
        </div>
        <div id="btn">
            <button class="btn" type="submit" id="btn_send" onclick="location.href='/login/pwdChange'"><span style="color: #fff;font-size: large;">비밀번호 변경</span></button>&nbsp;&nbsp;
        </div>
    </div>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    const severValResult = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null ) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color: red'>${err.getField()}를 다시 입력해주세요. </span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    severValResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(severValResult);

    //아이디 중복체크
    function idCheck() {
        let user_id = $('#user_id').val();

        if(user_id != null || !(user_id.isEmpty()) || user_id != "") {
            $.ajax({
                type: "post",
                url: "/login/pwdSearch",
                data: {"user_id": user_id},
                success: function (data) {
                    console.log(user_id);

                    if (data == "N") {
                        let msg = "사용 가능한 아이디입니다.";
                        $("#result_checkId").html(msg).css("color", "green");
                        $("#div_err_user_id").css("display", "none");
                        //alert("사용 가능한 아이디입니다.");
                    } else {
                        let msg = "이미 사용 중인 아이디입니다.";
                        $("#result_checkId").html(msg).css("color", "red");
                        $("#div_err_user_id").css("display", "none");
                        //alert("중복 아이디입니다.");
                    }

                },
                error: function (error) {
                    alert(error);
                }
            });
        }
    }

</script>
</body>
</html>

