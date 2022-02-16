package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO 클래스는 DB연동을 전담하여 처리합니다.
public class UserDAO {
	
	// DB접속에 필요한 변수들을 아래에 선언합니다.
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	private String dbId = "root";
	private String dbPw = "11111111";
	
	// 생성자를 이용해 생성할 때 자동으로 Class.forName()을 실행하게 만듭니다.
	// 어떤 구문을 실행하더라도 공통적으로 필요한 부분
	public UserDAO() {
		try {
			Class.forName(dbType);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// user_list2.jsp 의 코드 로직을 대체해보겠습니다.
	// user_list2.jsp에서 전체 유저 목록을 필요로 하기 때문에
	// 실행 결과로 List<UserVO>를 리턴해줘야 합니다.
	// 역시 SELECT구문을 실행할 때에는 리턴자료가 필요하고
	// INSERT, DELETE, UPDATE구문을 실행할 때는 리턴자료가 void입니다.
	public List<UserVO> getAllUserList(){
		// try블럭 진입 전 Connection, PreparedStatement, ResultSet을 선언합니다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		// try블럭 진입 전에 ArrayList 선언
		List<UserVO> userList = new ArrayList<>();
		try {
			// connection, PrepareStatement, ResultSet을 선언합니다.
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 3 SELECT * FROM userinfo 실행 및 ResultSet에 저장
			String getInfo = "SELECT * FROM userinfo";
			pstmt = con.prepareStatement(getInfo);
			
			rs = pstmt.executeQuery();		
			
			// UserVO ArrayList에 rs에 든 모든 자료를 저장해주세요.
			while(rs.next()) {
				String uName = rs.getString("uname");
				String uId = rs.getString("uid");
				String uPw = rs.getString("upw");
				String uEmail = rs.getString("uemail");
				
				// 클래스 생성 및 ArrayList에 저장
				UserVO userData = new UserVO(uName, uId, uPw, uEmail);
				userList.add(userData);
				
				}
			
			
		} catch(Exception e){
			e.printStackTrace();		
		} finally{
			// 메인메서드가 이니기 때문에 그냥 하면 에러가 발생하고
			// SQLException까지 해줘야함?
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(SQLException se) {
				se.printStackTrace();		
			}
		}
		// 리턴 값
		return userList;

	}
	
	
	// login_update.jsp의 경우 로그인한 유저 한 명의 데이터만 DB에서 얻어옵니다.
	// 따라서, 그 한 명의 유저 데이터만을 이용해 SELECT 구문을 써야 합니다.
	public UserVO getUserData(String sId) {
		// 접속로직은 getAllUserList()와 큰 차이가 없고 쿼리문만 좀 다릅니다.
		// connection, PrepareStatement, ResultSet을 선언합니다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserVO userInfo = null;
		try {
			// DB 연결
			Class.forName(dbType);
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 유저 정보 요청
			String getInfo = "SELECT * FROM userinfo WHERE uid = ?";
			pstmt = con.prepareStatement(getInfo);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			// ResultSet에 정보가 안들어왔을 때 에러를 방지하기 위해 
			// if문 조건절에 rs.next()를 넣는것이 더 안전
			if(rs.next()) {
				String uname = rs.getString("uname");
				String uid = rs.getString("uid");
				String upw = rs.getString("upw");
				String uemail = rs.getString("uemail");
				userInfo = new UserVO(uname, uid, upw, uemail);		
			}
			
			
		} catch(Exception e) {
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
		
		return userInfo; // DB에서 UserVO에 데이터를 받아주신 다음 null 대신 받아온 데이터를 리턴하세요.
		
	}
}
