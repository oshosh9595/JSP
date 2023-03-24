<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 구구단</title>
</head>
<body>
<h1>구구단</h1>
	
	<%
		int cols = Integer.parseInt(request.getParameter("col"));
		
		for(int i = 2; i <= 9; i += cols) {
	%>
		<table>
			<tr>
				<%
					for(int j = 0; j < cols; j++) {
						int col = i + j;
						if(col <= 9) {
				%>
						<th><%= col %>단</th>
				<%
						}
					}
				%>
			</tr>
			<tr>
				<%
					for(int j = 0; j < cols; j++) {
						int col = i + j;
						if(col <= 9) {
				%>
						<td>
							<%
								for(int k = 1; k <= 9; k++) {
							%>
							<%= col %> x <%= k %> = <%= col * k %><br>
							<%
								}
							%>
						</td>
				<%
						}
					}
				%>
			</tr>
		</table>
		<br>
	<%
		}
	%>
</body>
</html>