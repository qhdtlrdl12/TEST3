<%@page import="ch12.RegisterMgr2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ch12.RegisterMgr2"/>
<%
    String id = "";
    String pwd = "";
    String name = "";
    //가져온 아이디와 비밀번호가 null이 아니면 각각 id,pwd에 저장  
    if(request.getParameter("id")!=null)
	 id = request.getParameter("id");
    if(request.getParameter("pwd")!=null)
	 pwd = request.getParameter("pwd");
    //위에 저장된 id와 비밀번호를 집어넣어 Bean에 loginRegister메서드를 실행
	if(regMgr.loginRegister(id, pwd)){
	//세션에 idKey라는 키(이름)로 id를 세션에 저장	
	session.setAttribute("idKey",id);
	//저장된 id를 Bean에 getRegister()메서드를 실행 나온값을 name에 저장
	name = regMgr.getRegister(id);
	//저장된 name을 nameKey라는 키(이름)로 name을 세션에 저장
	session.setAttribute("nameKey", name);
%>
   <!-- loginRegister메서드를 실행해서 true가 나올 경우 -->
  <script type="text/javascript">
       alert("로그인 되었습니다");
       location.href = "./sessionLoginOK.jsp";
  </script>
<% }else{%>
    <!-- loginRegister메서드를 실행해서 false가 나올 경우 -->
   <script type="text/javascript">
        alert("로그인 되지 않았습니다");
        location.href = "./sessionLogin.jsp";
   </script>
<%}%>