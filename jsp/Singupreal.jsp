<%@page import="java.io.PrintWriter"%>
<%@page import="SHA512.Encryption"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ üũ</title>
</head>
<body>


<%
request.setCharacterEncoding("EUC-KR");
String membersid = request.getParameter("id");
String memberspw = request.getParameter("pw");
System.out.println(" ��񿡳ִ� memberspw : " + memberspw);
String memberspwSalt  = Encryption.Salt();
System.out.println(" ��񿡳ִ� memberspwSalt : " + memberspwSalt);
memberspw = Encryption.SHA512(memberspw, memberspwSalt);
System.out.println(" ��ȣȭ�� �� memberspw : " + memberspw);


try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection (
"jdbc:mysql://localhost/underground?useSSL=false","root","Arsenalno14!");
Statement stmt = conn.createStatement();
stmt.executeUpdate(
"INSERT INTO members (membersid,memberspw,secession,memberspwSalt) VALUES('"+membersid+"','"+memberspw+"',false,'"+memberspwSalt+"')");


stmt.close();
conn.close();
}catch(SQLException e){
	e.printStackTrace();
}
if(request.getParameter("membersid") != null){
	membersid = request.getParameter("membersid");
}if(request.getParameter("memberspw") != null){
	memberspw = request.getParameter("membersid");
}if(memberspw == null || membersid == null ){
   PrintWriter script = response.getWriter();
   out.println("<script> alert('�Է��� �ȵ� ������ �ֽ��ϴ�');</script> ");
   out.println("history.back();");
}
response.sendRedirect("loginpage.jsp");


%>


</body>
</html>