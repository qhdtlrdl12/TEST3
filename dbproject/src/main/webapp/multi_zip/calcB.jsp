<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    errorPage="../Error/Error.jsp"
    %>
    
    <% 
    String num1 = request.getParameter("num1");
    String num2 = request.getParameter("num2");
    String multi = request.getParameter("multi");
    %>
<jsp:useBean id="calc" class="ch09.CalcBean"/>
<jsp:setProperty property="*" name="calc"/>
<%
if(request.getMethod().equals("POST")) {
	calc.calcurate(); 
}%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>빈즈 계산기</h1>
<hr>
계산결과 : <%=num1 + multi + num2 + "=" %> <jsp:getProperty property="result" name="calc"/>

</body>
</html>