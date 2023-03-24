package sqlconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class dbconTest {
	
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db0220", "root", "1234");
			Class.forName("com.mysql.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC드라이브 로딩 오류");
			e.printStackTrace();
			return;
		}
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Scanner scanner = new Scanner(System.in);
		
		try {
			
			while(true) {
				System.out.println("1. select:");
				System.out.println("2. insert:");
				System.out.println("3. delete:");
				System.out.println("4. update:");
				int choice = scanner.nextInt();
				switch(choice) {
					case 1: 
						try {
							psmt = conn.prepareStatement("select * from book");
							//psmt = conn.prepareStatement("insert into book values(15, '야구의 기술', '길벗', 10000)");
							rs = psmt.executeQuery();
							//psmt.executeUpdate();
							
							// insert는 주석처리한거는 뺴도된다
							while(rs.next()) {
								//int id = rs.getInt(0);
								
								String bookname = rs.getString("bookname");
								String publisher = rs.getString("publisher");
								System.out.println("도서명 : " + bookname + "출판사 : " + publisher);
							}	
						}catch(SQLException e) {
							System.out.println("DB 연결 오류");
						}finally {
							try {
								if(psmt != null) psmt.close();
								if(conn != null) conn.close();
							}catch(Exception e) {
								e.printStackTrace();
							}
							
						}
						break;
					case 2: 
						try {
							String sql = "insert into book values(17, '야구의 손', '길투벗', 10000)";
							psmt = conn.prepareStatement(sql);
							psmt.executeUpdate();
						}catch(SQLException e) {
							System.out.println("DB 연결 오류");
						}finally {
							try {
								if(psmt != null) psmt.close();
							}catch(Exception e) {
								e.printStackTrace();
							}
						}
						break;
					case 3:
						try {
							
							psmt = conn.prepareStatement("delete from book where id=15");
							psmt.executeUpdate();
						}catch(SQLException e) {
							System.out.println("DB 연결 오류");
						}finally {
							try {
								if(psmt != null) psmt.close();
							}catch(Exception e) {
								e.printStackTrace();
							}
							
						}
						break;
					case 4:
						try {
							psmt = conn.prepareStatement("update book set bookname='컴퓨터 과학 입문', publisher='한빛미디어' where id=15");
							psmt.executeUpdate();
						}catch(SQLException e) {
							System.out.println("DB 연결 오류");
						}finally {
							try {
								if(psmt != null) psmt.close();
							}catch(Exception e) {
								e.printStackTrace();
							}
							
						}
						break;
					}
				}
		
			}catch(SQLException e) {
				System.out.println("DB 연결 오류");
			}finally {
				try {
					if(psmt != null) psmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
		}
		
	}
}