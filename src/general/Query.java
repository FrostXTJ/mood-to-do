package general;

import java.util.ArrayList;

public interface Query {

	/**
	 * Generate an array list of entries according to the query. 
	 * @return ArrayList<Entry>
	 */
	public ArrayList<Entry> execute();
	
}
