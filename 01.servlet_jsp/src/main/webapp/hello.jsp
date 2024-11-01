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
	.aa{
		background-color : black;
		color : white;
	}
</style>
</head>
<body>
	<% int num = 10; %>
	<h1 id="c">Hello world!</h1>
	<h2><%=LocalDateTime.now() %></h2>
	<div class="aa">
	<% for(int i = 2 ; i <= 9 ;i++){
		for(int j = 1 ; j <10 ; j++){
			out.println(String.format("<p>%d * %d = %d</p>",i,j,i*j));
		}
	}
		%>
	</div>
	<script>
		const num = `<%=num%>`; 
		alert(num);
	</script>
</body>
</html>