package Bean;

import java.sql.*;
import java.util.ArrayList;

public class Query {

    //데이터베이스 쿼리 수행 함수들 (자바빈으로 활용)
    //대부분의 함수들을 Music_Data 형의 배열로 반환해서 사용할 것임

    ArrayList<Music_Data> list;
    String url = "jdbc:mysql://127.0.0.1:3306/underground";
    String user = "root";
    String pw = "Arsenalno14!";
    int index;      //랭크


    //음원 차트 (플레이 수 순으로)
    //배열로 반환
    public ArrayList<Music_Data> getMusicData_Chart() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, user, pw);

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(
                    "SELECT * FROM music ORDER BY play_cnt DESC");

            list = new ArrayList<>();
            index = 1;

            while (rs.next()) {

                Music_Data data = new Music_Data();

                data.setIndex(index);
                data.setMusic_num(rs.getInt("music_num"));
                data.setArtist_name(rs.getString("artist_name"));
                data.setMusic_name(rs.getString("music_name"));
                data.setMusic_genre(rs.getString("music_genre"));
                data.setMusic_link(rs.getString("music_link"));
                data.setAlbum_img(rs.getString("album_img"));

                list.add(data);
                index++;

            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;    //리스트로 반환
    }

    //최신 앨범(최신 5곡)
    //배열로 반환
    public ArrayList<Music_Data> getMusicData_Newest() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, user, pw);

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(
                    "SELECT * FROM music ORDER BY regist_date DESC limit 5");

            list = new ArrayList<>();

            while (rs.next()) {

                Music_Data data = new Music_Data();

                data.setArtist_name(rs.getString("artist_name"));
                data.setMusic_name(rs.getString("music_name"));
                data.setMusic_genre(rs.getString("music_genre"));
                data.setMusic_link(rs.getString("music_link"));
                data.setAlbum_img(rs.getString("album_img"));

                list.add(data);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //사용자 재생목록
    //사용자의 id를 파라미터로 받아옴
    //마찬가지로 배열로 반환
    public ArrayList<Music_Data> getMusicData_Streaming(String name) {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, user, pw);

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(
                    "SELECT m.music_num, m.music_name, m.artist_name, m.music_genre, m.music_link, m.album_img " +
                            "FROM music AS m " +
                            "JOIN playlist AS p ON m.music_num = p.music_num " +
                            "WHERE p.membersid = '"+name+"' " +
                            "GROUP BY m.music_num");

            list = new ArrayList<>();

            while (rs.next()) {

                Music_Data data = new Music_Data();

                data.setMusic_num(rs.getInt("music_num"));
                data.setMusic_name(rs.getString("music_name"));
                data.setArtist_name(rs.getString("artist_name"));
                data.setMusic_genre(rs.getString("music_genre"));
                data.setMusic_link(rs.getString("music_link"));
                data.setAlbum_img(rs.getString("album_img"));

                list.add(data);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //검색
    //배열로 반환
    public ArrayList<Music_Data> getMusicData_result(String string) {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, user, pw);

            Statement stmt = conn.createStatement();

            list = new ArrayList<>();
            index = 1;


            ResultSet rs = stmt.executeQuery(
                    "SELECT * FROM music " +
                            "WHERE music_name like '"+string+"' or music_name like '"+string+"%' " +
                            "or artist_name like '"+string+"' or artist_name like '"+string+"%' " +
                            "or music_name like '%"+string+"%' or artist_name like '%"+string+"%'");

            while (rs.next()) {

                Music_Data data = new Music_Data();

                data.setIndex(index);
                data.setMusic_num(rs.getInt("music_num"));
                data.setArtist_name(rs.getString("artist_name"));
                data.setMusic_name(rs.getString("music_name"));
                data.setMusic_genre(rs.getString("music_genre"));
                data.setMusic_link(rs.getString("music_link"));
                data.setAlbum_img(rs.getString("album_img"));

                list.add(data);
                index++;
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
