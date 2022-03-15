package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

public class BoardDeleteService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String strNum = request.getParameter("board_num");
		int bNum = Integer.parseInt(strNum);
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(bNum);		
	}

}
