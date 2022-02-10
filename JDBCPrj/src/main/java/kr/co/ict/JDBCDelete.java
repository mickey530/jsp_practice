package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
		
	// 사용자가 Scanner로 아이디를 입력하면
	// 해당 아이디 정보가 DB에서 삭제되도록 로직을 작성해보세요.
	// 역시 executeUpdate("실행문") 으로 실행합니다.
	// > 그냥 execute("실행문")으로도 실행되지만 무지성으로 날리기 때문에 결과 확인x
	// > executeUpdate("실행문") 으로 실행하면 결과에 따라 0 or 1을 리턴해줌
	// 제가 Insert에서 시범 보여드렸듯 실행 전에 콘솔을 이용해서
	// 쿼리문이 제대로 작성되었는지 확인할 수 잇돌고 보여주는 코드도
	// 같이 작성해주세요.
		
		// 접속용 DB 종류, 주소, id, pw는 변수로 관리해도 됩니다.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1"; // 접속 url
		String dbId = "root"; // mysql 아이디
		String dbPw = "11111111"; // mysql 비밀번호
		
		try {
			Scanner scan = new Scanner(System.in);
			System.out.println("삭제할 유저의 아이디를 입력해주세요.");
			String deleteId = scan.nextLine();
			
			// DB종류 지정
			Class.forName(dbType);
			// DB서버와 자바간 연결
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw); 
			// 쿼리문 발송 준미
			Statement stmt = con.createStatement();
			
			// 콘솔에 확인
			System.out.println("DELETE FROM userinfo WHERE uid='" + deleteId + "';");
			
			stmt.executeUpdate("DELETE FROM userinfo WHERE uid='" + deleteId + "';");
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
