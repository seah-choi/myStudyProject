<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
    <link href="signin.css" rel="stylesheet">
</head>
<%@ include file="../common/header.jsp"%>
<body class="text-center">
<div id="list">
    <div style="display: flex;margin-bottom: 20px;">
        <p style="font-size: 20px;font-weight: bold;"><a href="/myStudy/list">나의 학습</a> > <a href="/myStudy/modify?study_idx=${myStudy.study_idx}">나의 학습 수정</a> </p>
    </div>
    <form id="frm" name="frm" action="/myStudy/modify" method="post" enctype="multipart/form-data">
        <input type="hidden" id="study_idx" name="study_idx" value="${myStudy.study_idx}">
        <input type="hidden" id="share_id" name="share_id" value="${sessionScope.user_id}">
        <table class="table table-bordered border-primary-subtle">
            <thead>
            <tr>
                <th scope="col">제목</th>
                <td colspan="6"><input type="text" id="title" name="title" value="${myStudy.title}"></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="col">내용</th>
                <td colspan="6"><textarea id="content" name="content" cols="90" rows="12">${myStudy.content}</textarea></td>
            </tr>
            <tr>
                <th scope="col">이미지</th>
                <td colspan="6">
                    <div>
                        <img src="/resources/img/uploads/${myStudy.image}" alt="Uploaded Image" id="uploadedImage" style="width: 100px; height: auto;">
                    </div>
                    <div class="input-group mb-3">
                        <input type="file" class="form-control" id="image" name="file" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="col" colspan="3">오늘의 학습 노출여부</th>
                <th scope="col" colspan="4">오늘의 학습 노출기간</th>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="display_status" id="Y" value="Y" ${myStudy.display_status == "Y" ?'checked' :""}>
                        <label class="form-check-label" for="Y">Y</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="display_status" id="N" value="N" ${myStudy.display_status == "N" ?'checked' :""}>
                        <label class="form-check-label" for="N">N</label>
                    </div>
                </td>
                <td colspan="4">
                    <div id="date" style="display: none">
                        <input type="date" class="form-control" name="display_start" id="display_start" placeholder="등록일 시작" value="${myStudy.display_start}" style="width: 200px; margin-right: 5px;">
                        <span style="padding: 10px"> ~ </span>
                        <input type="date" class="form-control" name="display_end" id="display_end" placeholder="등록일 끝" value="${myStudy.display_end}" style="width: 200px">
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="col" colspan="3">공유한 사람</th>
                <td colspan="4">
                    <div id="input">
                        <button type="button" id="add">+</button>
                        <button type="button" id="remove">-</button>
                        <c:forEach items="${shareDTOList}" var="list">
                            <input type="text" name="receive_id" value="${list.receive_id}">
                        </c:forEach>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="col" colspan="3">분야</th>
                <th scope="col" colspan="4">해시태그</th>
            </tr>
            <tr>
                <td colspan="3"><input type="text" id="field" name="field" maxlength="40" value="${myStudy.field}"></td>
                <td colspan="4"><input type="text" id="hashtag" name="hashtag" maxlength="40" value="${myStudy.hashtag}"></td>
            </tr>
            </tbody>
        </table>
        <div>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/myStudy/list'">목록</button>
            <button type="submit" class="btn btn-outline-primary" onclick="goRegist(event)">수정</button>
            <button type="reset" class="btn btn-outline-primary">취소</button>
        </div>
    </form>
</div>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script>
    function goRegist(e) {
        e.preventDefault();
        if(confirm("글을 수정하시겠습니까?")) {
            alert("정상적으로 수정되었습니다.");
            document.getElementById("frm").submit();
        } else {
            return false;
        }
    }

    document.addEventListener('DOMContentLoaded', function() {

        document.querySelectorAll('input[name="display_status"]').forEach(function (radio) {
            radio.addEventListener('change', function () {
                if (document.getElementById('Y').checked) {
                    document.getElementById('date').style.display = 'flex';
                } else {
                    document.getElementById('date').style.display = 'none';
                }
            });
        });
    });

    document.getElementById('add').addEventListener('click', function() {
        let input = document.getElementById('input');
        let inputElements = input.getElementsByTagName('input');

        if (inputElements.length < 4) {
            let newInput = document.createElement('input');
            newInput.type = 'text';
            newInput.name = 'receive_id';
            input.appendChild(newInput);
        }
    });

    document.getElementById('remove').addEventListener('click', function() {
        let input = document.getElementById('input');
        let inputElements = input.getElementsByTagName('input');

        if (inputElements.length > 1) {
            input.removeChild(inputElements[inputElements.length - 1]);
        }
    });

    document.getElementById('image').addEventListener('change', function(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var output = document.getElementById('uploadedImage');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    });
</script>
</html>





