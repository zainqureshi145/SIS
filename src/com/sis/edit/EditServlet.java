package com.sis.edit;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

//import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection connection = null;
	String SUsername = null;
	String SPasword = null;
	String SEmail = null;
	String SID = null;
	String Phone = null;
	String SAddress = null;
	String Degree = null;

	PreparedStatement ps = null;
	ResultSet rs = null;

	String url = "jdbc:mysql://localhost:3306/SISDB";
	String user = "root";
	String password = "";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("Connection Established ");
		} catch (Exception e) {
			System.out.println("Database Error");
		}
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// From JSP
		String SUserName = request.getParameter("SUserName");
		String SPassword = request.getParameter("SPassword");
		String SEmail = request.getParameter("SEmail");
		String SID = request.getParameter("SID");
		String Phone = request.getParameter("Phone");
		String SAddress = request.getParameter("SAddress");
		String Degree = request.getParameter("Degree");

		//String RegQuery = "Select * From Student";
		try {
			//ps = connection.prepareStatement(RegQuery);SID,Sname,Spass,Semail,Degree,Saddress,Phone
			//rs = ps.executeQuery();

			ps = connection.prepareStatement("UPDATE Student SET SID = ?, Sname = ?, Spass = ?, Semail = ?, Degree = ?, Saddress = ?, Phone = ? WHERE SID = ?");
			ps.setString(1, SID);
		    ps.setString(2, SUserName);
		    ps.setString(3, SPassword);            
		    ps.setString(4, SEmail);
		    ps.setString(5, Degree);
		    ps.setString(6, SAddress);
		    ps.setString(7, Phone);
		    ps.setString(8, SID);
		    ps.executeUpdate();
		    
		    String url = "/Display.jsp";
		    RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		    rd.forward(request, response);
		}// try
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// catch
		
		
		//
		
		
	}//doGet// TODO Auto-generated method stub
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
