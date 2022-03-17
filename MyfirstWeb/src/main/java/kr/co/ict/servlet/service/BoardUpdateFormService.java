package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

public class BoardUpdateFormService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String strbNum = request.getParameter("board_num");
		int bNum = 0;
		if(strbNum != null) {
			bNum = Integer.parseInt(strbNum);
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO boardData = dao.getBoardDetail(bNum);
				
		request.setAttribute("boardData", boardData);		
	}

}
