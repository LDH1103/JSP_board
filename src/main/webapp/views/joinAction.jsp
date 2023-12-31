<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<html>
<head>
    <title>JSP Board</title>
</head>
<body>
<%
    // 현재 세션 상태 체크
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String)session.getAttribute("userID");
    }
    // 이미 로그인했으면 회원가입 못하게
    if(userID != null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어 있습니다')");
        script.println("location.href='main.jsp'");
        script.println("</script>");
    }

    if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
            user.getUserEmail() == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다')");
        script.println("history.back()");
        script.println("</script>");
    }else{
        UserDAO userDAO = new UserDAO();
        int result = userDAO.join(user);
        if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다')");
            script.println("history.back()");
            script.println("</script>");
        }else {
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('회원가입 성공')");
            script.println("location.href='main.jsp'");
            script.println("</script>");
        }
    }
%>
</body>
</html>
