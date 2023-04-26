<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.*, ch11.*" %>
<jsp:useBean id="regMgr" class="ch12.RegisterMgr2"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFCC">
<h1>전체 회원정보 조회</h1>
<table bordercolor="#0000ff" border="1">
   <tr>
        <td><strong>ID</strong></td>
        <td><strong>PWD</strong></td>
        <td><strong>NAME</strong></td>
        <td><strong>NUM1</strong></td>
        <td><strong>NUM2</strong></td>
        <td><strong>EMAIL</strong></td>
        <td><strong>PHONE</strong></td>
        <td><strong>ZIPCODE/ADDRESS</strong></td>
        <td><strong>JOB</strong></td>
   </tr>
     <%
     String id = (String)session.getAttribute("idKey");
      Vector<RegisterBean> vlist = regMgr.getRegisterList(id);
      int counter = vlist.size();
      for(int i = 0; i<vlist.size(); i++){
    	  RegisterBean regBean = vlist.get(i);
   %>
   <tr>
<td><%=regBean.getId()%></td>
<td><%=regBean.getPWD()%></td>
<td><%=regBean.getNAME()%></td>
<td><%=regBean.getNum1()%></td>
<td><%=regBean.getNum2()%></td>
<td><%=regBean.getEmail() %></td>
<td><%=regBean.getPhone()%></td>
<td><%=regBean.getZipcode()%>/<%=regBean.getAddress() %></td>
<td><%=regBean.getJob()%></td>
<%
} 
%>
</tr>
</table>
</body>
</html>