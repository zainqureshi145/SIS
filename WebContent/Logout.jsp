<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
</head>

<!--  session invalidated to logout the user -->
<% session.invalidate(); %>
<body>


<center>
<b>Logged Out Successful, Session Invalidated!</b>
<a href = "http://localhost:8080/SIS/index.jsp"><b>Log in Again?</b></a>
</center>
</body>
</html>