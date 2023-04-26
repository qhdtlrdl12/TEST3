<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String cookieName = "";
   String id = "";
   Cookie[] cookies = request.getCookies();
   if(cookies != null) {
	   for(int i = 0; i < cookies.length; i++) {
		   if(cookies[i].getName().equals("idKey")) {
			   cookieName = cookies[i].getName();
			   id = cookies[i].getValue();
		   }
	   }
	   if(!id.equals("")){
%>
<script>
   alert("로그인 되었습니다");
   location.href = "cookieLoginOK.jsp";
</script>
<%
   }
 }
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <h2 align="center">cookie 로그인</h2>
  <form action="cookieLoginProc.jsp" method="post">
        <table width="300" border="1" align="center" bgcolor="#ffff99">
            <tr bordercolor="#ffff66">
               <td colspan="2" align="center"><b>Login</b></td>
            </tr>
            <tr>
               <td width="47%" align="center">ID</td>
               <td width="53%" align="center"><input name="id"></td>
            </tr>
            <tr>
               <td align="center">PW</td>
               <td align="center"><input name="pw" type="password"></td>
            </tr>
            <tr>
               <td align="center" colspan="2">
               <input type="submit" value="login">
               <input type="reset" value="reset">
               </td>
            </tr>
        </table>
  </form>
  
</body>
</html>