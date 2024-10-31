<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="image/png;"
    pageEncoding="UTF-8"%>

   <%
   		FileInputStream fis = new FileInputStream("C:/Users/tj/Desktop/pngwing.png");
   		byte[] bs = fis.readAllBytes();
   		ServletOutputStream sos = response.getOutputStream(); //파일 byte개념 문자면 writer()
   		sos.write(bs);
   		
   %>