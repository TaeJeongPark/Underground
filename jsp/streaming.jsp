<%@ page import="Bean.Music_Data" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스트리밍 페이지 </title>
    <link href="../css/streaming.css" type ="text/css" rel="stylesheet">

    <!--제이쿼리 src-->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--페이지 이동-->
    <script src="../func/move_page.js"></script>
    <!--재생 제어와 재생목록 관련-->
    <script src="../func/set_music.js"></script>
    <!--자바빈 이용-->
    <jsp:useBean id="Query" class="Bean.Query"/>

    <script>

        $(function (){
            if ('<%=request.getParameter("name")%>' !== "default") {
                $("#musicimg").attr("src", "<%=request.getParameter("album")%>");
                $("#musicname").text("<%=request.getParameter("name")%>");
                $("#musicartist").text("<%=request.getParameter("artist")%>");
                $("#player").attr("src", "<%=request.getParameter("link")%>");
            }
        })

        function remove() {

            //체크박스에 체크된 항목 삭제
            //체크된 값의 value를 문자열로 저장하여(구분자(,) 사용) 파라미터를 Music_Delete.jsp로 넘김
            var num = "";
            var chbox = $("input[name='chbox']:checked");
            $(chbox).each(function () {
                if (num !== "") {
                    num += ","
                    num += $(this).val();
                }
                else num += $(this).val();
            })

            if (num === "") alert("삭제할 항목을 선택하세요.");
            else $.ajax({
                type: "POST",
                url: "../func/Music_Delete.jsp?num="+num+"",
                contentType: "text; charset=UTF-8",
                success: function () {
                    location.href="streaming.jsp";
                },error: function () {
                    alert("Error...");
                }
            })
        }

    </script>

</head>
<body>
<div id="wrapper">
    <header>
        <!--홈 버튼 이미지-->
        <input type="image" class = "underground" src="../streamingimg/Underground.png" alt = "홈버튼"
               onclick="move_page(1)"><!--homepage.jsp로 이동-->

    </header>

    <div class = "middle">
        <!--명칭은 콘텐트이나 왼쪽 리스트라 봐도 무방. 양 칸을 콘텐트와 사이드바로 구성함.-->
        <section class="content">
            <div class="musicbox">
                <!--빈칸-->
                <div class="nobox">
                </div>
                <!--노래 이미지-->
                <div class="musicimgbox">
                    <img id="musicimg" src="<%=(String) session.getAttribute("album")%>" class="musicimg" alt="노래 이미지">
                </div>
                <!--노래 이름-->
                <div class="musicnamebox">
                    <text id="musicname" class="musicname">
                        <%=(String) session.getAttribute("name")%>
                    </text>
                </div>
                <!--노래 아티스트-->
                <div class="musicsingerbox">
                    <text id="musicartist" class="musicsinger">
                        <%=(String) session.getAttribute("artist")%>
                    </text>
                </div>
                <!--프로그레스바-->
                <div class="progressbarbox">
                    <progress id="progress" value="50" min="0" max="100"></progress>
                </div>
                <!--노래 시간-->
                <div class="timer">
                    <div class="starttimebox">
                        <text class="starttime">00:00</text>
                    </div>
                    <div class="lasttimebox">
                        <text class="lasttime">03:20</text>
                    </div>
                </div>
                <!--노래 관련 버튼-->
                <div class="btn">
                    <input type="image" class="previous" src="../streamingimg/previous_btn.png" alt = "뒤로가기버튼">
                    <input type="image" id="playnstop" class = "play" src="../homepageimg/play_btn.png" alt = "재생버튼"
                           onclick="play_btn()" value="now_play">
                    <input type="image" class="next" src="../streamingimg/next_btn.png" alt = "다음버튼">
                </div>

            </div>
        </section>


        <!--오른쪽 사이드바-->
        <aside class="right-side">
            <div class="container">
                <div class="listname">
                    <div class="playlistbox">
                        <text class="playlist">재생목록</text>
                    </div>
                    <!--삭제 버튼-->
                    <div class="deletebox">
                        <button id="deletebtn" type="delete" onclick="remove()">삭제</button>
                    </div>

                </div>

                <div class="musiclist">

                    <!--사용자의 재생목록-->
                    <!--getMusicData_Streaming()-->
                    <%
                        ArrayList<Music_Data> list = Query.getMusicData_Streaming((String) session.getAttribute("user"));
                        if (list != null) {
                            for (Music_Data data : list) {
                    %>
                        <div class="musicoption">
                            <div class="opcheckbox">
                                <input name="chbox" type="checkbox" value="<%=data.getMusic_num()%>">
                            </div>
                            <div class="opmusicimgbox">
                                <img src="<%=data.getAlbum_img()%>" class="opmusicimg" alt="등록 이미지">
                            </div>
                            <div class="opmusicnamebox">
                                <text class="opmusicname"><%=data.getMusic_name()%></text>
                            </div>
                            <div class="opmusicartistbox">
                                <text class="opmusicartist"><%=data.getArtist_name()%></text>
                            </div>
                            <div class="opgenrebox">
                                <text class="opgenre"><%=data.getMusic_genre()%></text>
                            </div>
                            <!--클릭 시 set_music() 함수를 통해 파라미터 전달-->
                            <div class="opplaybtnbox">
                                <input type="image" class="opplaybtn" src="../streamingimg/play_btn.png" alt="플레이버튼"
                                    onclick="set_music('<%=data.getMusic_name()%>', '<%=data.getArtist_name()%>'
                                            ,'<%=data.getMusic_link()%>', '<%=data.getAlbum_img()%>'
                                            , <%=data.getMusic_num()%>);
                                            play_new('<%=data.getMusic_link()%>')">
                            </div>
                        </div>
                    <%
                            }
                        }
                    %>

                </div>
            </div>
        </aside>
    </div>
    <iframe id="player" width="0" height="0" src=""></iframe>
</div>
</body>
</html>