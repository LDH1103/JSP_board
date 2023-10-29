<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 현재 세션 상태를 체크
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String)session.getAttribute("userID");
    }
    // 로그인 한 사람만 글을 쓸 수 있게함
    if(userID == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인이 필요합니다.')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
    }else{
        // 입력이 안 된 부분이 있는지 체크
        if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다')");
            script.println("history.back()");
            script.println("</script>");
        }else{
            // 글쓰기
            BbsDAO bbsDAO = new BbsDAO();
            int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
            // 데이터베이스 오류인 경우
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글쓰기에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
            }else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글쓰기 성공')");
                script.println("location.href='bbs.jsp'");
                script.println("</script>");
            }
        }
    }

%>
</body>
</html>
