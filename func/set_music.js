
function set_music(name, artist, link, album, num) {

    //미니플레이어에 정보 부착
    $("#musicname").text(name);
    $("#musicartist").text(artist);
    $("#musicimg").attr("src", album);

    //ajax을 이용해 쿼리 수행 - 사용자 플레이리스트에 해당 음원 추가
    $.ajax({
        type: "POST",
        url: "../func/Music_Playlist.jsp?num="+num+"",
        contentType: "text; charset=UTF-8",
        success: function () {

        },error: function () {
            alert("Music_playlist.jsp : Error..");
        }
    })

    //ajax을 이용해 쿼리 수행 - 음원 플레이 카운트 증가
    $.ajax({
        type: "POST",
        url: "../func/Music_Count.jsp?num="+num+"",
        contentType: "text; charset=UTF-8",
        success: function () {

        },error: function () {
            alert("Music_Count.jsp : Error..");
        }
    })

}

//Youtube iframe 생성
function play_new(url) {

    var link = url + '?enablejsapi=1&version=3&playerapiid=ytplayer';

    //이미 음원이 선택되어 iframe이 있을 경우
    document.getElementById('player').remove();

    //만들기 - <iframe id="player" width=0 height=0 src="URL">
    var player_new = document.createElement('iframe');
    player_new.setAttribute('id', 'player');
    player_new.setAttribute('width', 0);
    player_new.setAttribute('height', 0);
    player_new.setAttribute('src', link);
    //body에 붙이기
    document.body.appendChild(player_new);
    //플레이 버튼 바꾸기
    document.getElementById('playnstop').setAttribute('value', 'now_pause');
    document.getElementById('playnstop').setAttribute('src', '../homepageimg/play_btn.png');
    //iframe 가리기
    player_new.hidden;

}

//플레이 버튼 제어
function play_btn() {

    var nowplayer = document.getElementById('player');
    var btn = document.getElementById("playnstop");

    //만약 음악이 멈춰있을 경우 - 재생
    if (btn.getAttribute('value') === 'now_pause') {
        btn.setAttribute('value', 'now_play');
        btn.setAttribute('src', '../homepageimg/pause_btn.png');
        nowplayer.contentWindow.postMessage('{"event":"command","func":"' + 'playVideo' + '","args":""}', '*');
    } else {    //음악이 재생되고 있을 경우 - 일시정지
        btn.setAttribute('value', 'now_pause');
        btn.setAttribute('src', '../homepageimg/play_btn.png');
        nowplayer.contentWindow.postMessage('{"event":"command","func":"' + 'pauseVideo' + '","args":""}', '*');
    }

}