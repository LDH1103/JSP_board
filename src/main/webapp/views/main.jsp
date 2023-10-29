<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Board</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>
<%--네비바--%>
<%@ include file="layout/nav.jsp" %>
<%
  // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
  if(session.getAttribute("userID") != null) {
%>
<!-- 메인 페이지 영역 시작 -->
<div class="container">
    <div class="jumbotron">
        <div class="container">
            <h1>JSP 게시판 소개</h1>
            <p>간단한 JSP 게시판 입니다.
                디자인 템플릿은 부트스트랩을 이용했습니다.</p>
            <a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a>
        </div>
    </div>
</div>
<!-- 메인 페이지 이미지 삽입 영역 -->
<div class="container">
    <img src="../img/1.jpg" style="width : 100%;">
</div>
<!-- 메인 페이지 영역 끝 -->
<%
  } else {
%>
<script>
  alert('로그인이 필요합니다.');
  location.href="/views/login.jsp";
</script>
<%
  }
%>

<%--  부트스트랩  --%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
