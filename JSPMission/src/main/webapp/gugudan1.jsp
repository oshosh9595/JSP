<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 구구단</title>
</head>
<body>
	<%
		int dan = Integer.parseInt(request.getParameter("dan"));
	%>
	<h2>구구단 <%= dan%>단 출력</h2>
	
	<%
		for(int i = 1; i < 10; i++) {
	%>
	  	<%= dan %> * <%= i %> = <%= dan*i %>
	  	<br/>	
	<%
	  	}
	%>	
</body>
</html>