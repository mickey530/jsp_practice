package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCpstmtUpdate {

	public static void main(String[] args) {
		// 변수로 관리
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbpw = "11111111";
	
		try {
			// DB 연결
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbpw);
			
			// 입력받을 데이터
			Scanner scan = new Scanner(System.in);
			System.out.println("내용을 수정할 아이디를 입력해주세요.");
			String uid = scan.nextLine();
			System.out.println("새로운 비밀번호를 입력해주세요.");
			String upw = scan.nextLine();
			System.out.println("새로운 이름을 입력해주세요.");
			String uname = scan.nextLine();
			System.out.println("새로운 이메일을 입력해주세요.");
			String uemail = scan.nextLine();
			
			// 쿼리문 세팅
			String sql = "UPDATE userinfo SET upw = ?, uname = ?, uemail = ? WHERE uid = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upw);
			pstmt.setString(2, uname);
			pstmt.setString(3, uemail);
			pstmt.setString(4, uid);
			
			pstmt.executeUpdate();
			
			// .close()로 열린 자료 닫기
			// 일반 자바코드는 어차피 코드실행이 끝나면 프로그램이 강제로 종료되지만
			// 서버의 경우는 코드실행이 씉나도 서버가 계속 돌아가 자원회수를 안 해주면 점점 시스템에 부하가 걸릴 수도 있음.
			// 이를 막기 위해 호툴이 끝난 자원은 .close()로 사용해제를 해 줘야 함.
			con.close();
			pstmt.close();
			scan.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// 종료 안내 구문
			System.out.println("내용이 수정되었습니다.");
		}
	}
}
