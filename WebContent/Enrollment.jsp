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
<form action = "Servlet">
<center>
Hello, <%=session.getAttribute("Name")%> With Registration Number <%=session.getAttribute("Registration") %>
<br>
<br>
<br>
<h1>Your Teachers</h1><br><br>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/SISDB"
     user="root"  password=""/>


<%

try {
	String SID = (String)session.getAttribute("Registration");
	
	System.out.println(SID);

	Connection connection;
	PreparedStatement ps = null;
	ResultSet rs = null;

	String url = "jdbc:mysql://localhost:3306/SISDB";
	String user = "root";
	String password = "";
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, user, password);
	System.out.println("Connection Established ");
	
    ps = connection.prepareStatement("Select * From Enrollment Where Student_SID = ?");
    //ps = connection.prepareStatement("Select * From Student, Enrollment Where Student.SID = Enrollment.Student_SID;");
    ps.setString(1, SID);
    //ps.setString(0, SID);
    rs = ps.executeQuery();
   %>
   <%
    while(rs.next()){
    %>
<table border = "1" width = "100%">
<tr>
   <th>Student ID</th> 
   <th>Course ID</th>
  <th>Instructor ID</th>
   <th>Semester ID</th>
</tr>
<tr>
   <th><%=rs.getString(1)%></th>
   <th><%=rs.getString(2)%></th>
   <th><%=rs.getString(3)%></th>
   <th><%=rs.getString(4)%></th>
   </tr>
</table>
<%
    }
}
    catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}// catch
	%>


</center>
</form>
</body>
</html>