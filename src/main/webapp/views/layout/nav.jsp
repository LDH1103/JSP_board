<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10-29(029)
  Time: 오후 7:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <!-- 네비게이션 영역 -->
        <a class="navbar-brand" href="/">JSP Board</a>
    </div>
    <!-- 메뉴 영역 -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="main.jsp">메인</a></li>
            <li><a href="bbs.jsp">게시판</a></li>
        </ul>
        <!-- 드랍다운 영역 -->
        <ul class="nav navbar-nav navbar-right">
            <li>
                <%
                    // 세션에 값이 담겨있는지 체크
                    String userID = null;
                    if(session.getAttribute("userID") != null){
                        userID = (String)session.getAttribute("userID");

                %>
                <a href="logoutAction.jsp">로그아웃</a></li>
                <%
                    } else {
                %>
                <a href="login.jsp">로그인</a></li>
            <li>
                <a href="join.jsp">회원가입</a>
            </li>
                <%
                }
                %>

        </ul>
    </div>
    <%--  부트스트랩  --%>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</nav>
