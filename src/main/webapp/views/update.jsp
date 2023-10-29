<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<html>
<head>
    <title>JSP Board</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>
<%@ include file="layout/nav.jsp" %>
<%
    // 세션에 값이 담겨있는지 체크
    String userIDUpdate = null;
    if(session.getAttribute("userID") != null){
        userIDUpdate = (String)session.getAttribute("userID");
    }
    if(userIDUpdate == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인이 필요합니다.')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
    }
    int bbsID = 0;
    if(request.getParameter("bbsID") != null){
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if(bbsID == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href='bbs.jsp'");
        script.println("</script>");
    }
    //해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
    Bbs bbs = new BbsDAO().getBbs(bbsID);
    if(!userIDUpdate.equals(bbs.getUserID())){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다')");
        script.println("location.href='bbs.jsp'");
        script.println("</script>");
    }
%>
<!-- 게시판 글 수정 양식 영역 시작 -->
<div class="container">
    <div class="row">
        <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"
                               value="<%=bbs.getBbsTitle() %>"></td>
                </tr>
                <tr>
                    <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048"
                                  style="height: 350px;"><%=bbs.getBbsContent() %></textarea></td>
                </tr>
                </tbody>
            </table>
            <!-- 글쓰기 버튼 생성 -->
            <input type="submit" class="btn btn-primary pull-right" value="수정하기 ">
        </form>
    </div>
</div>
<!-- 게시판 글 수정 양식 영역 끝 -->
<%--  부트스트랩  --%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
