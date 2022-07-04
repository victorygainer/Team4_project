<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
onload = function() {
	 encodeURIComponent();
		alert('<%=msg%>')
		location.href="./login.nhn"
	}
</script>
<head>
<meta charset="UTF-8">
<title>MY TRIP</title>
</head>
<body>
</body>
</html>