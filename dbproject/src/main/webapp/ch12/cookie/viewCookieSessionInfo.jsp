<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   Enumeration en = session.getAttributeNames();
   while(en.hasMoreElements()) {
	   String name = (String)en.nextElement();
	   String value = (String)session.getAttribute(name);
	   out.println("session name : " + name + "<br/>");
	   out.println("session value : " + value + "<br/>");
   }
%>
----------------------------------------------------<br>
<%
  Cookie[] cookies = request.getCookies();
  if(cookies!=null) {
	  for(int i = 0; i < cookies.length; i++){
		  //if(cookies[i].getName().equals("myCookie")){
%>			  
			  Cookie Name = <%=cookies[i].getName() %><br>
			  Cookie Value = <%=cookies[i].getValue() %>
<% 			  
		 // }
	  }
  }
%>
</body>
</html>