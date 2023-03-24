<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	String mysqlDriver = application.getInitParameter("MysqlDriver");
	String mysqlURL = application.getInitParameter("MysqlURL");
	String mysqlId = application.getInitParameter("MysqlId");
	String mysqlPwd = application.getInitParameter("MysqlPwd");
	
	MemberDAO dao = new MemberDAO(mysqlDriver, mysqlURL, mysqlId, mysqlPwd);
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	
	if(memberDTO.getId() != null){
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp");
	}
	else{
		request.setAttribute("LoginErrMsg", "로그인 오류입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}	
	
	/* 바로확인용
	if(userId.equals("musthave") && userPwd.equals("1234")){
		session.setAttribute("UserId", userId);
		session.setAttribute("UserName", userId);
		response.sendRedirect("LoginForm.jsp");
	}
	else{
		request.setAttribute("LoginErrMsg", "로그인 오류입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>