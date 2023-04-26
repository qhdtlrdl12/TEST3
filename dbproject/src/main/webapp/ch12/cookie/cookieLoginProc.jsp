<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch12.RegisterMgr"/>
<%
  String id = "";
  String pw = "";
 if(request.getParameter("id")!=null)
	 id = request.getParameter("id");
 if(request.getParameter("pw")!=null)
	 pw = request.getParameter("pw");
 if(regMgr.loginRegister(id,pw)) {
	 Cookie cookie = new Cookie("idKey",id);
	 cookie.setMaxAge(10);
	 response.addCookie(cookie);
%>
<script>
   alert("로그인 되었습니다.");
   location.href="cookieLoginOK.jsp";
</script>
<%}else{%>
<script>
   alert("로그인 되지 않았습니다");
   location.href="cookieLogin.jsp";
</script>
<%}%>