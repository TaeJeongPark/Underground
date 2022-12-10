
//페이지 이동 함수
function move_page(index) {

    //페이지 이동 시 미니플레이어에 있는 곡의 정보들 가져와서 넘기기
    var mname = document.getElementById("musicname").innerText;
    var martist = document.getElementById("musicartist").innerText;
    var malbum = document.getElementById("musicimg").getAttribute("src");
    var mlink = document.getElementById("player").getAttribute("src");

    var info = "?name="+mname+"&artist="+martist+"&album="+malbum+"&link="+mlink;

    switch (index) {
        case 1: {
            //홈페이지
            location.href="homepage.jsp"+info;
            break;
        }
        case 2: {
            //차트페이지
            location.href="timechart.jsp"+info;
            break;
        }
        case 3: {
            //검색결과 페이지
            //검색어를 가지고 이동
            var param = document.getElementById("search").value;
            if (param === "") alert("검색어를 입력하세요.");
            else location.href="searchresult.jsp"+info+"&search="+param+"";
            break;
        }
        case 4: {
            //재생목록 페이지
            location.href="streaming.jsp"+info;
            break;
        }
        case 5: {
            //음원등록 페이지
            location.href="musicregister.jsp"+info;
            break;
        }
    }

}

//로그아웃 함수
function logout() {
    var result = confirm("로그아웃 하시겠습니까?");
    if (result) {
        alert("로그아웃 되었습니다.\n로그인 페이지로 이동합니다.");
        location.href="loginpage.jsp";
    }
}

//회원탈퇴 함수
//Withdrawal.jsp 로 이동하여 쿼리 수행
function withdrawal () {
    var result = confirm("정말 탈퇴 하시겠습니까?");
    if (result) {
        alert("회원 탈퇴 되었습니다.\n그동안 Underground 을 이용해주셔서 감사합니다.");
        $.ajax({
            type: "POST",
            url: '../func/Withdrawal.jsp',
            contentType: "text; charset=UTF-8",
            success: function () {
                location.href="loginpage.jsp";
            },error: function () {
                alert("error...");
            }
        })
    }
}
