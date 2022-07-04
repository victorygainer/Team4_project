<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY TRIP</title>
</head>
<body>
<%
//	게시판이 최초로 실행될 때 또는 저장 insert, select, delete, update sql 명령이 실행되고 난 후 
//	브라우저에 표시할 1페이지 분량의 글 목록을 얻어오는 요청을 컨트롤러에게 한다. 
	response.sendRedirect("list.nhn");
%>
</body>
</html>