<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*"
    import = "java.io.PrintWriter"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
request.setCharacterEncoding("UTF-8");

String kakao_key = null; // ���̵�
String member_name = null; //��й�ȣ
if(request.getParameter("kakao_key") != null){
	kakao_key = request.getParameter("kakao_key" );
}
if(request.getParameter("member_name") != null){
	kakao_key = request.getParameter("member_name" );
}
if (member_name == null  || kakao_key == null){
	PrintWriter script = response.getWriter();
	
	script.print("<script>");
	script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.');");
	script.println("history.back();");
	script.print("<script>");
	script.close();
	return;
}
 
%>
<body>

</body>
</html>