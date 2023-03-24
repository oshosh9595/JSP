<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>page 속성의 영역</h2>
	<%
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
	String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	<ul>
		<li>Integer객체 : <%= pInteger %></li>
		<li>String객체 : <%= pString %></li>
		<li>Person객체 : <%= pPerson %></li>
	</ul>
	<h2>include된 파일에 page 영역 읽어오기</h2>
	<%@ include file = "PageInclude.jsp" %>
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>