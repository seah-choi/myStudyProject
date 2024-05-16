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
        #search{
            display: flex;
        }
    </style>
    <link href="signin.css" rel="stylesheet">
</head>
<%@ include file="../common/header.jsp"%>
<body class="text-center" id="content">
<div id="list">
    <div style="display: flex;margin-bottom: 20px;">
        <p style="font-size: 20px;font-weight: bold;"><a href="/myStudy/list">나의 학습</a> > <a href="/myStudy/list">나의 학습 리스트</a> </p>
    </div>
    <form name="frm" id="frm" action="/myStudy/list" method="get">
        <div class="form-floating mb-3" style="display: flex;">
            <input type="date" class="form-control" name="search_date1" id="search_date1" maxlength="100" placeholder="등록일 시작" value='<c:out value="${pageRequestDTO.search_date1}"/>' style="width: 400px; margin-right: 5px;">
            <label for="search_date1">등록일 시작</label>
            <input type="date" class="form-control" name="search_date2" id="search_date2" maxlength="100" placeholder="등록일 끝" value='<c:out value="${pageRequestDTO.search_date2}"/>' style="width: 400px">
            <label for="search_date2" style="margin-left: 405px;">등록일 끝</label>
            <div id="btn" style="margin-left: 20px; margin-top: 5px;">
                <button type="submit" class="btn btn-primary btn-lg" style="width: 100px;">Search</button>
                <button type="reset" class="btn btn-secondary btn-lg" style="width: 100px;">Clear</button>
            </div>
        </div>
        <div id="search">
        <select class="form-select form-select-sm" aria-label="Small select example" name="search_type" style="width: 100px;">
            <option value="t" ${search_type=="t" ? "selected" : ""}>제목</option>
            <option value="u" ${search_type=="u" ? "selected" : ""}>글내용</option>
        </select>
<%--        <div class="form-check form-check-inline">--%>
<%--            <c:set value="${fn:join(responseDTO.search_type,'')}" var="search_type"/>--%>
<%--            <input class="form-check-input" type="checkbox" id="search_type_1" name="search_type" value="t" <c:if test='${fn:contains(search_type, "t")}'>checked</c:if>>--%>
<%--            <label class="form-check-label" for="search_type_1">제목</label>--%>
<%--        </div>--%>
<%--        <div class="form-check form-check-inline">--%>
<%--            <input class="form-check-input" type="checkbox" id="search_type_2" name="search_type" value="u" <c:if test='${fn:contains(search_type, "u")}'>checked</c:if>>--%>
<%--            <label class="form-check-label" for="search_type_2">글내용</label>--%>
<%--        </div>--%>
        <input class="form-control" type="text" placeholder="검색어" aria-label="default input example" name="search_word" id="search_word" value='<c:out value="${pageRequestDTO.search_word}"/>' style="width: 805px;">
        </div>
        <br>
        <div style="display: flex;justify-content: flex-end;">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/myStudy/regist'">학습등록</button>
        </div>
        <br>
        <div style="display: flex;justify-content: space-between;margin-bottom: 10px">
            <div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="order" id="new" value="new" ${order=="new" ? "checked" : ""}>
                <label class="form-check-label" for="new">최신순</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="order" id="like" value="like" ${order=="like" ? "checked" : ""}>
                <label class="form-check-label" for="like">좋아요순</label>
            </div>
            </div>
            <div style="display: flex">
                <select name="page_size" onchange="this.frm.submit()" class="form-select form-select-sm" aria-label="Small select example" style="width: 70px;">
                    <option value="30" <c:if test="${responseDTO.page_size eq '30'}">selected</c:if>>30</option>
                    <option value="50" <c:if test="${responseDTO.page_size eq '50'}">selected</c:if>>50</option>
                    <option value="100" <c:if test="${responseDTO.page_size eq '100'}">selected</c:if>>100</option>
                </select>
                <span style="margin-top: 5px;">개씩 보기</span>
            </div>
        </div>
    <c:choose>
        <c:when test="${not empty responseDTO and not empty responseDTO.dtoList}">
                <table class="table table-hover">
                    <thead>
                    <tr class="table-primary">
                        <th scope="col">#</th>
                        <th scope="col">제목</th>
                        <th scope="col">등록일</th>
                        <th scope="col">좋아요</th>
                        <th scope="col">오늘의 학습 노출여부</th>
                        <th scope="col">오늘의 학습 노출기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${responseDTO.dtoList}" var="list">
                    <tr>
                        <th scope="row">${list.study_idx}</th>
                        <td><a href="/myStudy/view?study_idx=${list.study_idx}">${list.title}</a></td>
                        <td>${list.reg_date}</td>
                        <td>${list.like}</td>
                        <td>${list.display_status}</td>
                        <td>${list.display_start} ~ ${list.display_end}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
        </c:when>
        <c:otherwise>
            <p>등록된 글이 없습니다.</p>
        </c:otherwise>
    </c:choose>
    </form>
<nav>
    <ul class="pagination justify-content-center">
        <li class="page-item
        <c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
            <!--a class="page-link" data-num="1" href="page=1">Previous</a-->
            <a class="page-link"
               data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
               href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>">Previous</a>
        </li>
        <c:forEach begin="${responseDTO.page_block_start}"
                   end="${responseDTO.page_block_end}"
                   var="page_num">
            <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if> ">
                <a class="page-link" data-num="${page_num}"
                   href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
            </li>
        </c:forEach>
        <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
            <a class="page-link"
               data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
               href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>">Next</a>
        </li>
    </ul>
</nav>
</div>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 현재 URL을 분석합니다.
        var url = new URL(window.location);

        // 'order' 파라미터의 값을 얻습니다.
        var orderParam = url.searchParams.get('order');

        // 'order' 파라미터가 없거나 비어있는 경우, 기본값을 'new'로 설정합니다.
        if (!orderParam) {
            url.searchParams.set('order', 'new');
            window.location.href = url.href;
        }

        // 'order' 라디오 버튼의 선택 변경을 감지합니다.
        document.querySelectorAll('input[name="order"]').forEach(function(radioButton) {
            radioButton.addEventListener('change', function() {
                // 선택된 값(value)을 얻습니다.
                var selectedOrder = this.value;

                // 'order' 파라미터를 현재 선택된 값으로 설정(또는 업데이트)합니다.
                url.searchParams.set('order', selectedOrder);

                // 변경된 URL로 페이지를 리디렉션합니다.
                window.location.href = url.href;
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        var url = new URL(window.location);

        // 'order' 파라미터의 값을 얻습니다.
        var countParam = url.searchParams.get('count');

        // 'order' 파라미터가 없거나 비어있는 경우, 기본값을 'new'로 설정합니다.
        if (!countParam) {
            url.searchParams.set('count', '30');
            window.location.href = url.href;
        }

        // 'order' select 메뉴의 선택 변경을 감지합니다.
        document.querySelector('select[name="count"]').addEventListener('change', function() {
            // 선택된 값(value)을 얻습니다.
            var selectedOrder = this.value;

            // 'order' 파라미터를 현재 선택된 값으로 설정(또는 업데이트)합니다.
            url.searchParams.set('count', selectedOrder);

            // 변경된 URL로 페이지를 리디렉션합니다.
            window.location.href = url.href;
        });
    });
</script>
</body>
</html>

