<%@page import="java.io.PrintWriter"%>
<%@page import="SHA512.Encryption"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 체크</title>
</head>
<body>


<%
request.setCharacterEncoding("EUC-KR");
String membersid = request.getParameter("id");
String memberspw = request.getParameter("pw");
System.out.println(" 디비에넣는 memberspw : " + memberspw);
String memberspwSalt  = Encryption.Salt();
System.out.println(" 디비에넣는 memberspwSalt : " + memberspwSalt);
memberspw = Encryption.SHA512(memberspw, memberspwSalt);
System.out.println(" 암호화가 된 memberspw : " + memberspw);


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
   out.println("<script> alert('입력이 안된 사항이 있습니다');</script> ");
   out.println("history.back();");
}
response.sendRedirect("loginpage.jsp");


%>


</body>
</html>