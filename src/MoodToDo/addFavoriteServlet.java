package MoodToDo;
import general.User;
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

import TMDB.FavoriteQuery;
import TMDB.TMDBQuery;
import general.Entry;
import general.Query;

/**
 * Servlet implementation class favoritePageServlet
 */
@WebServlet("/addFavoriteServlet")
public class addFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addFavoriteServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("MoodPage Servlet in action.");
		String user = request.getParameter("user");
		String type = request.getParameter("type");
		String link = request.getParameter("link");
		//ArrayList<Entry> movies = (ArrayList<Entry>)request.getAttribute("movies");
		System.out.print("user:" + user);
		int typeID = 0;
		String webpage = "/index.jsp";
		
		//get typeID
		if(type == null || type == "") {
		    webpage = "/index.jsp";
		}else {
			if(type.equals("movies")) {
				typeID = 1;
			}else if(type.equals("restaurants")) {
				typeID =2;
			}
			else if(type.equals("music")){
				typeID = 3;
			}else {
				webpage = "/thankYouPage.jsp";
			}
			
			if(user == null) {
				webpage = "/thankYouPage.jsp";
			}else {
				//here is where the real action comes
				//connect to database :)
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
					
					int userID = 0;
					if(results.next()) {
						userID = results.getInt("userID");
						System.out.println("user ID is " + userID);
					}else {
						System.out.println("no user");
					}

					//change these, we want the links from favorites where userID = user and typeId = type
					
					//String sqlQuery = "SELECT * FROM favorites WHERE userID = ? AND itemTypeID = ?;";
					System.out.println(type + " " + user);
					
					if(userID != 0) {
						sqlQuery = "INSERT INTO favorites (userID, itemTypeID, link) VALUES (" + Integer.toString(userID) + ", " + Integer.toString(typeID) + ", '" + link + "');";
						state = conn.prepareStatement(sqlQuery);
						
					
						state.executeUpdate(sqlQuery);
						
						System.out.println("Success!");
						webpage = "/thankYouPage.jsp";
					}
					
			
					if (results != null) {
						results.close();
					}

					if (state != null) {
						state.close();
					}

					if (conn != null) {
						conn.close();
					}
					

				} catch (ClassNotFoundException cnfe) {
					System.out.println("cnfe in TMDBQuery: " + cnfe.getMessage());
				} catch (SQLException sqle) {
					System.out.println("sqle in TMDBQuery: " + sqle.getMessage());
				}
				
			}
		}
		//request.setAttribute("movies", movies);
		//request.setAttribute("user", user);
		//request.setAttribute("type", type);
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
