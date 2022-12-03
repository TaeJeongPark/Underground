<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String url = "jdbc:mysql://127.0.0.1:3306/underground";
    String user = "root";
    String pw = "Arsenalno14!";

    request.setCharacterEncoding("UTF-8");

    String userid = (String) session.getAttribute("user");

    try {

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url, user, pw);

        Statement stmt = conn.createStatement();

        stmt.executeUpdate("DELETE FROM playlist WHERE membersid = '"+ userid +"'");

        stmt.executeUpdate("DELETE FROM members WHERE membersid = '"+ userid +"'");

        stmt.close();
        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
