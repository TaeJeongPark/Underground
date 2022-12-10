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

    //음원번호들을 ','로 나누어 배열에 넣음
    //값을 받을때 문자열로 받았기 때문( ex) 3,6,23,67,... )
    String[] nums = request.getParameter("num").split(",");

    try {

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url, user, pw);

        Statement stmt = conn.createStatement();

        //사용자 플레이리스트에서 지우기
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
