package Bean;

public class Music_Data {

    //음원의 정보들을 담을 데이터
    int index;              //일련번호(재생목록에서 사용)
    int music_num;          //음원번호
    String artist_name;     //아티스트이름
    String music_name;      //음원이름
    String music_genre;     //장르
    String music_link;      //링크
    String album_img;       //앨범이미지


    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getMusic_num() {
        return music_num;
    }

    public void setMusic_num(int music_num) {
        this.music_num = music_num;
    }

    public String getArtist_name() {
        return artist_name;
    }

    public void setArtist_name(String artist_name) {
        this.artist_name = artist_name;
    }

    public String getMusic_name() {
        return music_name;
    }

    public void setMusic_name(String music_name) {
        this.music_name = music_name;
    }

    public String getMusic_genre() {
        return music_genre;
    }

    public void setMusic_genre(String music_genre) {
        this.music_genre = music_genre;
    }

    public String getMusic_link() {
        return music_link;
    }

    public void setMusic_link(String music_link) {
        this.music_link = music_link;
    }

    public String getAlbum_img() {
        return album_img;
    }

    public void setAlbum_img(String album_img) {
        this.album_img = album_img;
    }
}
