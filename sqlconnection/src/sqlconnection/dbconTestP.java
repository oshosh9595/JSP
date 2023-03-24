package sqlconnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class dbconTestP {
	
	static Connection con = null;
	static PreparedStatement psmt = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	static CallableStatement cstmt = null;
	
	
	public static void dbsearch() throws SQLException {
		try {
			String uname;
			String email;
			psmt = con.prepareStatement("select * from user");
			rs = psmt.executeQuery();
			
			while(rs.next()) {
					uname = rs.getString("uname");
					email = rs.getString("email");
					System.out.println("이름 : " + uname + ", 이메일 : " + email);
				}
			}catch (Exception e) {
				System.out.println("dbselect 오류");
				e.printStackTrace();
			}
			psmt.close();
		}
	public static void dbinsert() throws SQLException {
		try{
			String sql = "{call InsetUser(?,?,?)}";
	        cstmt = con.prepareCall(sql);
	        Scanner scanner = new Scanner(System.in);
	        System.out.println("uid :");
	        String uid = scanner.nextLine();
	        System.out.println("uname :");
	        String uname = scanner.nextLine();
	        System.out.println("email :");
	        String email = scanner.nextLine();
	        cstmt.setString(1, uid);
	        cstmt.setString(2, uname);
	        cstmt.setString(3, email);
	        cstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("dbinsert 오류");
			e.printStackTrace();
		}
		
		cstmt.close();
	}
	
	public static void dbdelete() throws SQLException {
		try {
			Scanner scanner = new Scanner(System.in);
			psmt = con.prepareStatement("delete from user where uid=?");
			String uid = scanner.next();
			psmt.setString(1, uid);
			int result = psmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("삭제 되었습니다.");
			}else {
				System.out.println("삭제 실패!!");
			}
			
		}catch (Exception e) {
			System.out.println("dbdelete 오류");
			e.printStackTrace();
		}
		
		psmt.close();
	}
	
	public static void dbupdate() throws SQLException {
		try {
			Scanner scanner = new Scanner(System.in);
			psmt = con.prepareStatement("update user set uname=? and email=?");
			
			String uname = scanner.next();
			psmt.setString(1, uname);
			String email = scanner.next();
			psmt.setString(2, email);
			int result = psmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("수정 되었습니다.");
			}else {
				System.out.println("수정 실패!!");
			}
		}catch (Exception e) {
			System.out.println("dbupdate 오류");
			e.printStackTrace();
		}
		
		psmt.close();
	}
	
	public static void main(String[] args) throws SQLException {
	    try {
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pnusw39", "root", "1234");
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        System.out.println("JDBC드라이브 로딩 오류");
	        e.printStackTrace();
	        return;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    while (true) {
	        System.out.println("1. insert:");
	        System.out.println("2. delete:");
	        System.out.println("3. search:");
	        System.out.println("4. update:");
	        System.out.println("5. con :");

	        Scanner scanner = new Scanner(System.in);
	        int choice = scanner.nextInt();
	        switch (choice) {
	            case 1:
	            	dbinsert();
	                break;
	            case 2:
	            	dbdelete();
	                break;
	            case 3:
	            	dbsearch();
	                break;
	            case 4:
	                dbupdate();
	                break;
	        }
	        rs.close();
	        con.close();
	    }
	    
	}
}