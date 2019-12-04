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

public class SongQuery implements Query {

	
	private String moodKeyword;

	public SongQuery(String moodKeyword) {
		this.moodKeyword = moodKeyword;
	}

	public ArrayList<Entry> execute() {

		ArrayList<String> genreIds = new ArrayList<String>();
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
			
			/*
			 * 
			 * CHANGE THIS !!!!
			 * 
			 * 
			 */
			int moodID = 0;
			String sqlQuery = "SELECT * FROM moods WHERE name = '" +moodKeyword + "';";
			state = conn.prepareStatement(sqlQuery);
			results = state.executeQuery();
			if (!results.next()) {
				System.out.println("Unable to retain correct result set.");
				return null;
			}else {
				moodID = results.getInt("moodID");
			}
			
			System.out.println(moodID);
			sqlQuery = "SELECT * FROM musicMappings WHERE moodID = ?;";
			state = conn.prepareStatement(sqlQuery);
			state.setInt(1, moodID);
			results = state.executeQuery();

			while(results.next()) {
				genreIds.add(Integer.toString(results.getInt("genreID")));
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

		try {
			try {
				//String apiStart = "https://itunes.apple.com/lookup?trackId=";
				for(int i = 0; i < genreIds.size(); i++) { //for each genre
					//String apiID = links.get(i);
					String apiID = genreIds.get(i);
					URL apiUrl = null;
					HttpURLConnection connection = null;
					String resultString = "";
					Random random = new Random();
					String alphabet = "aabccdefghiijkkllmmnnoopqrrssttuvwxyz";
					char char1 = alphabet.charAt(random.nextInt(alphabet.length()));
					char char2 = alphabet.charAt(random.nextInt(alphabet.length()));
					
					apiUrl = new URL("https://itunes.apple.com/search?term=" + char1 + "+" + char2 +"&entity=song&genreIndex=" + apiID + "&limit=100");
					connection = (HttpURLConnection)apiUrl.openConnection();
					connection.setRequestMethod("GET");
					System.out.println(apiUrl);
					BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
					
					
					String line;
					while ((line = br.readLine()) != null) {
						resultString += line;
					}
					@SuppressWarnings("deprecation")
					JsonParser jsonParser = new JsonParser();
					@SuppressWarnings("deprecation")
					JsonArray resultJsonArray = jsonParser.parse(resultString).getAsJsonObject().getAsJsonArray("results");
					//System.out.println(resultJsonArray);
					// Parse API's results
					Random rand = new Random();
					if(resultJsonArray != null && resultJsonArray.size() >1) {
						
						for(int k = 0; k < 2; k++) {
							int j = rand.nextInt(resultJsonArray.size());
							if(k == 0) {
								if(j%2 == 0 && j>0) {
									j = j-1;
								}
							}else {
								if(j%2 == 1) {
									j = j-1;
								}
							}
							
							
								
							JsonObject result = resultJsonArray.get(j).getAsJsonObject();
							String movieTitle = "";
							if(result.get("trackName") != null) {
								movieTitle = result.get("trackName").getAsString();
							}
							String posterPath = "";
							if(result.get("artworkUrl100") != null) {
								posterPath = result.get("artworkUrl100").getAsString();
							}
							String description = "";
							if(result.get("artistName") != null) {
								description = result.get("artistName").getAsString();
							}
							
							ArrayList<String> genres = new ArrayList<String>();
							if(result.get("primaryGenreName") != null) {
								genres.add(result.get("primaryGenreName").getAsString());
							}
							String releaseDate = "";
							if(result.get("collectionName") != null) {
								releaseDate = result.get("collectionName").getAsString();
							}
							float rating = 0;
								
							System.out.println(movieTitle);
							queryResults.add(new Movie(movieTitle, posterPath, description, genres, releaseDate, rating));
						}
						
					}else {
						System.out.println("failed");
					}
					
					
					br.close();
				}
				} catch (MalformedURLException mue) {
					System.out.println("mue in TMDBQuery: " + mue.getMessage());
				} catch (IOException ioe) {
					System.out.println("ioe in TMDBQuery: " + ioe.getMessage());
				}
			}finally {
				
			}
			return queryResults;
		}
}