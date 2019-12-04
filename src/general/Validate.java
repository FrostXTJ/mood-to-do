package general;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/Validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String notification = request.getParameter("notification");
		String showRFilms = request.getParameter("showRFilms");
		String showExSongs = request.getParameter("showExSongs");
		String excludeAction = request.getParameter("excludeAction");
		String excludeAdventure = request.getParameter("excludeAdventure");
		String excludeAnimation = request.getParameter("excludeAnimation");
		String excludeComedy = request.getParameter("excludeComedy");
		String excludeCrime = request.getParameter("excludeCrime");
		String excludeDocumentary = request.getParameter("excludeDocumentary");
		String excludeDrama = request.getParameter("excludeDrama");
		String excludeFamily = request.getParameter("excludeFamily");
		String excludeFantasy = request.getParameter("excludeFantasy");
		String excludeHistory = request.getParameter("excludeHistory");
		String excludeHorror = request.getParameter("excludeHorror");
		String excludeMystery = request.getParameter("excludeMystery");
		String excludeRomance = request.getParameter("excludeRomance");
		String excludeScienceFiction = request.getParameter("excludeScienceFiction");
		String excludeTVMovie = request.getParameter("excludeTVMovie");
		String excludeThriller = request.getParameter("excludeThriller");
		String excludeWar = request.getParameter("excludeWar");
		String excludeWestern = request.getParameter("excludeWestern");
		String excludeBlues = request.getParameter("excludeBlues");
		String excludeSoComedy = request.getParameter("excludeSoComedy");
		String excludeClassic = request.getParameter("excludeClassic");
		String excludeCountry = request.getParameter("excludeCountry");
		String excludeElectronic = request.getParameter("excludeElectronic");
		String excludeHoliday = request.getParameter("excludeHoliday");
		String excludeJazz = request.getParameter("excludeJazz");
		String excludePop = request.getParameter("excludePop");
		String excludeRB_Soul = request.getParameter("excludeR&B/Soul");
		String excludeDance = request.getParameter("excludeDance");
		String excludeHipHop_Rap = request.getParameter("excludeHip-Hop/Rap");
		String excludeAlternative = request.getParameter("excludeAlternative");
		String excludeRock = request.getParameter("excludeRock");
		String excludeReggae = request.getParameter("excludeReggae");
		String excludeInstrumental = request.getParameter("excludeInstrumental");
		String excludeKaraoke = request.getParameter("excludeKaraoke");
		Boolean correct = true;
		String preferenceString = "";
		if(notification == null || notification.isEmpty()) {
			correct = false;
		}
		if(showRFilms == null || showRFilms.isEmpty()) {
			correct = false;
		}		
		if(showExSongs == null || showExSongs.isEmpty()) {
			correct = false;
		}
		if(correct == false)
		{
			out.println("Please select at least one button of the yes/no buttons.");
		}
		if(notification.equals("Yes")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(showRFilms.equals("Yes")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(showExSongs.equals("Yes")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeAction.equals("Action")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeAdventure.equals("Adventure")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeAnimation.equals("Animation")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeComedy.equals("Comedy")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeCrime.equals("Crime")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeDocumentary.equals("Documentary")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeDrama.equals("Drama")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeFamily.equals("Family")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeFantasy.equals("Fantasy")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeHistory.equals("History")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeHorror.equals("Horror")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeMystery.equals("Mystery")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeRomance.equals("Romance")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeScienceFiction.equals("Science Fiction")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeTVMovie.equals("TV Movie")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeThriller.equals("Thriller")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeWar.equals("War")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeWestern.equals("Western")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeBlues.equals("Blues")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeSoComedy.equals("Comedy")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeClassic.equals("Classic")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeCountry.equals("Country")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeElectronic.equals("Electronic")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeHoliday.equals("Holiday")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeJazz.equals("Jazz")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludePop.equals("Pop")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeRB_Soul.equals("R&B/Soul")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeDance.equals("Dance")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeHipHop_Rap.equals("Hip-Hop/Rap")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeAlternative.equals("Alternative")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeRock.equals("Rock")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeReggae.equals("Reggae")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeInstrumental.equals("Instrumental")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		if(excludeKaraoke.equals("Karaoke")) {
			preferenceString += "1";
		}
		else {
			preferenceString += "0";
		}
		out.flush();
		out.close();
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
			PreparedStatement ps = null;
			String insertQuery = "UPDATE preferences SET preference= '" + preferenceString + "'WHERE userID='" +userID+ "';";
			ps = conn.prepareStatement(insertQuery);
			ps.executeUpdate(insertQuery);
			
		}catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe in TMDBQuery: " + cnfe.getMessage());
		} catch (SQLException sqle) {
			System.out.println("sqle in TMDBQuery: " + sqle.getMessage());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
