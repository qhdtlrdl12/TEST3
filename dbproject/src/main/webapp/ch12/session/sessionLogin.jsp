<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% //세션에 저장된 아이디값을 가져와 null이 아니면 로그인
   String id = (String)session.getAttribute("idKey");
   if(id!=null){
%>
<script>
    alert("로그인 되었습니다");
    locatoin.href = "sessionLoginOK.jsp";
</script>
<%} %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple Login</title>
</head>
<body bgcolor="#000000" topmargin="100">
<h2 align="center" style="color:white;">G.I.C.E Login</h2>
<table width="75%" border="1" align="center" bordercolor="#660000" bgcolor="#FFFF99">
   <tr bordercolor="#000000">
     <td height="190" colspan="7">
       <form method="post" action="sessionLoginProc.jsp">
          <table width="50%" border="1" align="center" cellspacing="0" cellpadding="0">
             <tr bordercolor="#FFFF66">
                <td colspan="2"><div align="center">Login</div></td>
             </tr>
             <tr>
                <td width="47%"><div align="center">ID</div></td>
                <td width="53%"><div align="center"><input name="id"></div>
             </tr>
             <tr>
                <td><div align="center">PWD</div></td>
                <td><div align="center"><input name="pwd" type="password"></div>
             </tr>
             <tr>
                <td colspan="2"><div align="center">
                  <input type="submit" value="login">&nbsp;
                  <input type="reset" value="reset">
                </div></td>
             </tr>
          </table>
       </form>
     </td>
   </tr>
</table>
</body>
</html>