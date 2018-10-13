<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="SBean" class="bean.SBean" scope="session"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/SIS/css/style.css" media="screen" type="text/css" />
<title>Edit Information</title>
</head>
<body>
<form action = "EditServlet">
<center>
Hello, <%=session.getAttribute("Name")%> With Registration Number <%=session.getAttribute("Registration") %>
<br>
<br>
<br>
<b>Please Edit Your Information</b>
<br>
<br>
<br>
<table border="1" width="100%">
<tr>
   <th>Student Registration</th>
   <th>Student Name</th>
   <th>Student Password</th>
   <th>Student Email</th>
   <th>Student Degree</th>
   <th>Student Address</th>
   <th>Student Phone</th>
   <th><input type="submit"></th> 
</tr>
<tr>
   <td><input type="text" name="SID" ></td>
   <td><input type="text" name="SUserName" ></td>
   <td><input type="text" name="SPassword" ></td>
   <td><input type="text" name="SEmail" ></td>
   <td><input type="text" name="Degree" ></td>
   <td><input type="text" name="SAddress" ></td>
   <td><input type="text" name="Phone" ></td> 
</tr>
</table>
</center>
</form>
</body>
</html>