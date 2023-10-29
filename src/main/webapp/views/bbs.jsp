<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Board</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body>
<%@ include file="layout/nav.jsp" %>
<%
    int pageNumber = 1; // 기본 1페이지
    String req = request.getParameter("pageNumber");
    if(req != null) {
        pageNumber = Integer.parseInt(req);
    }
%>
<!-- 게시판 메인 페이지 영역 시작 -->
<div class="container">
    <div class="row">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
            <tr>
                <th style="background-color: #eeeeee; text-align: center;">번호</th>
                <th style="background-color: #eeeeee; text-align: center;">제목</th>
                <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                <th style="background-color: #eeeeee; text-align: center;">작성일</th>
            </tr>
            </thead>
            <tbody>
            <%
                BbsDAO bbsDAO = new BbsDAO(); // 인스턴스 생성
                ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                for(int i = 0; i < list.size(); i++){
            %>
            <tr>
                <td><%= list.get(i).getBbsID() %></td>
                <!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 검 -->
                <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
                    <%= list.get(i).getBbsTitle() %></a></td>
                <td><%= list.get(i).getUserID() %></td>
                <td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + ":"
                        + list.get(i).getBbsDate().substring(14, 16) %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <!-- 페이징 처리 영역 -->
        <%
            if(pageNumber != 1){
        %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>"
           class="btn btn-success btn-arraw-left">이전</a>
        <%
            }if(bbsDAO.nextPage(pageNumber + 1)){
        %>
        <a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>"
           class="btn btn-success btn-arraw-left">다음</a>
        <%
            }
        %>

        <!-- 글쓰기 버튼 생성 -->
        <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
    </div>
</div>
<!-- 게시판 메인 페이지 영역 끝 -->

<%--  부트스트랩  --%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
