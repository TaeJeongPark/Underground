<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css"> 
a { text-decoration:none } 
a:link {text-decoration:none; color: #FFFFFF;}
a:visited {text-decoration:none; color: #FFFFFF;}
a:active {text-decoration:none; color: #FFFFFF;}
a:hover {text-decoration:none; color: #FFFFFF;}

#submit1{
width: 250px;
height: 50px;

} 

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

</style> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�α��� ������ </title>
    <link href="../css/loginpage.css" type ="text/css" rel="stylesheet">
</head>
<body>
    <div id="wrapper">
        <header>
            <!--�� ����-->
            <div class="headerbox">            
            </div>
            <!--ȸ������ ��ư-->
            <div class="selectbtn">         
            <a href="signup.jsp">ȸ������</a>
            </div>  
        </header>

        <div class = "middle">
            <aside class="left-side">                
            </aside>

            <section class="content">
                <img src="../loginpageimg/Underground.png" class="underground" alt="����׶��� �̹���">

                <div class="inputId">
                    <form action = "Logincheck.jsp" method = "post">
                    <input type="text" name = "id" placeholder=" ���̵�">
                    <input type="password" id = "password1" name = "pw" placeholder=" ��й�ȣ">
                       
                    <!--���̵� �Է� �����ÿ� �ߴ� â-->
                    <!--������ ������ �س��Ƽ� �����϶��� �������� ����-->
                     
                    <!--�α��� ��ư-->    
                    <div class = "register">
                        <input type="submit"  id = "submit1" alt = "�α��ι�ư" value="�α���">
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