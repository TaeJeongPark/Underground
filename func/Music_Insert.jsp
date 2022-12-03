<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>음원 등록 기능</title>
</head>
<body>
<%

    request.setCharacterEncoding("UTF-8");

    Connection conn;
    PreparedStatement psmt;

    //넘겨받은 데이터들
    String music_name = request.getParameter("mname");
    String artist_name = request.getParameter("martist");
    String music_genre = request.getParameter("mgenre");
    String music_link = request.getParameter("mlink");

    String album_img;
    if (request.getParameter("malbum").equals("")) {
        album_img = "defaultAlbum_img.png";
    } else album_img = request.getParameter("malbum");


    String url = "jdbc:mysql://127.0.0.1:3306/underground";

    try{

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url,"root","Arsenalno14!");

        //음원 등록
        psmt = conn.prepareStatement(
                "insert into music(artist_name, music_name, music_genre, music_link, album_img) "
                        + "values(?,?,?,?,?)");

        psmt.setString(1, artist_name);	//artist_name
        psmt.setString(2, music_name);	//music_name
        psmt.setString(3, music_genre);	//music_genre
        psmt.setString(4, music_link);	//music_link
        psmt.setString(5, "../images/" + album_img);	//album_img

        psmt.executeUpdate();

        psmt.close();
        conn.close();


    } catch(Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("../jsp/homepage.jsp");

%>
</body>
</html>
