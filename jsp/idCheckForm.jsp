<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action = "idCheckForm.jsp" method = "post">
<h1>Ȯ��</h1>
���̵� �Է� <input type = "text" name= "id">
<input type = "submit" value = "�ߺ��˻�">
</form>

<%
String membersid = request.getParameter("id");


try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/underground","root","Arsenalno14!");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(
			"select * from members where membersid ='"+membersid+"'");
	
	        if(rs.next()){			
				out.println("����� �� �����ϴ�");
				
			} else{
				
				out.println("����� �� �ֽ��ϴ�");
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