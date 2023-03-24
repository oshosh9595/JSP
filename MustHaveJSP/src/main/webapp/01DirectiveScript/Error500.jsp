<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page 지시어 - erroPage, isErrorPage</title>
</head>
<body>
	<%
		int myAge = Integer.parseInt(request.getParameter("age")) +10; // getParameter url 에 정보 넘겨서 움직일때 필요한거 http://0000.jsp ? 000 &<< ?에 이뒤에붙는게 파라메타
		out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
		
		String name = request.getParameter("name");
		out.println("당신의 이름은 :" + name + "입니다.");
	%>
</body>
</html>