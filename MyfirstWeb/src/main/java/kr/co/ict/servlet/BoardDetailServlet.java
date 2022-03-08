package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/boarddetail")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.getParameter를 이용해 글 번호부터 가져옵니다.
		// 가져온 String 데이터 int로 형변환
		int bNum = Integer.parseInt(request.getParameter("board_num"));
		
		// dao 생성
		BoardDAO dao = BoardDAO.getInstance();
		// dao에서 해당 글 번호에 대한 정보를 가져오고
		BoardVO boardData = dao.getBoardDetail(bNum);
		
		// 정보가 제대로 들어왔는지 디버깅
		System.out.println(boardData);
		
		// 바인딩
		request.setAttribute("boardData", boardData);
		
		// 포워딩
		RequestDispatcher dp = request.getRequestDispatcher("/board/boarddetail.jsp"); // 보내는 주소
		dp.forward(request, response);

	}

}
