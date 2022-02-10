package kr.co.ict;
import java.sql.*;
import java.util.Scanner;

public class JDBCSelectQ1 {
	
	public static void main(String[] args) {
		// Scanner를 이용해 uid를 받은 다음
		// 방금 한 SELECT 구문을 응용해서
		// WHERE uid = 입력받은 아이디
		// 형식으로 내가 조회한 아이디의 정보만
		// 콘솔에 찍히도록 로직을 작성해주세요.
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("조회할 유저의 아이디를 입력해주세요.");
		String uid = scan.nextLine();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1", // 접속 url
					"root", // mysql 아이디
					"11111111"); // mysql 비밀번호
			Statement stmt = con.createStatement();
			
			// resultSet은 자바로 데이터를 가져와서 저장하기 위한 세팅
			ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo WHERE uid=" + "'" + uid + "'");

			while(rs.next()) {
					if(rs.getString("uid").equals(uid)) {
					System.out.println("이름 : " + rs.getString("uname"));
					System.out.println("아이디 : " + rs.getString("uid"));
					System.out.println("비밀번호 : " + rs.getString("upw"));
					System.out.println("이메일 : " + rs.getString("uemail"));
					}
			}
			
		} catch(Exception e){ 
		}
	}
}
