package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardInsertFormServlet
 */
@WebServlet(name = "boardInsertForm", urlPatterns = { "/boardInsertForm" })
public class BoardInsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 그냥 리다이렉트를 사용하면 .jsp가 노출됨.
		// response.sendRedirect("http://localhost:8181/MyfirstWeb/board/boardInsert.jsp");
		
		RequestDispatcher dp = request.getRequestDispatcher("http://localhost:8181/MyfirstWeb/board/boardInsert.jsp");
		dp.forward(request, response);
	}
}
