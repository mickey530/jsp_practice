package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCpstmtDelete {
	
	public static void main(String[] args) {
		// DELETE 구문을 실행하는 코드를 작성해보세요.
		// 삭제의 기분은 uid가 일치하는 자료를 삭제합니다.
		// * 접속 정보는 변수로 관리해주세요.
		
		String dbType = "com.mysql.cj.jdbc.Driver"; // 업데이트로 인해 없어도 실행 가능하지만 넣어주는게 좋을 듯
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1"; // 접속 url
		String dbId = "root"; // mysql 아이디
		String dbPw = "11111111"; // mysql 비밀번호
		
		try {
			// 작성 순서
			// 1. 스캐너로 삭제할 회원 uid 입력받기
			Scanner scan = new Scanner(System.in);
			System.out.println("삭제할 유저의 아이디를 입력해주세요.");
			String uid = scan.nextLine();
			
			// 2. DB와 자바 연결
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			// 3. 쿼리문에 ?를 포함해 작성한 후 PreparedStatement 객체 생성
			String sql = "DELETE FROM userinfo WHERE uid = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// ?에 넣어줄 자료 세팅
			pstmt.setString(1, uid);
			
			// 4. 실행
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
