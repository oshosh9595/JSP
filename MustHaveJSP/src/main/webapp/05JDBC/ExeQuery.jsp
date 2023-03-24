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
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>

<table class="table table-dark">
  <thead>
    <th>아이디</th>
    <th>비번</th>
    <th>이름</th>
    <th>날짜</th>
  </thead>
  <tbody>
<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT id, pass, name, regidate FROM member";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	
	while(rs.next()) {
		String id = rs.getString(1);		
		String pw = rs.getString(2);		
		String name = rs.getString("name");
		java.sql.Date regidate = rs.getDate("regidate");
	
		%>
		<tr class="table-active">
			<td><%= id %></td>
			<td><%= pw %></td>
			<td><%= name %></td>
			<td><%= regidate %></td>
		</tr>
		<%
		//out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
	}
	
	jdbc.close();

%>
		
  </tr>
  </tbody>
</table>


</body>
</html>