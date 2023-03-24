<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
<h2>1.쿠키 (Cookie) 설정</h2>
<%
Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
cookie.setPath(request.getContextPath());
cookie.setMaxAge(300);
response.addCookie(cookie);
%>
<h2>2. 쿠기 설정 직후 쿠키값 확인하기</h2>
<%
Cookie[] cookies = request.getCookies();
if(cookies != null) {
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		
		//화면의 출력
		out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
	}
}
%>

<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
<a href= "CookieResult.jsp">
	다음 페이지에서 쿠키값 확인하시오	
</a>
</body>
</html>