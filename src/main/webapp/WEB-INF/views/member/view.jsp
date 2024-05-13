<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원정보</title>
    <style>
        .card-body {
            width: 500px;
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
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<%@include file="../common/header.jsp"%>
<body>
<form id="frm" name="frm" action="/member/delete" method="post">
    <div class="card-body">
        <div id="head">
            <i class="bi bi-person-fill"></i>
            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
            </svg>
            <h1>View</h1>
        </div>
        <br>
        <div class="mb-3 row">
            <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="user_id" name="user_id" value="${member.user_id}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="name" value="${member.name}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="email" value="${member.email}">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="phone_number" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="phone_number" value="${member.phone_number}">
            </div>
        </div>
        <br><br>
        <div style="display: flex; justify-content: flex-end;" >
            <button style="border: none; background-color: #e9ecef;" id="btn_leave" onclick="location.href='/member/delete?user_id=${member.user_id}'">탈퇴하기</button>
        </div>
        <br>
        <div id="btn">
            <button class="btn btn-primary btn-lg" type="button" onclick="location.href='/member/modify?user_id=${member.user_id}'">수정</button>&nbsp;&nbsp;
            <button class="btn btn-secondary btn-lg" type="button" onclick="location.href='/'">이전</button>
        </div>
    </div>
</form>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    document.querySelector("#btn_leave").addEventListener("click", function(){
        confirm("정말 탈퇴하시겠습니까?");
    })
</script>
</body>
</html>


