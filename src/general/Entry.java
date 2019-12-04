package general;

public abstract class Entry {
	
	private String name;
	private String thumbnailPath;
	private String description;
	private String id;
	
	public Entry(String name, String thumbnailPath, String description, String id) {
		this.name = name;
		this.thumbnailPath = thumbnailPath;
		this.description = description;
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getThumbnailPath() {
		return this.thumbnailPath;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public String getID() {
		return this.id;
	}

}
