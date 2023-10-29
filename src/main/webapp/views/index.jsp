<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 6:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width">
    <title>JSP Board</title>
    <%--  부트스트랩  --%>
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>
<%--네비바--%>
<%@ include file="layout/nav.jsp" %>

<!-- 접속시 메인 페이지로 이동 -->
<script>
    location.href="/views/main.jsp";
</script>

<%--  부트스트랩  --%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
