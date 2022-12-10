<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>음원 등록 페이지 </title>
    <link href="../css/musicregister.css" type ="text/css" rel="stylesheet">

    <!--제이쿼리를 사용하기 위한 src-->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--페이지 이동-->
    <script src="../func/move_page.js"></script>
    <!--자바빈 이용-->
    <jsp:useBean id="Query" class="Bean.Query"/>
    <script>
        //앨범 이미지 선택 시 미리보기 기능
        $(function() {
            $("#roadImg").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            //이미지 미리보기 기능 함수
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#setImg').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        //음원 등록
        function Insert() {
            var mname = document.getElementById('mname').value;
            var martist = document.getElementById('martist').value;
            var mgenre = document.getElementById('mgenre').value;
            var mlink = document.getElementById('mlink').value;
            var malbum = document.getElementById('roadImg').value;

            //value가 없으면
            if (mname === "") alert("음원 이름을 입력하세요.");
            else if (martist === "") alert("아티스트 이름을 입력하세요.");
            else if (mgenre === "none") alert("장르를 선택하세요.");
            else if (mlink === "") alert("음원 링크를 입력하세요.");
            else {
                alert("음원 등록이 완료되었습니다.");
                document.frm.submit();
            }
        }

        function move_home() {
            //홈페이지로 이동(음원 등록 페이지로 들어오기 전 재생중이던 음원의 정보를 홈페이지로 그대로 전달)
            location.href="homepage.jsp?" +
                "name="+'<%=request.getParameter("name")%>' +
                "&artist="+'<%=request.getParameter("artist")%>' +
                "&album="+'<%=request.getParameter("album")%>' +
                "&link="+'<%=request.getParameter("link")%>'

        }

    </script>
</head>
<body>
<form name="frm" action="../func/Music_Insert.jsp" method="post" onsubmit="return false">
    <div id="wrapper">

        <header>
            <!--홈 버튼 이미지-->
            <input type="image" class = "underground" src="../musicregisterimg/Underground.png" alt = "홈버튼"
                   onclick="move_home()"><!--homepage.jsp로 이동-->

        </header>

        <div class="secondheader">
            <text class="name">아티스트님의 음악을 들려주세요</text>
        </div>

        <div class = "middle">
            <aside class="left-side"><!--빈 공간--></aside>

            <section class="content">
                <list class="flex">

                    <left class="leftlist">
                        <a class="listflex">
                            <!--아티스트 텍스트 필드-->
                            <div class="leftlistbox">
                                <text class="listtext">아티스트명</text>
                            </div>
                            <div class="leftfieldbox">
                                <input id="martist" name="martist" type="text" maxlength="30">
                            </div>
                        </a>

                        <a class="listflex">
                            <!--곡명 텍스트-->
                            <div class="leftlistbox">
                                <text class="listtext">곡명</text>
                            </div>

                            <div class="leftfieldbox">
                                <input id="mname" name="mname" type="text" maxlength="30">
                            </div>
                        </a>

                        <a class="listflex">
                            <!--장르 텍스트-->
                            <div class="leftlistbox">
                                <text class="listtext">장르</text>
                            </div>
                            <!--장르 선택 필드-->
                            <div class="leftfieldbox">
                                <select id="mgenre" name="mgenre" type ="genre">
                                    <option value="none"> 선택 </option>
                                    <option>발라드</option>
                                    <option>팝/어쿠스틱</option>
                                    <option>랩/힙합</option>
                                    <option>R&B/소울</option>
                                    <option>락/인디</option>
                                    <option>댄스/일렉</option>
                                    <option>트로트</option>
                                    <option>클래식</option>
                                </select>
                            </div>
                        </a>

                        <a class="listflex">
                            <!--음원링크 텍스트-->
                            <div class="leftlistbox">
                                <text class="listtext">음원링크</text>
                            </div>

                            <div class="leftfieldbox">
                                <input id="mlink" name="mlink" type="text">
                            </div>
                        </a>

                        <a class="listflex">
                            <!--앨범이미지 텍스트-->
                            <div class="leftlistbox">
                                <text class="listtext">앨범 이미지</text>
                            </div>
                            <div class="leftfieldbox">
                                <!--파일 찾기 버튼과 필드-->
                                <input type="graytext" id="graytext" readonly>
                                <input type= "file" id="roadImg" name="malbum" accept="image/*"
                                       onchange="javascript:document.getElementById('graytext').value = this.value"></p>
                            </div>
                        </a>

                    </left>

                    <right class="rightlist">
                        <!--사진 등록-->
                        <img id="setImg" src="../musicregisterimg/defaultAlbum_img.png" class="defaultimg" alt="등록 이미지">
                    </right>
                </list>
                <!--등록하기 버튼-->
                <div class = "register">
                    <input type="image" src="../musicregisterimg/registration_btn.png" alt = "등록하기버튼"
                           onclick="Insert()">
                </div>
            </section>

            <aside class="right-side"> <!--빈 공간--></aside>
        </div>
    </div>
</form>
</body>
</html>