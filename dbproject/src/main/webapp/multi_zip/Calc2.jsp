<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    errorPage="../Error/Error.jsp"
    %>
 <%

	int result = 0;
	String sig= "";
    
	int num1 = Integer.parseInt(request.getParameter("num1"));  
    int num2 = Integer.parseInt(request.getParameter("num2"));
    
    sig = request.getParameter("sig");
    
    switch(sig) {
	case ("+"):
		result = num1 + num2;
	   break;
	case ("-"):
		result = num1 - num2;
	   break;
	case ("/"):
		try{
			result = num1 / num2;
		}catch(Exception e){
		    	
		}
	
				
	case ("*"):
		result = num1 * num2;
	   break;   
	}
 %>
 
 <h1>jsp ����</h1>
 <hr>
 ����� : <%=num1 + sig + num2 + "=" + result %>