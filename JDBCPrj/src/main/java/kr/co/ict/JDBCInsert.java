package kr.co.ict;

import java.sql.*;
import java.util.Scanner;

public class JDBCInsert {
	
	public static void main(String[] args) {
		// Scanner로 id, pw, name, email을 입력받아
		// INSERT INTO 구문을 이용해 DB에 데이터를 적재하도록 만들어보겠습니다.
		
		// SELECT Q1 처럼 작성해주시되(입력받기, DB연결, 쿼리문 실행 등...)
		// SELECT 구문을 제외한 나머지 INSERT, DELETE, UPDATE 구문은
		// 결과 데이터가 없기 때문에 실행했을 때 에러가 나지 않는다면
		// 우선 실행된 것으로 볼 수 있고, 실행이 된 다음 워크벤치에서
		// 데이터가 들어갔는지 확인해주시면 됩니다.
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("아이디를 입력해주세요.");
		String id = scan.nextLine();
		System.out.println("비밀번호를 입력해주세요.");
		String pw = scan.nextLine();
		System.out.println("이름을 입력해주세요.");
		String name = scan.nextLine();
		System.out.println("이메일을 입력해주세요.");
		String email = scan.nextLine();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1", // 접속 url
					"root", // mysql 아이디
					"11111111"); // mysql 비밀번호
			Statement stmt = con.createStatement();
			
			// 디버깅을 위해 쿼리문 실행 전 콘솔에서 조회해보기
			System.out.println("실행예정 쿼리문");
			System.out.println("INSERT INTO userinfo VALUES('"+name+"', '"+id+"', '"+pw+"', '"+email+"');");
			System.out.println("------------------------------");
			
			// 결과를 자바로 가져오는 것이 아니기 때문에 resultSet 없이 사용
			stmt.executeUpdate("INSERT INTO userinfo VALUES('"+name+"', '"+id+"', '"+pw+"', '"+email+"');");

		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
