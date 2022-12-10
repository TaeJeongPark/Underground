
//음악의 재생 버튼 클릭 시 파라미터를 가져와서 미니플레이어에 붙이기
//현재 사용자의 플레이리스트에 곡 추가 및 플레이카운트 증가
function set_music(name, artist, link, album, num) {

    $("#musicname").text(name);
    $("#musicartist").text(artist);
    $("#musicimg").attr("src", album);


    $.ajax({
        type: "POST",
        url: "../func/Music_Playlist.jsp?num="+num+"",
        contentType: "text; charset=UTF-8",
        success: function () {

        },error: function () {
            alert("Music_playlist.jsp : Error..");
        }
    })

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

function play_new(url) {

    var link = url + '?enablejsapi=1&version=3&playerapiid=ytplayer';

    document.getElementById('player').remove();

    var player_new = document.createElement('iframe');
    player_new.setAttribute('id', 'player');
    player_new.setAttribute('width', 0);
    player_new.setAttribute('height', 0);
    player_new.setAttribute('src', link);
    document.body.appendChild(player_new);
    document.getElementById('playnstop').setAttribute('value', 'now_pause');
    document.getElementById('playnstop').setAttribute('src', '../homepageimg/play_btn.png');
    player_new.hidden;

}

function play_btn() {

    var nowplayer = document.getElementById('player');
    var btn = document.getElementById("playnstop");

    if (btn.getAttribute('value') === 'now_pause') {
        btn.setAttribute('value', 'now_play');
        btn.setAttribute('src', '../homepageimg/pause_btn.png');
        nowplayer.contentWindow.postMessage('{"event":"command","func":"' + 'playVideo' + '","args":""}', '*');
    } else {
        btn.setAttribute('value', 'now_pause');
        btn.setAttribute('src', '../homepageimg/play_btn.png');
        nowplayer.contentWindow.postMessage('{"event":"command","func":"' + 'pauseVideo' + '","args":""}', '*');
    }

}