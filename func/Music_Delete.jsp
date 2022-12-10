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
    String username = (String) session.getAttribute("user");

    String[] nums = request.getParameter("num").split(",");

    try {

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url, user, pw);

        Statement stmt = conn.createStatement();

        for (String num : nums) {
            stmt.executeUpdate(
                    "DELETE FROM playlist " +
                            "WHERE music_num = " + Integer.parseInt(num) +
                            " and membersid = '" + username + "'");
        }

        stmt.close();
        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
