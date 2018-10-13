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
<title>Student Display</title>
</head>
<body>
<form action = "RegServlet">
<center>
<h1>Student's Information</h1>
<br>
<br>
<br>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/SISDB"
     user="root"  password=""/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * From Student;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>Student Registration</th>
   <th>Student Name</th>
   <th>Student Password</th>
   <th>Student Email</th>
   <th>Student Degree</th>
   <th>Student Address</th>
   <th>Student Phone</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.SID}"/></td>
   <td><c:out value="${row.Sname}"/></td>
   <td><c:out value="${row.SPass}"/></td>
   <td><c:out value="${row.Semail}"/></td>
   <td><c:out value="${row.Degree}"/></td>
   <td><c:out value="${row.Saddress}"/></td>
   <td><c:out value="${row.Phone}"/></td>
</tr>
</c:forEach>
</table>

</center>
</form>
</body>
</html>