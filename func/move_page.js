
//페이지 이동(1 : homepage, 2 : timechart, 3 : searchresult, 4 : streaming, 5 : musicregister)
function move_page(index) {

    var mname = document.getElementById("musicname").innerText;
    var martist = document.getElementById("musicartist").innerText;
    var malbum = document.getElementById("musicimg").getAttribute("src");
    var mlink = document.getElementById("player").getAttribute("src");

    var info = "?name="+mname+"&artist="+martist+"&album="+malbum+"&link="+mlink;

    switch (index) {
        case 1: {
            location.href="homepage.jsp"+info;
            break;
        }
        case 2: {
            location.href="timechart.jsp"+info;
            break;
        }
        case 3: {
            var param = document.getElementById("search").value;
            if (param === "") alert("검색어를 입력하세요.");
            else location.href="searchresult.jsp"+info+"&search="+param+"";
            break;
        }
        case 4: {
            location.href="streaming.jsp"+info;
            break;
        }
        case 5: {
            location.href="musicregister.jsp"+info;
            break;
        }
    }

}

function logout() {
    var result = confirm("로그아웃 하시겠습니까?");
    if (result) {
        alert("로그아웃 되었습니다.\n로그인 페이지로 이동합니다.");
        location.href="loginpage.jsp";
    }
}

function withdrawal () {
    var result = confirm("정말 탈퇴 하시겠습니까?");
    if (result) {
        alert("회원 탈퇴 되었습니다.\n그동안 Underground 를 이용해주셔서 감사합니다.");
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
