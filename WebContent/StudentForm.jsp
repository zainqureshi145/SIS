<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/SIS/css/style.css" media="screen" type="text/css" />
<title>Student Form</title>
</head>
<body>
<form action = "Servlet">
<center>
Hello, <%=session.getAttribute("Name")%> With Registration Number <%=session.getAttribute("Registration") %>
<br>
<br>
<br>
</center>
<center>
<b>You Can Perform Following Actions</b>
<br>
<br>
<br>
<a href = "SIDisplay.jsp"><b>Display Personal Information</b></a><br>
<a href = "Instructor.jsp"><b>Faculty Members</b></a><br>
<a href = "Enrollment.jsp"><b>Your Current Enrollment</b></a><br>
<a href = "Courses.jsp"><b>Display All Courses</b></a><br>
<a href = "SIEdit.jsp"><b>Edit Your Personal Information</b></a><br>
<a href = "Logout.jsp"><b>Logout</b></a><br>
</center>
</form>
</body>
</html>