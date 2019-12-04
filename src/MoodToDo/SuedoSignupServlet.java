package MoodToDo;

import java.io.IOException;
import java.sql.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/SuedoSignupServlet")
public class SuedoSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuedoSignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//call login last
		//check if username taken, if not, check if passwords match
		String username = request.getParameter("username-input");
		String password = request.getParameter("password-input-1");
		String confirm = request.getParameter("password-input-2");
		if(username == null || username == "" || password == null || password == "" || confirm == null || confirm == "") {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterPage.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>Please fill out all fields.</font>");
			dispatcher.include(request, response);
		}
		else {
		boolean taken = findUsername(username);
		if(taken) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterPage.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>Username is taken.</font>");
			dispatcher.include(request, response);
		}
		else {
			if(username !=null && username != "" && password != null && confirm != null && password != "" && password.equals(confirm)) {
				//add to database and call the login servlet stuff
				addDatabase(username, password);
				//Successfully created new account
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				session.setMaxInactiveInterval(60*60);
				Cookie myUser = new Cookie("user", username);
				myUser.setMaxAge(60*60);
				response.addCookie(myUser);
				response.sendRedirect("index.jsp");
				
				
			}else {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterPage.jsp");
				PrintWriter out= response.getWriter();
				out.println("<font color=red>Passwords need to match.</font>");
				dispatcher.include(request, response);
			}
		}
		}
		
	}
	
	private boolean findUsername(String user) {
		Connection conn = null;
		Statement state = null;
		ResultSet results = null;
		System.out.println("username: " + user);
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/MoodToDo?cloudSqlInstance=moodtodo:us-central1:mood-db&socke" + 
					"tFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root");
			
			state = conn.createStatement();
			results = state.executeQuery("SELECT * FROM users where username = '"+user+"'");
			if(results.next()) {
				System.out.println("true");
				return true;
			}
			else {
				System.out.println("false");
				return false;
			}
	
		}
	catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
	
	}finally {
		try {
			if(results != null) {
				results.close();
			}
			if(state != null) {
				//state.close();
			}
			if(conn != null) {
				//conn.close();
			}
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
	}
	
		return false;
	}
	
	private void addDatabase(String user, String password) {
		Connection conn = null;
		Statement state = null;
		ResultSet results = null;
		System.out.println("adding to database");
		System.out.println("user: " + user);
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/MoodToDo?cloudSqlInstance=moodtodo:us-central1:mood-db&socke" + 
					"tFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root");
			
			state = conn.createStatement();
			state.executeUpdate("INSERT INTO users (username, password)"
					+ "VALUES ('" + user +"', '" + password +"')");
		}
	catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
	
	}finally {
		try {
			if(results != null) {
				results.close();
			}
			if(state != null) {
				//state.close();
			}
			if(conn != null) {
				//conn.close();
			}
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
	}
	}

}