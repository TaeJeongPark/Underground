<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("EUC-KR");
String kakao_key = request.getParameter("kakao_key");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/underground","root","Arsenalno14!");
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(
			"DELETE FROM member WHERE kakao_key='"+kakao_key+"'");
	stmt.close();
	conn.close();
	
}catch (SQLException e){
	e.printStackTrace();
}
response.sendRedirect("loginpage.jsp");


%>
</body>
</html>