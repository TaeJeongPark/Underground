<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import ="java.sql.*"%>
    <%@page import="SHA512.Encryption"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
	<!--�ڹٺ� �̿�-->
	<jsp:useBean id="Query" class="Bean.Query"/>
</head>
<body>

<%!String membersid;	%>
<%

String usersId = request.getParameter("id"); // login ���� �޾ƿ� ��
String usersPw = request.getParameter("pw"); // login ���� �޾ƿ� ��

System.out.println("usersId : " + usersId);
System.out.println("usersPw : " + usersPw);

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/underground?useSSL=false","root","Arsenalno14!");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(
			"SELECT * FROM members where membersid ='"+usersId+"'"); //db ���� ���̺��� ��ġ�ϴ� ����� ���� ���� ��ȸ

	   if (rs.next()) {
		   membersid = rs.getString("membersid"); // ȸ�� ���̵� ����
		   String memberspw = rs.getString("memberspw"); // ȸ�� ��й�ȣ ����
		   String memberspwSalt = rs.getString("memberspwSalt"); //��ȸ��� ������ (ȸ�� ������) ����

		   System.out.println(" �˿������� membersid : " + membersid);
		   System.out.println(" �˿������� memberspw : " + memberspw);
		   System.out.println(" �˿������� memberspwSalt : " + memberspwSalt);

		   usersPw = Encryption.SHA512(usersPw, memberspwSalt);  // ����ڰ� �Է��� ���̵� ��ȸ�Ͽ� ��ȸ�� ���� �����ͷ� SHA 512 ��ȣȭ
		   System.out.println(" �˿������� usersPw : " + usersPw);

		   if (membersid.equals(usersId) && memberspw.equals(usersPw)) { //��ȣȭ�� �´ٸ� �α���
			   session.setAttribute("user", membersid); //�ĺ���  ���ǿ� ����

			   response.sendRedirect("homepage.jsp?name=default");

		   } else {
			   response.sendRedirect("loginpage.jsp");
		   }
	   } else {
		   response.sendRedirect("loginpage.jsp");
	   }

	rs.close();
	stmt.close();
	conn.close();

}catch(Exception e){
	e.printStackTrace();
}

%>

</body>
</html>