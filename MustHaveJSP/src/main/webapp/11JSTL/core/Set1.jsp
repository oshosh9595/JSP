<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 1</title>
</head>
<body>
	<c:set var="directVar" value="100"/>
	<c:set var="elVar" value="${ directVar mod 5 }"/>
	<c:set var="expVar" value="<%= new Date() %>"/>
	<c:set var="betweeVar"> 변수값 요렇게 설정 </c:set>
	
	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${ pageScope.directVar }</li>
		<li>elVar : ${ elVar }</li>
		<li>expVar : ${ expVar }</li>
		<li>betweeVar : ${ betweeVar }</li>
	</ul>
	
	<h4>자바빈즈 생성 1 - 생성자 사용</h4>
	<c:set var="personVar1" value='<%= new Person("박문수", 50) %>' scope="request"/>
	
	<ul>
		<li>이름 : ${ requestScope.personVar1.name }</li>
		<li>나이 : ${ personVar1.age }</li>
	</ul>
	
	<h4>자바빈즈 생성 2 - target, property 사용</h4>
	
	<c:set var="personVar2" value="<%= new Person() %>" scope="request" />
	<c:set target="${ personVar2 }" property="name" value="정약용" />
	<c:set target="${ personVar2 }" property="age" value="60" />
	
	<ul>
		<li>이름 : ${ personVar2.name }</li>
		<li>나이 : ${ requestScope.personVar2.age }</li>
	</ul>
	
	<h4>자바빈즈 3 - [ActionTag]setProperty 액션 태그로 자바빈스 속성 지정하기 </h4>
	<jsp:useBean id="personVar3" class="common.Person" scope="request" />

	<jsp:setProperty name="personVar3" property="name" value="임꺽정" />
	<jsp:setProperty name="personVar3" property="age" value="41" />
	
	<ul>
		<li>이름 : ${ personVar3.name }</li>
		<li>나이 : ${ requestScope.personVar3.age }</li>
	</ul>
	
	<h4>자바빈즈 4 - [ActionTag] target 으로 사용</h4>
	<jsp:useBean id="personVar4" class="common.Person" scope="request" />
	
	<c:set target="${ personVar4 }" property="name" value="홍길동" />
	<c:set target="${ personVar4 }" property="age" value="20" />
	
	<ul>
		<li>이름 : ${ personVar4.name }</li>
		<li>나이 : ${ requestScope.personVar4.age }</li>
	</ul>
	
</body>
</html>