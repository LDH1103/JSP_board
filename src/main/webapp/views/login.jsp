<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 9:08
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
<%-- 로그인 영역 --%>
<div class="container">
    <div class="col">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="loginAction.jsp">
                <h3 style="text-align: center;">로그인 화면</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="로그인">
            </form>
        </div>
    </div>
</div>
<%--  부트스트랩  --%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
