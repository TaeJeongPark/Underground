<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String url = "jdbc:mysql://127.0.0.1:3306/underground";
    String user = "root";
    String pw = "Arsenalno14!";

    request.setCharacterEncoding("UTF-8");

    //넘겨받은 params
    String id = (String) session.getAttribute("user");
    int music_num = Integer.parseInt(request.getParameter("num"));

    try {

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url, user, pw);

        Statement stmt = conn.createStatement();

        stmt.executeUpdate("INSERT IGNORE INTO playlist(membersid, music_num) VALUES ('"+id+"', "+music_num+")");

        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</body>
</html>
