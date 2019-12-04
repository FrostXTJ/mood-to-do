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
 * Servlet implementation class login
 */
@WebServlet("/SuedoLoginServlet")
public class SuedoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//needs to instead match something from the database
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuedoLoginServlet() {
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
		String username = request.getParameter("username-input");
		String password = request.getParameter("password-input");
		
		boolean found = false;
		//sql to find username
		found = findUsername(username);
		if(!found) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginPage.jsp");
			request.setAttribute("err-msg", "Please fill out all fields");
			dispatcher.include(request, response);
		}else {
		
		boolean success = success(username, password);

		//check if password matches the username, if not, put that error in response
		
		if(success) {
			HttpSession session = request.getSession();
			session.setAttribute("user", username);
			session.setMaxInactiveInterval(60*60);
			Cookie myUser = new Cookie("user", username);
			myUser.setMaxAge(60*60);
			response.addCookie(myUser);
			response.sendRedirect("index.jsp");
			
		}else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginPage.jsp");
			request.setAttribute("err-msg", "Please fill out all fields");
			dispatcher.include(request, response);
		}
		}
		
	}
	
	private boolean findUsername(String user) {
		Connection conn = null;
		Statement state = null;
		ResultSet results = null;
		System.out.println("user: " + user);
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			while(conn == null) {
				conn = DriverManager.getConnection("jdbc:mysql://google/MoodToDo?cloudSqlInstance=moodtodo:us-central1:mood-db&socke" + 
					"tFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root");
				System.out.println("Failed to connect to the database. " + "Re-establishing connection.");
			}
			System.out.println("Connection established.");
			
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
	
	private boolean success(String username, String password) {
		Connection conn = null;
		Statement state = null;
		ResultSet results = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://google/MoodToDo?cloudSqlInstance=moodtodo:us-central1:mood-db&socke" + 
					"tFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root");
			
			state = conn.createStatement();
			results = state.executeQuery("SELECT * FROM users where username = '"+username+"' AND password= '" + password +"'");
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

}


