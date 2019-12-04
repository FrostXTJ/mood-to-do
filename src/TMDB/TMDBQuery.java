package TMDB;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import general.Entry;
import general.Query;

public class TMDBQuery implements Query {

	
	private String moodKeyword;

	public TMDBQuery(String moodKeyword) {
		this.moodKeyword = moodKeyword;
	}

	public ArrayList<Entry> execute() {

		String genreIds = "";
		ArrayList<Entry> queryResults = new ArrayList<Entry>();

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

			// Get the TMDB genreIds from the database.
	
			// Get the TMDB genreIds from the database.
			
			String sqlQuery = "SELECT * FROM TMDBMapping WHERE moodName = ?;";
			state = conn.prepareStatement(sqlQuery);
			state.setString(1, this.moodKeyword);
			results = state.executeQuery();

			if (!results.next()) {
				System.out.println("Unable to retain correct result set.");
				return null;
			}

			genreIds = results.getString("genreIds");
			
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

		try {
			// Get movie information from TMDB
			URL apiUrl = null;
			HttpURLConnection connection = null;
			String resultString = "";
			Random rand = new Random();
			int sort = rand.nextInt(4);
			String apiStart = "https://api.themoviedb.org/3/discover/movie";
			String apiKey = "?api_key=42aee1dd4cd43a1c4d80991d57ec04db";
			String apiGenres = "&with_genres=" + genreIds;
			String apiSort = "&sort_by=popularity.desc";
			if(sort == 0) {
				apiSort = "&sort_by=release_date.desc";
			}else if(sort == 1) {
				apiSort = "&sort_by=vote_count.desc";
			}else if(sort == 2) {
				apiSort= "&sort_by=vote_average.desc";
			}
			

			System.out.println(apiStart + apiKey + apiGenres + apiSort);
			
			// GET URL result
			apiUrl = new URL(apiStart + apiKey + apiGenres + apiSort);
			connection = (HttpURLConnection)apiUrl.openConnection();
			connection.setRequestMethod("GET");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			
			while ((line = br.readLine()) != null) {
				resultString += line;
			}
			
			@SuppressWarnings("deprecation")
			JsonParser jsonParser = new JsonParser();
			@SuppressWarnings("deprecation")
			JsonArray resultJsonArray = jsonParser.parse(resultString).getAsJsonObject().getAsJsonArray("results");

			
		
			int k = 1;
			
			// Parse API's results
			
			System.out.println("SIZE " + resultJsonArray.size());
			if(resultJsonArray.size() > 19) {
				k = rand.nextInt(3) + 1;
				
			}
			for (int i = 0; i < 6; i++) {
				
				int temp = i * k;
				try {
				JsonObject result = resultJsonArray.get(temp).getAsJsonObject();
				System.out.println(result.get("id"));
				String id = result.get("id").getAsString();
				String movieTitle = "Not Available.";
				if(result.get("title") != null) {
					movieTitle = result.get("title").getAsString();
				}
				String posterPath = ""; //put not available image here :)
				if(result.has("poster_path") && result.get("poster_path") != null) {
					System.out.println("why?");
					posterPath = "https://image.tmdb.org/t/p/original" 
							+ result.get("poster_path").getAsString();
				}
				String description = "No description available but hopefully it fits your mood!";
				if(result.get("overview") != null) {
					description = result.get("overview").getAsString();
				}
				ArrayList<String> genres = new ArrayList<String>();
				for (JsonElement element : result.getAsJsonArray("genre_ids")) {
					genres.add(GenreIdMapping.getGenre(element.getAsInt()));
				}
				String releaseDate ="Not available.";
				if(result.get("release_date") != null) {
					releaseDate = result.get("release_date").getAsString();
				}
				float rating = 0;
				if(result.get("vote_average") != null) {
					rating = result.get("vote_average").getAsFloat();
				}
				
				
				System.out.println(movieTitle);
				
				queryResults.add(new Movie(movieTitle, posterPath, description, genres, releaseDate, rating, id));
				}catch(Exception e){
					System.out.println("Exception so skipping this movie :)");
				}
			}
			
			br.close();
		
			
		} catch (MalformedURLException mue) {
			System.out.println("mue in TMDBQuery: " + mue.getMessage());
		} catch (IOException ioe) {
			System.out.println("ioe in TMDBQuery: " + ioe.getMessage());
		}

		return queryResults;

	}

}
