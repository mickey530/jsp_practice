package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCpstmtInsert {

	public static void main(String[] args) {
		// INSERT 구문을 작성해주세요.
		// 변수로 접속정보를 관리합니다.
		String dbType = "com.mysql.cj.jdbc.Driver"; // 업데이트로 인해 없어도 실행 가능하지만 넣어주는게 좋을 듯
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1"; // 접속 url
		String dbId = "root"; // mysql 아이디
		String dbPw = "11111111"; // mysql 비밀번호
		
		try {
			// 0. Scanner로 INSERT에 필요한 정보들 입력받기
			Scanner scan = new Scanner(System.in);
			System.out.println("새로운 계정을 생성합니다.");
			System.out.println("아이디를 입력해주세요.");
			String uid = scan.nextLine();
			
			System.out.println("비밀번호를 입력해주세요.");
			String upw = scan.nextLine();
			
			System.out.println("이름을 입력해주세요.");
			String uname = scan.nextLine();
			
			System.out.println("이메일을 입력해주세요.");
			String uemail = scan.nextLine();
			
			// 1. 접속정보 정의 및 DB 연결하기
			Class.forName(dbType);
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			
			// 2. 쿼리문 생성
			//	  INSERT INTO 구문의 경우는 VALUES (?, ?, ?, ?) 와 같이 값이 들어갈 자리를
			//	  , 로 구분하는 부분까지 문자열로 구현해주셔야 합니다.
			String sql = "INSERT INTO userinfo VALUES(?, ?, ?, ?)";
			
			// 3. pstmt 생성 및 ?에 변수 매칭
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, uid);
			pstmt.setString(3, upw);
			pstmt.setString(4, uemail);
			
			// 4. 실행
			pstmt.executeUpdate();
			
			System.out.println("계정이 생성되었습니다.");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}

