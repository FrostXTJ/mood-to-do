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

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import general.Entry;
//import general.Query;

public class FavoriteQuery{

	
	private int type;
	private int user;

	public FavoriteQuery(int type, int user) {
		this.type = type;
		this.user = user;
	}

	public ArrayList<Entry> execute() {

		ArrayList<String> links = new ArrayList<String>();
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

			//change these, we want the links from favorites where userID = user and typeId = type
			
			//String sqlQuery = "SELECT * FROM favorites WHERE userID = ? AND itemTypeID = ?;";
			System.out.println(type + " " + user);
			String sqlQuery = "SELECT * FROM favorites WHERE userID = " + Integer.toString(user) + " AND itemTypeID = " + Integer.toString(type) + ";";
			state = conn.prepareStatement(sqlQuery);
			
		
			
			results = state.executeQuery();
			
			while (results.next()) {
				links.add(results.getString("link"));
				System.out.println("hey");
			}
			System.out.println(links.size());
			
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
		if(type == 1) { //movie
			try {
				String apiStart = "https://api.themoviedb.org/3/movie/";
				String apiKey = "?api_key=42aee1dd4cd43a1c4d80991d57ec04db";
				for(int i = 0; i < links.size(); i++) {
					
					URL apiUrl = null;
					HttpURLConnection connection = null;
					String resultString = "";
					apiUrl = new URL(apiStart + links.get(i)+ apiKey);
					System.out.println(links.get(i));
					System.out.println(apiUrl);
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
					if(resultJsonArray != null && resultJsonArray.size() > 0) {
						
						for (int j = 0; j < 1; j++) {
							JsonObject result = resultJsonArray.get(i).getAsJsonObject();
							
							String movieTitle = result.get("title").getAsString();
							String posterPath = "https://image.tmdb.org/t/p/original" 
									+ result.get("poster_path").getAsString();
							String description = result.get("overview").getAsString();
							ArrayList<String> genres = new ArrayList<String>();
							for (JsonElement element : result.getAsJsonArray("genre_ids")) {
								genres.add(GenreIdMapping.getGenre(element.getAsInt()));
							}
							String releaseDate = result.get("release_date").getAsString();
							float rating = result.get("vote_average").getAsFloat();
							String id = result.get("id").getAsString();
							System.out.println(movieTitle);
							queryResults.add(new Movie(movieTitle, posterPath, description, genres, releaseDate, rating, id));
						}
					}
					
					br.close();
				}
				} catch (MalformedURLException mue) {
					System.out.println("mue in TMDBQuery: " + mue.getMessage());
				} catch (IOException ioe) {
					System.out.println("ioe in TMDBQuery: " + ioe.getMessage());
				}
			}else if(type == 3) { //songs
				//trackID needed
				try {
					//String apiStart = "https://itunes.apple.com/lookup?trackId=";
					for(int i = 0; i < links.size(); i++) {
						//String apiID = links.get(i);
						String apiID = links.get(i);
						URL apiUrl = null;
						HttpURLConnection connection = null;
						String resultString = "";
						apiUrl = new URL("https://itunes.apple.com/lookup?id=" + apiID);
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
						if(resultJsonArray.size() >0) {
							for (int j = 0; j < 1; j++) {
								JsonObject result = resultJsonArray.get(j).getAsJsonObject();
								
								String movieTitle = result.get("trackName").getAsString();
								String posterPath = result.get("artworkUrl100").getAsString();
								String description = result.get("artistName").getAsString();
								ArrayList<String> genres = new ArrayList<String>();
								genres.add(result.get("primaryGenreName").getAsString());
								String releaseDate = result.get("collectionName").getAsString();
								float rating = 0;
								String id = result.get("trackId").getAsString();
								System.out.println(movieTitle);
								queryResults.add(new Movie(movieTitle, posterPath, description, genres, releaseDate, rating, id));
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
			}

		return queryResults;

	}

}
