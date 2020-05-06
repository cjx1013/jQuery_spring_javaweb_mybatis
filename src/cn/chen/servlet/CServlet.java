package cn.chen.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CServlet")
public class CServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String xml="<students>"+
				"<student number='chen_001'>"+
				"<name>zhangsan</name>"+
				"<age>18</age>"+
				"</student>"+
				"</students>";
		response.setContentType("text/xml;charset=utf-8");
		response.getWriter().print(xml);
	}


}
