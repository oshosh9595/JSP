package edu.pnu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class JDBCClientMySQL3 {

	public int printColumnName(ResultSet rs) throws Exception {
		ResultSetMetaData meta = rs.getMetaData();
		int count = meta.getColumnCount();
		
		StringBuilder sb = new StringBuilder("#");
		for (int i = 1 ; i <= count ; i++) {
			sb.append("," + meta.getColumnName(i));
		}
		System.out.println(sb);
		System.out.println("-".repeat(sb.length()));
		return count;
	}
	
	// 
	public void StudyStatement1(Connection con) throws Exception {

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from board");
		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}
	
	public void StudyStatement2(Connection con) throws Exception {

		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from member");
		int colCount = printColumnName(rs);
		int rowCount = 1;
		while(rs.next()) {
			for(int i = 1 ; i <= colCount ; i++) {
				if (i == 1)	System.out.print((rowCount++) + ",");
				else		System.out.print(",");
				System.out.print(rs.getString(i));
			}
			System.out.println();
		}
		rs.close();
		st.close();
	}

	
	public static void main(String[] args) throws Exception  {

		JDBCClientMySQL3 cli = new JDBCClientMySQL3();

		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/musthave	", "musthave", "tiger");)
		{
			
			System.out.println("<=== StudyStatement ===>");
			cli.StudyStatement1(con); //cli 에 메서들 파라미터로 con 넘겨받다
			System.out.println();

			System.out.println("<=== StudyStatement ===>");
			cli.StudyStatement2(con); //cli 에 메서들 파라미터로 con 넘겨받다
			System.out.println();
		}		
	}
}
