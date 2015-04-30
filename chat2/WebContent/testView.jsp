<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
			
			TestDao bd = TestDao.getInstance();
			
			List<Test> list = bd.list();
			out.println("<body>");	
				for (int i = 0; i < list.size(); i++) {									
					out.println(list.get(i).getWriter() + " : ");
					out.println(list.get(i).getContent() + "( ");
					out.println(list.get(i).getIp() + " / ");
					out.println(list.get(i).getReg_date() + " )<p>");					
				}			 
			out.println("<body>");
		%>
</body>
</html>