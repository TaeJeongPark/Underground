//음악의 재생 버튼 클릭 시 파라미터를 가져와서 미니플레이어에 붙이기
//현재 사용자의 플레이리스트에 곡 추가 및 플레이카운트 증가
function set_music(name, artist, link, album, num) {

    var url = link.replace("https://www.youtube.com/embed/", "");

    $.ajax({
        type: "POST",
        url: "../func/SessionManager.jsp" +
            "?name="+name+"&artist="+artist+"&link="+url+"&album="+album+"",
        contentType: "text; charset=UTF-8",
        success: function () {

            $("#musicname").text(name);
            $("#musicartist").text(artist);
            $("#musicimg").attr("src", album);

        }, error: function () {
            alert("Error..");
        }
    })

    $.ajax({
        type: "POST",
        url: "../func/Music_Playlist.jsp?num="+num+"",
        contentType: "text; charset=UTF-8",
        success: function () {

        },error: function () {
            alert("Error...");
        }
    })


}
//재생 제어
//재생 시 재생버튼, 일시정지 시 일시정지 버튼 나오도록 함
function playmusic() {

    //playVideo=재생, pauseVideo=일시정지, stopVideo=정지

    if (playnstop.value === "now_pause") {   //일시정지
        playnstop.setAttribute("value", "now_play");
        playnstop.setAttribute("src", "../homepageimg/play_btn.png");

        //player.pauseVideo();

    } else {    //재생
        playnstop.setAttribute("value", "now_pause");
        playnstop.setAttribute("src", "../homepageimg/pause_btn.png");

        //player.playVideo();

    }

}