<%@ page import="Bean.Music_Data" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈 페이지</title>
    <link href="../css/homepage.css" type ="text/css" rel="stylesheet">

    <!--제이쿼리 src-->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--페이지 이동-->
    <script src="../func/move_page.js"></script>
    <!--재생 제어와 재생목록 관련-->
    <script src="../func/set_music.js"></script>
    <!--자바빈 이용-->
    <jsp:useBean id="Query" class="Bean.Query"/>

</head>
<body>
<div id="player"></div>
<div id="wrapper">
    <header>
        <!--홈 버튼 이미지-->
        <div class="homeimg">
            <!--클릭 시 homepage.jsp로 이동-->
            <input type="image" class = "underground" src="../homepageimg/Underground.png" alt = "홈버튼"
                onclick="move_page(1)">
        </div>
        <!--검색 버튼-->
        <div class="search">
            <input type="text" id="search" class = "searchplace" placeholder="    검색어를 입력하세요." maxlength="28">
            <input type="image" class = "search_btn" src="../homepageimg/search_btn.png" alt = "검색버튼"
                   onclick="move_page(3)"><!--searchresult.jsp로 이동-->
        </div>
        <!--회원 이름-->
        <div class="name">
            <text class="name1"><%=(String) session.getAttribute("user")%> 님</text>
            <!--이름과 님을 나누어 '님'은 고정하고 이름만 바꿀수 있도록 함-->
            <!--만약에 오우찬 님 처럼 님이 포함해서 나오면 클래스를 합침-->
        </div>
        <!--추가 버튼-->
        <div class="selectbtn">
            <!--musicregister.jsp로 이동-->
            <button type="button" class="header-select" onclick="move_page(5)">음원등록</button>
            <!--로그아웃 시 로그인페이지로 이동-->
            <button type="button" class="header-select" onclick="logout()">로그아웃</button>
            <!--회원탈퇴 시 -->
            <button type="button" class="header-select"
                    onclick="withdrawal()">회원탈퇴</button>
        </div>
    </header>

    <div class = "middle">
        <aside class="left-side">
        </aside>

        <section class="content">
            <div class="titlebox">
                <text class="titlename">최신음악</text>
            </div>
            <!--최신음악 이미지-->
            <div class="latestmusicimgbox">

                <!--가장 최근 등록한 음원의 앨범이미지(5개)-->
                <!--클릭 시 set_music() 함수를 통해 파라미터 전달-->
                <%
                    ArrayList<Music_Data> list_newest = Query.getMusicData_Newest();

                    for (Music_Data data : list_newest) {
                %>
                <img src="<%=data.getAlbum_img()%>" class="albumimg"
                     onclick="set_music('<%=data.getMusic_name()%>', '<%=data.getArtist_name()%>'
                             , '<%=data.getMusic_link()%>', '<%=data.getAlbum_img()%>', <%=data.getMusic_num()%>)">
                <%
                    }
                %>

            </div>
            <div class="realtimebox">
                <div class="chartnamebox">
                    <text class="titlename">실시간 차트</text>
                </div>
                <!--현재 접속한 시간-->
                <div class="timebox">
                    <text class="texttime"></text>
                </div>
            </div>
            <hr>
                <!--음원 차트 : 가장 많이 플레이 한 순으로 정렬 (20개)-->
                    <%
                        ArrayList<Music_Data> list = Query.getMusicData_Chart();

                        for (int i = 0; i < 20; i++) {
                    %>
                        <div class="chartoption">
                            <!-- 노래 등수-->
                            <div class="chartrankbox">
                                <text class="chartrank"><%=list.get(i).getIndex()%></text>
                            </div>
                            <!-- 노래 이미지-->
                            <div class="chartmusicimgbox">
                                <img src="<%=list.get(i).getAlbum_img()%>" class="chartmusicimg" alt="등록 이미지">
                            </div>
                            <!-- 노래 이름-->
                            <div class="chartmusicnamebox">
                                <text class="chartmusicname"><%=list.get(i).getMusic_name()%></text>
                            </div>
                            <!-- 노래 아티스트-->
                            <div class="chartmusicartistbox">
                                <text class="chartmusicartist"><%=list.get(i).getArtist_name()%></text>
                            </div>
                            <!-- 노래 장르-->
                            <div class="chartgenrebox">
                                <text class="chartgenre"><%=list.get(i).getMusic_genre()%></text>
                            </div>
                            <!-- 노래 플레이 버튼-->
                            <!--클릭 시 set_music() 함수를 통해 파라미터 전달-->
                            <div class="chartplaybtnbox">
                                <input type="image" class = "chartplaybtn" src="../searchresultimg/play_btn.png" alt = "플레이버튼"
                                       onclick="set_music('<%=list.get(i).getMusic_name()%>', '<%=list.get(i).getArtist_name()%>'
                                               ,'<%=list.get(i).getMusic_link()%>', '<%=list.get(i).getAlbum_img()%>', <%=list.get(i).getMusic_num()%>)">

                            </div>
                        </div>
                    <%
                        }
                    %>

            <div class="nextpagebox">
                <!--timechart.jsp로 이동-->
                <button type= "nextpage" onclick="move_page(2)">+ 더보기</button>
            </div>
        </section>

        <aside class="right-side">
        </aside>
    </div>

    <footer>
        <div class="music">
            <div class="musicoption">
                <!--노래 이미지-->
                <div class="musicimgbox">
                    <img id="musicimg" src="<%=(String) session.getAttribute("album")%>" class="musicimg">
                </div>
                <div class = "musiclistbox">
                    <!--노래 제목-->
                    <div class="listname">
                        <text id="musicname" class="musicname">
                            <%=(String) session.getAttribute("name")%>
                        </text>
                    </div>
                    <!--노래 아티스트-->
                    <div class="listartist">
                        <text id="musicartist" class="musicartist">
                            <%=(String) session.getAttribute("artist")%>
                        </text>
                    </div>
                </div>

                <div class="musicplaybox">
                    <!--노래 버튼-->
                    <div class = "musicbtn">
                        <input type="image" class = "previous" src="../homepageimg/previous_btn.png" alt = "이전버튼">
                        <input type="image" id="playnstop" class = "play" src="../homepageimg/play_btn.png" alt = "재생버튼"
                               onclick="playmusic()" value="now_play">
                        <input type="image" class = "next" src="../homepageimg/next_btn.png" alt = "다음버튼">
                    </div>
                     <div class="musicprogressbar">
                         <!--노래 시작 시간-->
                         <div class="firsttimebox">
                             <text class="firsttime">00:00</text>
                         </div>
                         <!--프로그레스바-->
                         <div class="progressbarbox">
                             <progress id="progress" value="50" min="0" max="100"></progress>
                         </div>
                         <!--노래 끝 시간-->
                         <div class="lasttimebox">
                             <text class="lasttime">03:20</text>
                         </div>
                     </div>
                </div>

                <!--리스트 버튼-->
                <!--streaming.jsp로 이동-->
                <div class="listbtnbox">
                    <input type="image" class = "playlistbtn" src="../homepageimg/playlist_btn.png" alt = "이전버튼"
                        onclick="move_page(4)">
                </div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>