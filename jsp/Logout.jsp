<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css"> 
a { text-decoration:none } 
a:ilnk {text-decoration:none; color: #FFFFFF;}
a:visited {text-decoration:none; color: #FFFFFF;}
a:active {text-decoration:none; color: #FFFFFF;}
a:hover {text-decoration:none; color: #FFFFFF;}
</style> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그아웃</h1>
	<%
		session.invalidate();
	    response.sendRedirect("loginpage.jsp");
	%>
</body>
</html>