package general;

public abstract class Entry {
	
	private String name;
	private String thumbnailPath;
	private String description;
	
	public Entry(String name, String thumbnailPath, String description) {
		this.name = name;
		this.thumbnailPath = thumbnailPath;
		this.description = description;
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

}
