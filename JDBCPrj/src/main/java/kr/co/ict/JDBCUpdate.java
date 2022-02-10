package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCUpdate {
	
	public static void main(String[] args) {
		// UPDATE구문도 처리해보세요.
		// UPDATE는 id는 변경하지 않습니다.
		// 어떤 아이디의 pw, name, email을 변경할지 조회하기 위해
		// 먼저 id를 받고, 그 다음
		// pw, name, email을 받아서
		// UPDATE 구문에서 조건절에 id를 넣어 타겟을 정하고
		// 나머지 항목만 수정되도록 처리해주세요.
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1"; // 접속 url
		String dbId = "root"; // mysql 아이디
		String dbPw = "11111111"; // mysql 비밀번호
		

		
		try {
			// DB종류 지정
			Class.forName(dbType);
			// DB서버와 연결
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw); 
			// 쿼리문 발송 준비
			Statement stmt = con.createStatement();
			
			// Scanner로 입력받기
			Scanner scan = new Scanner(System.in);
			
			System.out.println("아이디를 입력해주세요.");
			String uid = scan.nextLine();
			
			System.out.println("수정할 비밀번호를 입력해주세요.");
			String upw = scan.nextLine();
			
			System.out.println("수정할 이름를 입력해주세요.");
			String uname = scan.nextLine();
			
			System.out.println("수정할 이메일을 입력해주세요.");
			String uemail = scan.nextLine();
			
			// 콘솔창에 찍어서 디버깅
			System.out.println("UPDATE userinfo SET upw = '"+ upw +"' WHERE uid = '"+ uid + "';");
			System.out.println("UPDATE userinfo SET uname = '"+ uname +"' WHERE uid = '"+ uid + "';");
			System.out.println("UPDATE userinfo SET uemail = '"+ uemail +"' WHERE uid = '"+ uid + "';");
			
			// DB에 반영
			stmt.executeUpdate("UPDATE userinfo SET upw = '"+ upw +"' WHERE uid = '"+ uid + "';");
			stmt.executeUpdate("UPDATE userinfo SET uname = '"+ uname +"' WHERE uid = '"+ uid + "';");
			stmt.executeUpdate("UPDATE userinfo SET uemail = '"+ uemail +"' WHERE uid = '"+ uid + "';");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
