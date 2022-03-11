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
@WebServlet("/boardUpdateForm")
public class BoardUpdateFromServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFromServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. boarddetail.jsp 에 목적지를 현재 서블릿으로 하고 post 방식 전달을 하는 Form과 submit 버튼 "수정하기"를 만들어주세요.
		// 2. doPost에서 실제로 수정하기를 눌렀을 때 반응이 있는지 체크해주세요.
		// 3. 해당 글번호에 저장된 정보로 수정페이지를 채워야 하니 글 번호도 같이 넘겨지는 지 체크해주세요.
		
		
		// request.getParameter를 이용해 글 번호부터 가져옵니다.
		// 가져온 String 데이터 int로 형변환
		int bNum = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO boardData = dao.getBoardDetail(bNum);
				
		request.setAttribute("boardData", boardData);
		
		RequestDispatcher dp = request.getRequestDispatcher("/board/boardUpdateForm.jsp");
		dp.forward(request, response);

	}

}
