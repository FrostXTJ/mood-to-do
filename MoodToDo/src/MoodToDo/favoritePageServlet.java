package MoodToDo;

import java.io.IOException;
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
			
			
				FavoriteQuery favQuery = new FavoriteQuery(typeID, 1);
				
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
