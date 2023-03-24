<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<h2>Wolrd 컬럼 조회</h2>

<table class="table table-dark">
  <thead>
   <tr>
    <th>Count</th>
    </tr>
  </thead>
  <tbody>
<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "select count(*) as Count from countrylanguage where language = 'English'";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	
	while(rs.next()) {
		int count = rs.getInt(1);
		
		%>
		<tr class="table-active">
			<td><%= count %></td>
		</tr>
		<%
	}
	
	jdbc.close();

%>
  </tbody>
</table>


</body>
</html>