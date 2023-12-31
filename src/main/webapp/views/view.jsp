<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 11:36
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
    // bbsID를 초기화 시키고
    // 'bbsID'라는 데이터가 넘어온 것이 존재한다면  변수에 담는다
    int bbsID = 0;
    if(request.getParameter("bbsID") != null){
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }

    // 만약 넘어온 데이터가 없다면
    if(bbsID == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href='bbs.jsp'");
        script.println("</script>");
    }

    // 유효한 글이라면 구체적인 정보를 'bbs'라는 인스턴스에 담는다
    Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
%>
<!-- 게시판 글 보기 양식 영역 시작 -->
<div class="container">
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="width: 20%;">글 제목</td>
                <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;")
                        .replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td colspan="2"><%= bbs.getUserID() %></td>
            </tr>
            <tr>
                <td>작성일자</td>
                <td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
                        + bbs.getBbsDate().substring(14, 16) + "분" %></td>
            </tr>
            <tr>
                <td>내용</td>
                <td colspan="2" style="height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;")
                        .replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
            </tr>
            </tbody>
        </table>
        <a href="bbs.jsp" class="btn btn-primary">목록</a>

        <!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능 -->
        <%
            if(userID != null && userID.equals(bbs.getUserID())){
        %>
            <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
<%--            <a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>--%>
            <a onclick="return confirm('정말 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
        <%
            }
        %>
    </div>
</div>
<!-- 게시판 글 보기 양식 영역 끝 -->

<%--  부트스트랩  --%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
