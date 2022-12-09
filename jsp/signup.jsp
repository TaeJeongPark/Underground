
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*"
    %>

<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css"> 
a { text-decoration:none } 
a:ilnk {text-decoration:none; color: #FFFFFF;}
a:visited {text-decoration:none; color: #FFFFFF;}
a:active {text-decoration:none; color: #FFFFFF;}
a:hover {text-decoration:none; color: #FFFFFF;}

#password1{
    box-sizing: border-box;
            vertical-align: middle;
            margin-top: 20px;
            width: 100%;
            height: 61px;
            font-size: 20px;
            font-weight: 500;
            line-height: 30px;  
            border: 1px solid #000000;
            border-radius: 10px;
            color: black;
            font-family: 'Poppins';
} 

#password2{
    box-sizing: border-box;
            vertical-align: middle;
            margin-top: 20px;
            width: 100%;
            height: 61px;
            font-size: 20px;
            font-weight: 500;
            line-height: 30px;  
            border: 1px solid #000000;
            border-radius: 10px;
            color: black;
            font-family: 'Poppins';
} 

#submit1{
width: 250px;
height: 50px;

} 
</style> 



    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지 </title>
    <link href="../css/signup.css" type ="text/css" rel="stylesheet">

</head>
<body>


    <div id="wrapper">
        <header>
            <!--홈 버튼 이미지-->
            <div class="homeimg">
                <img src="../signupimg/Underground.png" class="underground" alt="언더그라운드 이미지" onclick="location.href='loginpage.jsp'">
            </div>
           
        </header>

               
            <div class = "middle">
            <aside class="left-side">                
            </aside>

            <section class="content">
                <div class="inputId">

                    <div class="checkflex">
                        <button type="button" 
                        onclick="fn_dbCheckId()"
                        class = "doublecheck" id = "dbCheckID"  value="중복확인 ">
                         </button>
                           <!--아이디 중보 확인용 프레임 생성-->
                    <input type = "hidden" name = "idDuplication" value = "idUncheck">
                    </div>
                    <form action = "Singupreal.jsp" method = "post" >
                    <input type="text" name = "id" onkeydown="inputIdChk()" placeholder=" 아이디">

                    <!--아이디 중복 확인 입력 오류시에 뜨는 창-->
                    <!--포지션 자유로 해놓아서 오류일때만 나오도록 설정-->
                    <div class="redtextflex">
                
                    </div>               
                    <input type="password"  id = "password1" name = "pw" placeholder=" 비밀번호" onkeyup="passwordCheckFunction();"> <p>
                    <input type="password"  id = "password2" name = "pw2" placeholder=" 비밀번호" onkeyup="passwordCheckFunction();">
                     <h5 style="color: red;"  id = "checkMessage">뚜비뚜바</h5>
                    <!--비밀번호 확인 입력 오류시에 뜨는 창-->
                    <!--포지션 자유로 해놓아서 오류일때만 나오도록 설정-->
                   

                   
                   
                    <!--회원가입 버튼-->    
                    <div class = "register">
                        <input type="submit" id ="submit1" value = "회원가입 " src="../signupimg/signup.png" alt = "회원가입버튼"
                       >
                    </div> 
                      </form>
                </div>
            </section>

            <aside class="right-side">
            </aside>
         </div>    

       
    </div>
  

</body>
</html>