package kr.co.ict;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private DataSource ds = null;
	
	private static BoardDAO dao = new BoardDAO();

	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	// 3. 필요로 하는 
	
	// 3-1.
	
	// 3-2.
	
	// 3-3. while문 내부에서 BoardVO 세팅이 가능하도록 RSDP서 데이터 가져오는 부분을 수정합니다.
	
	// 페이징 처리를 위해 페이지 번호를 추가로 입력받습니다.
	public List<BoardVO> getAllBoardList(int pageNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		List<BoardVO> BoardList = new ArrayList<>();
		int limitNum = ((pageNum-1)*10);
		try {
			con = ds.getConnection();
			String getInfo = "SELECT * FROM boardTbl ORDER BY board_num DESC limit ?, 10";
			pstmt = con.prepareStatement(getInfo);
			pstmt.setInt(1, limitNum);
			rs = pstmt.executeQuery();		

			while(rs.next()) {
				int board_num = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bdate = rs.getDate("bdate");
				Date mdate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				
				// 클래스 생성 및 ArrayList에 저장
				BoardVO boardData = new BoardVO(board_num, title, content, writer, bdate, mdate, hit);
				BoardList.add(boardData);
				}
			
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(SQLException se) {
				se.printStackTrace();		
			}
		}
		// 리턴 값
		return BoardList;
	}
	// 이후 form태그 input에서 title, content, writer 에는 required 달아야함
	public void insertBoard(String title, String content, String writer) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String insertInfo = "INSERT INTO boardTbl (title, content, writer) VALUES(?, ?, ?);";
			pstmt = con.prepareStatement(insertInfo);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();		
			}
		}	
	}
	
	// 글 한개가 필요한 상황이므로 BoardVO 하나면 처리 가능
	// SELECT * FROM boardTbl WHERE board_num = ?
	public BoardVO getBoardDetail(int bNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO boardData = null;
		
		try {
			con = ds.getConnection();
			String getInfo = "SELECT * FROM boardTbl WHERE board_num = ?";
			pstmt = con.prepareStatement(getInfo);
			pstmt.setInt(1, bNum);
			rs = pstmt.executeQuery();
			upHit(bNum); // 조회수 올리는 로직을 실행한 다음 글 정보 불러오게 처리
			
			if(rs.next()) {
				int board_num = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bdate = rs.getDate("bdate");
				Date mdate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				boardData = new BoardVO(board_num, title, content, writer, bdate, mdate, hit);
			}
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();		
			}
		
		}
		return boardData;
	}
	// deleteBoard 메서드를 만들어서 삭제처리가 되게 만들어주시고
	// 서블릿에서 해당 메서드를 호출해 실제로 삭제버튼을 누르면 DB에서 해당 번호 글이 삭제되게 해주세요.
	
	public void deleteBoard(int boardNum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String deleteInfo = "DELETE FROM boardTbl WHERE board_num = ?";
			pstmt = con.prepareStatement(deleteInfo);
			pstmt.setInt(1, boardNum);
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();		
			}
		}	
	}
	
	public void updateBoard(String title, String content, int board_num) {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String insertInfo = "UPDATE boardTbl SET title = ?, content = ?, mdate = now() WHERE board_num = ?;";
			pstmt = con.prepareStatement(insertInfo);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, board_num);
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();		
			}
		}	
	}
	// public 으로 걸어서 서브릿에서 그냥 호출해도 됨
	private void upHit(int bId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String sql = "UPDATE boardTbl SET hit = (hit+1) WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bId);
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();		
			}
		}
		
	}
}
