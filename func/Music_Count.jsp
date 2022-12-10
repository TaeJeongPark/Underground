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
    int music_num = Integer.parseInt(request.getParameter("num"));

    try {

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url, user, pw);

        Statement stmt = conn.createStatement();

        //값 증가가 안됨...
        stmt.executeUpdate("UPDATE music SET play_cnt = play_cnt +1 WHERE music_num = "+music_num);

        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</body>
</html>
