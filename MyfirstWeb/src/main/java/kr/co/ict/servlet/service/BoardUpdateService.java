package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;

public class BoardUpdateService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("userId");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String bNum = request.getParameter("board_num");
		int board_num = Integer.parseInt(bNum);
		
		if(sId.equals(writer)) {
			BoardDAO dao = BoardDAO.getInstance();
			dao.updateBoard(title, content, board_num);			
		}
		request.setAttribute("board_num", board_num);
	}

}
