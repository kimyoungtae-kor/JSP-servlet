<%@page import="java.sql.Array"%>
<%@page import="org.apache.catalina.tribes.util.Arrays"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		font-size: 90px;

	}
	h2{
		font-size: 38px;
	}
</style>
</head>
<body>
	
	<h1 id="c">Hello world!</h1>
	<h2><%=LocalDateTime.now() %></h2>
	
</body>
</html>