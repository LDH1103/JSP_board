<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  session.invalidate();
%>
<script>
  alert('로그아웃 되었습니다.');
  location.href="login.jsp";
</script>
</body>
</html>
