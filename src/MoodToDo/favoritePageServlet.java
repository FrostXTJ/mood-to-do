package MoodToDo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import TMDB.FavoriteQuery;
import TMDB.TMDBQuery;
import general.Entry;
import general.Query;

/**
 * Servlet implementation class favoritePageServlet
 */
@WebServlet("/favoritePageServlet")
public class favoritePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public favoritePageServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("MoodPage Servlet in action.");
		HttpSession session = request.getSession();
		String user = session.getAttribute("user").toString();
		/*
		 * 
		 * Find userID now :)
		 */
		int userID = 0;
		try {
			// Get SQL database connection
			// Get SQL database connection
			Connection conn = null;
			PreparedStatement state = null;
			ResultSet results = null;

			Class.forName("com.mysql.jdbc.Driver");
			while (conn == null) {
				
				conn = DriverManager.getConnection("jdbc:mysql://google/MoodToDo?cloudSqlInstance=moodtodo:us-central1:mood-db&socke" + 
						"tFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root");
				System.out.println("Failed to connect to the database. " + "Re-establishing connection.");
			}
			System.out.println("Connection established.");
			
			String sqlQuery = "SELECT * FROM users where username = '"+user+"';";
			
			state = conn.prepareStatement(sqlQuery);
			results = state.executeQuery();

			if(results.next()) {
				userID = results.getInt("userID");
				System.out.println("user ID is " + userID);
			}else {
				System.out.println("no user");
			}
		}catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe in TMDBQuery: " + cnfe.getMessage());
		} catch (SQLException sqle) {
			System.out.println("sqle in TMDBQuery: " + sqle.getMessage());
		}
		
		String type = request.getParameter("type");
		System.out.println(type);
		int typeID = 0;
		String webpage = "/favoritePage.jsp";
		
		if(type == null || type == "") {
			webpage = "/Favorites.jsp";
		}else {
			if(type.equals("movies")) {
				typeID = 1;
			}else if(type.equals("restaurants")) {
				typeID =2;
			}
			else if(type.equals("music")){
				typeID = 3;
			}else {
				webpage = "/Favorites.jsp";
			}
			
			
				FavoriteQuery favQuery = new FavoriteQuery(typeID, userID);
				
				ArrayList<Entry> favorites = favQuery.execute(); 
				request.setAttribute("favs", favorites);
				request.setAttribute("type", typeID);
			
			
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(webpage);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
