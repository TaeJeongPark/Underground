<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    session.setAttribute("name", request.getParameter("name"));
    session.setAttribute("artist", request.getParameter("artist"));
    session.setAttribute("link", request.getParameter("link"));
    session.setAttribute("album", request.getParameter("album"));

%>
</body>
</html>
