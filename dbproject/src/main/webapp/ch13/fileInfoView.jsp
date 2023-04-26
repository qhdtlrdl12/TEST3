<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
               java.util.*,java.io.*"
%>
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
  String name2 = (String)session.getAttribute("nameKey"); 
%>
<%
String saveFolder = "C:/filetest";
String encType = "UTF-8";
int maxSize = 10*1024*1024; //10메가

ServletContext context = getServletContext();
ArrayList saveFiles = new ArrayList();
ArrayList origFiles = new ArrayList();

String user = "";
String title = "";
String content = "";

try {
    MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType,
    new DefaultFileRenamePolicy());
    
    user = multi.getParameter("user");
    title = multi.getParameter("title");
    content = multi.getParameter("content");
    
    Enumeration files = multi.getFileNames();
    while(files.hasMoreElements()){
         String name = (String)files.nextElement();
         saveFiles.add(multi.getFilesystemName(name));
         origFiles.add(multi.getOriginalFileName(name));
   }
%>
<html>
<head>
<title>file info page</title>
</head>
<body>
  <table width="75%" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#660000" bgcolor="#FFFF99">
     <tr>
       <td width="10%" bgcolor="#FFCC00" ><div align="right"><strong>user</strong>
       </div></td>
       <td width="30%"><%=name2 %></td>
       <td width="10%" bgcolor="#FFCC00" ><div align="right"><strong>title</strong>
       </div></td>
       <td width="30%"><%=title %></td>
     </tr>
     <tr>
       <td width="10%" bgcolor="#FFCC00" ><div align="right"><strong>content</strong>
       </div></td>
       <td width="50%" colspan="3">
       <textarea cols="50" rows="5" disabled><%=content %></textarea>
       </td>
     </tr>
     <tr><td colspan="4" bgcolor="#ffffff" >&nbsp;</td></tr>
     <tr>
        <td colspan="4"><strong>업로드된 파일들입니다</strong></td>
     </tr>
     <%for(int i=0; i<saveFiles.size(); i++){ %>
     <tr bgcolor="#FFCC00">
       <td colspan="4">
       <a herf="<%="./filetest/"+saveFiles.get(i)%>"><strong><%=origFiles.get(i)%></strong></a>
       </td>
     </tr>
     <%}%>
  </table>
</body>
</html>
<%
}catch (IOException ioe) {
    System.out.println(ioe);
}catch (Exception ex) {
    System.out.println(ex);
}
%>