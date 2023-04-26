package ch08;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calcservlet
 */
@WebServlet("/ch08/Calcservlet")
public class Calcservlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int num1 = 0, num2 = 0;
		int result = 0;
		String sig= "";
		
		try {
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		} catch (Exception e) {
			
			out.println("정수만입력해주세요" + e);
			return;
		}
		sig = request.getParameter("sig");
		

		
		switch(sig) {
		case ("+"):
			result = num1 + num2;
		   break;
		case ("-"):
			result = num1 - num2;
		   break;
		case ("/"):
			try {
				result = num1 / num2;

			} catch (Exception e) {
			
			out.println("0으로는 나눌수없습니다");
			return;		
			}break;
		case ("*"):
			result = num1 * num2;
		   break;   
		}
	
		
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>서블릿 계산기</h1>");
		out.println("<hr>");
		out.println("<h2>계산 결과</h2>");
		out.print(num1 + sig + num2 + " " + ":" + " " + result);
		out.println("</body>");
		out.println("</html>");
	}

}
