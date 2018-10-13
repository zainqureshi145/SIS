<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="SID" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/SIS/css/style.css" media="screen" type="text/css" />
<title>Welcome</title>
</head>
<body>
<form action = "Servlet">
<center>
<b>Welcome to Student Information Portal</b><br>
<b>Please Select</b><br>
<a href = "http://localhost:8080/SIS/StudentLogin.html"><b>Portal Login</b></a><br>
<a href = "http://localhost:8080/SIS/Register.jsp"><b>Register New</b></a><br>
</center>
</form>
</body>
</html>