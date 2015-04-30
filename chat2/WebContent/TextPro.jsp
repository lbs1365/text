<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.*" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% request.setCharacterEncoding("utf-8"); %>
</head>
<body>
<jsp:useBean id="test" class="test.Test"/>
<jsp:setProperty property="*" name="test"/>

<%
		
	TestDao td = TestDao.getInstance();
	
	test.setContent(request.getParameter("content"));
	test.setWriter(request.getParameter("writer"));
	test.setIp(request.getRemoteAddr());
	
	int result = td.insert(test);
	
	if(result >0){
%>
		<script type="text/javascript">
			location.href = "testMain.jsp";
		</script>
<%
	}else{
%>
		<script type="text/javascript">
			alert("똑바로 해");
			history.back();
		</script>
<%		
	}
%>
</body>
</html>