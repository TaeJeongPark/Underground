
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
    <title>ȸ������ ������ </title>
    <link href="../css/signup.css" type ="text/css" rel="stylesheet">

</head>
<body>


    <div id="wrapper">
        <header>
            <!--Ȩ ��ư �̹���-->
            <div class="homeimg">
                <img src="../signupimg/Underground.png" class="underground" alt="����׶��� �̹���" onclick="location.href='loginpage.jsp'">
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
                        class = "doublecheck" id = "dbCheckID"  value="�ߺ�Ȯ�� ">
                         </button>
                           <!--���̵� �ߺ� Ȯ�ο� ������ ����-->
                    <input type = "hidden" name = "idDuplication" value = "idUncheck">
                    </div>
                    <form action = "Singupreal.jsp" method = "post" >
                    <input type="text" name = "id" onkeydown="inputIdChk()" placeholder=" ���̵�">

                    <!--���̵� �ߺ� Ȯ�� �Է� �����ÿ� �ߴ� â-->
                    <!--������ ������ �س��Ƽ� �����϶��� �������� ����-->
                    <div class="redtextflex">
                
                    </div>               
                    <input type="password"  id = "password1" name = "pw" placeholder=" ��й�ȣ" onkeyup="passwordCheckFunction();"> <p>
                    <input type="password"  id = "password2" name = "pw2" placeholder=" ��й�ȣ" onkeyup="passwordCheckFunction();">
                     <h5 style="color: red;"  id = "checkMessage">�Ѻ�ѹ�</h5>
                    <!--��й�ȣ Ȯ�� �Է� �����ÿ� �ߴ� â-->
                    <!--������ ������ �س��Ƽ� �����϶��� �������� ����-->
                   

                   
                   
                    <!--ȸ������ ��ư-->    
                    <div class = "register">
                        <input type="submit" id ="submit1" value = "ȸ������ " src="../signupimg/signup.png" alt = "ȸ�����Թ�ư"
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