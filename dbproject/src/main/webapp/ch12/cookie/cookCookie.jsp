<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
   String cookieName = "myCookie";
   Cookie cookie = new Cookie(cookieName, "Apple");
   cookie.setMaxAge(60); //10초
   cookie.setValue("melone");
   response.addCookie(cookie);
%>
<body>
<h1>example cookie</h1>
쿠키를 만듭니다. <br>
쿠키내용은 <a href="tasteCookie.jsp">여기로~~</a>
</body>
</html>