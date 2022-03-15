package kr.co.ict.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommandPatternServlet
 */
@WebServlet("*.test")
public class CommandPatternServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommandPatternServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("*.test 패턴으로 접속 감지됨");
		// .test 앞에 들어오는 문자가 뭔지 감지해야 사용자의 요청을 파악할 수 있음.
		String uri = request.getRequestURI();
		System.out.println(uri);
		if(uri.equals("/MyfirstWeb/boardlist.test")) {
			response.sendRedirect("http://localhost:8181/MyfirstWeb/board/boardlist.jsp");
		} else if(uri.equals("/MyfirstWeb/login.test")) {
			response.sendRedirect("http://localhost:8181/MyfirstWeb/users/login_form.jsp");
		} else if(uri.equals("/MyfirstWeb/main.test")) {
			response.sendRedirect("http://localhost:8181/MyfirstWeb/");
		} else {
			response.sendRedirect("http://localhost:8181/MyfirstWeb/");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
