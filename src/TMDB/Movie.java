package TMDB;

import java.util.ArrayList;

import general.Entry;

public class Movie extends Entry {
	
	private ArrayList<String> genres;
	private String releaseDate;
	float rating;

	
	@SuppressWarnings("unchecked")
	public Movie(String name, String thumbnailPath, String description, 
			ArrayList<String> genres, String releaseDate ,float rating, String id) {
		super(name, thumbnailPath, description, id);
		this.genres = (ArrayList<String>)genres.clone();
		this.releaseDate = releaseDate;
		this.rating = rating;
	
	}
	
	public ArrayList<String> getGenres() {
		return this.genres;
	}
	
	public String getReleaseDate() {
		return this.releaseDate;
	}
	
	public float getRating() {
		return this.rating;
	}
	

}
