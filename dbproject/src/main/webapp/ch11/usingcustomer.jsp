<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, ch11.*" %>
    <jsp:useBean id="cstMgr" class="ch11.CustomerMgr" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스연동</title>
<link href="../style/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>Bean를 사용한 데이터베이스 연동 예제입</h2><br/>
<h3>회원정보</h3>
<table bordercolor="#0000ff" border="1">
   <tr>
        <td><strong>ID</strong></td>
        <td><strong>PWD</strong></td>
        <td><strong>NAME</strong></td>
       
   <%
      Vector<CustomerBean> vlist = cstMgr.getCustomerList();
      int counter = vlist.size();
      for(int i = 0; i<vlist.size(); i++){
    	  CustomerBean cstBean = vlist.get(i);
   %>
   <tr>
<td><%=cstBean.getId()%></td>
<td><%=cstBean.getPwd()%></td>
<td><%=cstBean.getNAME()%></td>

<%
} 
%>
</tr>
</table>
<br/>
total records : <%=counter %>
</body>
</html>