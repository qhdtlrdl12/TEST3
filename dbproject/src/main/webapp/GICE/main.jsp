<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Document</title>
    <link rel="stylesheet" href="../style/main_css.css?etgfds">
    <style type="text/css">
       @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap');
    </style>
</head>

<body>
    <div id="video_container">
        <video  autoplay muted loop>
            <source src="../video/earth.mp4" type="video/mp4">
        </video> 
    </div>
    <header>
    <form id="logo">
        <div>G.I.C.E</div>
        <div><a href="../ch12/session/sessionLogin.jsp"><input type="button" value="로그인"></a></div>
    </form>
    </header>
    <nav>
        <ul>
            <li><a href="../multi_zip/CalcBean.html">빈즈계산기</a></li>
            <li><a href="../multi_zip/calc.html">서블릿계산기</a></li>
            <li><a href="../multi_zip/Calc1.html">jsp계산기</a></li>
            
        </ul>
    </nav>
</body>

</html>