
import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection connection = null;
	String SUsername = null;
	String SPasword = null;
	String Email = null;
	String Registration = null;
	String Phone = null;
	String Address = null;
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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Error = "Error.jsp";
		//String index = "index.jsp";
		// PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		//RequestDispatcher dispatcher1 = request.getRequestDispatcher(Error);
		//RequestDispatcher dispatcher2 = request.getRequestDispatcher(index);

		// From JSP
		String SUserName = request.getParameter("SUserName");
		String SPassword = request.getParameter("SPassword");
		//String Email = request.getParameter("SEmail");
	    String Registration = request.getParameter("SID");
		String Phone = request.getParameter("Phone");
		//String Address = request.getParameter("SAddress");
		String Degree = request.getParameter("Degree");

		String LoginQuery = "Select * From Student";
		try {
			ps = connection.prepareStatement(LoginQuery);
			rs = ps.executeQuery();

			String Sname = null;
			String Spass = null;
			String Semail = null;
			String SID = null;
			String SDegree = null;
			String Saddress = null;
			String SPhone = null;

			// Login
			while (rs.next()) {
				Sname = rs.getString("Sname");// Column Name in Database
				Spass = rs.getString("Spass");
				Semail = rs.getString("Semail");
				SID = rs.getString("SID");
				SDegree = rs.getString("Degree");
				Saddress = rs.getString("Saddress");
				SPhone = rs.getString("Phone");
				if (SID.equals(Registration) && Spass.equals(SPassword)) {
					System.out.println("User in Database Found !!");

					System.out.println("Welcome! " + Sname + "\n"
							+ "Your Registration No. is " + SID + "\n"
							+ "Your Email is " + Semail + "\n"
							+ "Your Degree is " + SDegree + "\n"
							+ "Phone Number is " + SPhone + "\n"
							+ "Address is " + Saddress + "\n");
					//dispatcher1.forward(request, response);
					// response.sendRedirect("StudentForm.jsp");
					//break;
				}// if
				//Add to Session Scope
				session.setAttribute("Sname", Sname);
				session.setAttribute("SID", SID);
				session.setAttribute("Spass", Spass);
				session.setAttribute("Semail", Semail);
				session.setAttribute("Degree", Degree);
				session.setAttribute("Saddress", Saddress);
				session.setAttribute("Phone", Phone);
				if (SID.equals(Registration) && Spass.equals(SPassword)){
					System.out.println(Sname+" Logged in ");
					session.setAttribute("Registration", SID);
					session.setAttribute("Name", Sname);
					//RequestDispatcher rd  = getServletContext().getRequestDispatcher("/StudentForm.jsp");
					//rd.forward(request, response);
					response.sendRedirect("StudentForm.jsp");
				}//Second if
			}// while
		}// try
		
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// catch
		
		
		//
		
		
	}//doGet
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
