package kr.co.ict.servlet.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

// BoardListService는 boardList 접속 시 사용하는 로직을 관리합니다.
public class BoardListService implements IBoardService {
	
	// BoardListServlet에서 바인딩까지 복사해오면 됩니다.
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 접속시 BoardDAO 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 2. BoardDAO의 getAllBoardList() 호출해 전체 게시글 정보 받아오기
		List<BoardVO> boardList = dao.getAllBoardList();
		
		// 3. request.setAttribute로 바인딩 하기
		request.setAttribute("boardList", boardList);
		
	}

}
