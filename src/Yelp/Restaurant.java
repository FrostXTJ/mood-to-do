package Yelp;

import java.util.ArrayList;
import java.util.List;

import general.Entry;

public class Restaurant extends Entry {
	
	private List<String> categories;
	private String price;
	private float rating;
	private String id;
	private String yelpLink;
	
	public Restaurant(String name, String image, String yelpLink, List<String> categories, float rating, String price, String id) {
		super(name, image, yelpLink);
		this.rating = rating;
		this.categories = categories;
		this.id = id;
		this.yelpLink = yelpLink;
		this.price = price;
	}
	
	public String getID() {
		return this.id;
	}
	
	public String getPrice() {
		return this.price;
	}
	
	public float getRating() {
		return this.rating;
	}
	
	public String getDescription() {
		String desc = "";
		for (String category : categories) {
			desc += category + ", ";  
		}
		desc = desc.substring(0, desc.length() - 2);
		desc += "<br>";
		desc += "Price: " + price;
		desc += "<br>";
		desc += "Rating: " + rating;
		return desc;
	}
	
	public String getLink() {
		return this.yelpLink;
	}
	
	public List<String> getCategories() {
		return this.categories;
	}
}
