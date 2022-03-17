package kr.co.ict.servlet.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;

public class BoardDeleteService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("userId");
		String writer = request.getParameter("writer");
		String strNum = request.getParameter("board_num");
		int bNum = Integer.parseInt(strNum);
		
		if(sId.equals(writer)) {
			BoardDAO dao = BoardDAO.getInstance();
			dao.deleteBoard(bNum);		
		} 
	}
}
