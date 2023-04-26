<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   //로그인 할때 세션에 저장된 idKey를 가져와서 만약 null이라면 안내 메세지와 함께 로그인 페이지로 이동
   String id = (String)session.getAttribute("idKey");
   if(id==null){
%>
  <script>
        alert("로그인 되지 않았습니다");
        location.href = "sessionLogin.jsp";
   </script>
<%}%>
<%
  //세션에 저장된 nameKey를 다시 name에 저장
  String name = (String)session.getAttribute("nameKey"); 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text.css">
</head>
<body  bgcolor="#000000" topmargin="100">
   <table width="90%" border="1" align="center" bordercolor="#660000" bgcolor="#FFFF99">
   <tr bordercolor="#FFFF99">
     <td height="190" colspan="7">
          <table width="90%" border="1" align="center" cellspacing="0" cellpadding="0">
             <tr bordercolor="#FFFF66">
               <td colspan="5"><div align="center">Log on Page</div></td>
             </tr>
             <tr>
                <td><div align="center">
                <!-- 사용자의 이름을 표시 -->
                   <strong><%=name %></strong>
                   님이 로그인 하셨습니다
                </div></td>
                <td><div align="center"><a href='InfoAll.jsp'>전체정보조회</a></div></td>
                <td><div align="center"><a href="InfoUser.jsp">본인정보조회</a></div></td>
                <td><div align="center"><a href="../../ch13/fileSelectPage.jsp">파일업로드</a></div></td>
                <td><div align="center">
                   <a href="sessionLogout.jsp"><strong>Log out</strong></a>
                </div></td>
             </tr>
           </table>
         </td>
       </tr>
    </table>
</body>
</html>