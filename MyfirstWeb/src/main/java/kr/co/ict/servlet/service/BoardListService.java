package kr.co.ict.servlet.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardDTO;
import kr.co.ict.BoardVO;

// BoardListService는 boardList 접속 시 사용하는 로직을 관리합니다.
public class BoardListService implements IBoardService {
	
	// BoardListServlet에서 바인딩까지 복사해오면 됩니다.
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 페이지 번호를 get방식으로 가져옵니다. 저장받아 주세요(?pageNum=번호 형식으로 받아옵니다.)
//		int pageNum = 1;
//		if(request.getParameter("pageNum") != null) {
//			pageNum = Integer.parseInt(request.getParameter("pageNum"));
//		}
		String strpNum = request.getParameter("pageNum");
		int pNum = 0;
		try {
			pNum = Integer.parseInt(strpNum);
		} catch(Exception e) {
			pNum = 1;
		}
		
		// 1. 접속시 BoardDAO 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// 2. BoardDAO의 getAllBoardList() 호출해 전체 게시글 정보 받아오기
		// 페이징 처리에 따라 추가적으로 페이지 번호를 넣어줘야함.
		List<BoardVO> boardList = dao.getAllBoardList(pNum);
		
		// 3. request.setAttribute로 바인딩 하기
		request.setAttribute("boardList", boardList);
		
		// 페이지 버튼 생성을 위한 글 개수 확인하기
		int boardCount = dao.getPageNum();
		// 아래에 DTO 생성해주시고 바인딩까지 해주세요.
		BoardDTO dto = new BoardDTO(boardCount, pNum);
		request.setAttribute("dto", dto);
		System.out.println(dto);
		System.out.println(dto.getStartPage());
		System.out.println(dto.getEndPage());
		
		// 로그인 여부는 세션값을 저장한 다음, 바인딩해서 .jsp페이지에서 확인합니다.
		// 서블릿 내부에서 세션 쓰는 법
		// 1. 세션 객체 생성(.jsp 내부에서는 자동으로 생성되는 "내장 객체" 이지만 서블릿 로직 하에서는 생성해줘야 쓸 수 있음.)
		HttpSession session = request.getSession();
		// 2. .jsp의 스크립트릿 내부와 동일하게 세션값 얻어오기 가능(setAttribute로 저장도 가능)
		String sId = (String)session.getAttribute("userId");
		System.out.println("로그인 여부 : " + sId);
		// 세션 값 체킹이 되면 바인딩해서 포워딩시 세션값이 같이 넘어가도록 처리
		request.setAttribute("sId", sId);
	}

}
