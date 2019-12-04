package Yelp;

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
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import general.Query;
import general.Entry;

public class YelpQuery implements Query {
	
	private static final String DATABASE_CREDENTIAL_STRING = "jdbc:mysql://google/MoodToDo?cloudSqlInstance=moodtodo:us-central1:mood-db&socke" + 
									"tFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=root&password=root";
	private static String API_KEY = "1JDOwe3YmGp9Zgq8XuXcBcgrL247K_UKeMMclhBv13Jwc1oF0_m5ZzN-vSzQS09-cEXlnANMKX2FTrMs-QvBtLXJlvY-Vdr2PoJvO7teWMIoXXq_p-vYmQYX4FvTXXYx";
	
	private String moodKeyword;
	private String latitude;
	private String longitude;

	public YelpQuery(String moodKeyword, String lat, String lon) {
		this.moodKeyword = moodKeyword;
		this.latitude = lat;
		this.longitude = lon;
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

			// Get the Yelp categories from the database.
			String sqlQuery = "SELECT * FROM moods WHERE name = ?;";
			preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, this.moodKeyword);
			resultset = preparedStatement.executeQuery();

			if (!resultset.isBeforeFirst()) {
				System.out.println("Unable to retain correct result set.");
				return null;
			}
			
			resultset.next();

			int genreId = resultset.getInt("moodID");
			
			preparedStatement = connection.prepareStatement("SELECT * FROM MoodToFood WHERE moodID=?");
			preparedStatement.setInt(1, genreId);
			
			if(!resultset.isBeforeFirst()) {
				System.out.println("Failed to get categories from mood database");
				return null;
			}
			
			
			
			while(resultset.next()) {
				genreIds += resultset.getString("category") + ",";
			}
			
			genreIds = genreIds.substring(0, genreIds.length()-1);

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
		
		
		/*
		 * Mood mappings
		 * cheerful 
		 * 
		 * 
		 * excited 
		 * 
		 * 
		 * romantic 
		 * 
		 * tense 
		 * 
		 * anxious 
		 * 
		 * angry 
		 * 
		 * lonely
		 */

		try {
			// Get movie information from TMDB
			URL apiUrl = null;
			HttpURLConnection connection = null;
			String resultString = "";
			
			String apiStart = "https://api.yelp.com/v3/businesses/search";
			String apiGenres = "&categories=" + genreIds;
//			String apiSort = "&sort_by=popularity.desc";
			String latitude = "?latitude=" + this.latitude;
			String longitude = "&longitude=" + this.longitude;
			String openNow = "&open_now=true";

			System.out.println(apiStart + apiGenres + latitude + longitude + openNow);
						
			// GET URL result
			apiUrl = new URL(apiStart + latitude + longitude + apiGenres + openNow);
			connection = (HttpURLConnection)apiUrl.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Authorization", "Bearer " + YelpQuery.API_KEY);
			
			
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			
			while ((line = br.readLine()) != null) {
				resultString += line;
			}
			
			@SuppressWarnings("deprecation")
			JsonParser jsonParser = new JsonParser();
			@SuppressWarnings("deprecation")
			JsonArray resultJsonArray = jsonParser.parse(resultString).getAsJsonObject().getAsJsonArray("businesses");

			
			
			// Parse API's results
			for (int i = 0; i < 6; i++) {
				JsonObject result = resultJsonArray.get(i).getAsJsonObject();
				System.out.println(result.toString());
				String restName = result.get("name").getAsString();
//				String posterPath = "https://image.tmdb.org/t/p/original" 
//						+ result.get("poster_path").getAsString();
				String imageLink = result.get("image_url").getAsString();
				String description = result.get("url").getAsString();
				String price = result.get("price").getAsString();
				List<String> categories = new ArrayList<String>();
				JsonArray jsonCat = result.getAsJsonArray("categories");
				System.out.println(jsonCat.toString());
				for(int j=0; j<jsonCat.size(); j++) {
					JsonObject category = jsonCat.get(j).getAsJsonObject();
					categories.add(category.get("title").getAsString());
				}
				float rating = result.get("rating").getAsFloat();
				String id = result.get("id").getAsString();
				System.out.println(restName);
				queryResults.add(new Restaurant(restName, imageLink, description, categories, rating, price, id));
			}
			
			br.close();
		
			
		} catch (MalformedURLException mue) {
			System.out.println("mue in YelpQuery: " + mue.getMessage());
		} catch (IOException ioe) {
			System.out.println("ioe in YelpQuery: " + ioe.getMessage());
		}

		return queryResults;

	}
}
