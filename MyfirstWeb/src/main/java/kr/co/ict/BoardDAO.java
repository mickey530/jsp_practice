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

	public List<BoardVO> getAllBoardList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		List<BoardVO> BoardList = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			String getInfo = "SELECT * FROM boardTbl ORDER BY board_num DESC";
			pstmt = con.prepareStatement(getInfo);
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

	
}
