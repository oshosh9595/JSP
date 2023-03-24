<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DAO 데이터 가져오기 -->
<%
	BoardDAO dao = new BoardDAO(application);
	Map<String, Object> param = new HashMap<String, Object>();
	List<BoardDTO> aList = dao.selectList(param);
	
	request.setAttribute("aList", aList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board 가져오기</title>
</head>
<body>
<h2>컬렉션 가져오기</h2>
<% for(int i = 0; i < aList.size(); i++) { 
	pageContext.setAttribute("i", i);%>
	<ul>
		<li>번호 : ${ aList[i].num }</li>
		<li>제목 : ${ aList[i].title }</li>
		<li>내용 : ${ aList[i].content }</li>
		<li>날짜 : ${ aList[i].postdate }</li>
		<li>이름 : ${ aList[i].id }</li>
		<li>visitcount : ${ aList[i].visitcount }</li>
	</ul>	
<% } %>
</body>
</html>