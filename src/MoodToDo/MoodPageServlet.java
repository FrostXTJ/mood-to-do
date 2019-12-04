package MoodToDo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TMDB.SongQuery;
import TMDB.TMDBQuery;
import general.Entry;
import general.Query;

/**
 * Servlet implementation class MoodPageServlet
 */
@WebServlet("/MoodPageServlet")
public class MoodPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoodPageServlet() {
        super();
        System.out.println("MoodPage Servlet in action.");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("MoodPage Servlet in action.");
		String moodKeyword = request.getParameter("mood-btn");
		String type = request.getParameter("type");
		
		// ADD USER INFO HERE
		System.out.println("Mood " + moodKeyword + " was selected by user .");
		// CONCURRENT BROADCASTING
		ArrayList<Entry> results = null;
		if(type.equals("music")) {
			SongQuery songQuery = new SongQuery(moodKeyword);
			results = songQuery.execute();
		}else {
			Query tmdbQuery = new TMDBQuery(moodKeyword);
			results = tmdbQuery.execute(); 
		}
		
		request.setAttribute("movies", results);
		request.setAttribute("mood", moodKeyword);
		request.setAttribute("type", type);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/resultPage.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
