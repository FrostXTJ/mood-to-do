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
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import general.Entry;
import general.Query;

public class TMDBQuery implements Query {

	private static final String DATABASE_CREDENTIAL_STRING = "jdbc:mysql://google/MoodToDo?cloudSqlInstance=usc-cs201-lab7:us-central1:my-sql&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=admin&password=000000";
	
	private String moodKeyword;

	public TMDBQuery(String moodKeyword) {
		this.moodKeyword = moodKeyword;
	}

	public ArrayList<Entry> execute() {

		String genreIds = "";
		ArrayList<Entry> queryResults = new ArrayList<Entry>();

		try {
			// Get SQL database connection
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultset = null;

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DATABASE_CREDENTIAL_STRING);
			while (connection == null) {
				connection = DriverManager.getConnection(DATABASE_CREDENTIAL_STRING);
				System.out.println("Failed to connect to the database. " + "Re-establishing connection.");
			}
			System.out.println("Connection established.");

			// Get the TMDB genreIds from the database.
			String sqlQuery = "SELECT * FROM TMDBMapping WHERE moodName = ?;";
			preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, this.moodKeyword);
			resultset = preparedStatement.executeQuery();

			if (!resultset.next()) {
				System.out.println("Unable to retain correct result set.");
				return null;
			}

			genreIds = resultset.getString("genreIds");

			if (resultset != null) {
				resultset.close();
			}

			if (preparedStatement != null) {
				preparedStatement.close();
			}

			if (connection != null) {
				connection.close();
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
			
			String apiStart = "https://api.themoviedb.org/3/discover/movie";
			String apiKey = "?api_key=42aee1dd4cd43a1c4d80991d57ec04db";
			String apiGenres = "&with_genres=" + genreIds;
			String apiSort = "&sort_by=popularity.desc";

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

			
			
			// Parse API's results
			for (int i = 0; i < 6; i++) {
				JsonObject result = resultJsonArray.get(i).getAsJsonObject();
				
				String movieTitle = result.get("title").getAsString();
				String posterPath = "https://image.tmdb.org/t/p/original" 
						+ result.get("poster_path").getAsString();
				String description = result.get("overview").getAsString().replace("\"", " ").replace("\'", " ");
				ArrayList<String> genres = new ArrayList<String>();
				for (JsonElement element : result.getAsJsonArray("genre_ids")) {
					genres.add(GenreIdMapping.getGenre(element.getAsInt()));
				}
				String releaseDate = result.get("release_date").getAsString();
				float rating = result.get("vote_average").getAsFloat();
				
				System.out.println(movieTitle);
				queryResults.add(new Movie(movieTitle, posterPath, description, genres, releaseDate, rating));
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
