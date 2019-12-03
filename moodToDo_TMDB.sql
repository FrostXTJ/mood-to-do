DROP DATABASE IF EXISTS MoodToDo;
CREATE DATABASE MoodToDo;

USE MoodToDo;

CREATE TABLE TMDBMapping (
	moodId INTEGER(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    moodName VARCHAR(20) NOT NULL,
    genreIds VARCHAR(50) NOT NULL,
    genreNames VARCHAR(100) NOT NULL
);

# Mood cheerful
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('cheerful', '12|16', 
    'adventure|animation');

# Mood excited
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('excited', '28|27|37|53', 
    'action|horror|western|thriller');
    
# Mood romantic
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('romantic', '10749', 
    'romance');

# Mood tense
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('tense', '10751|10402|10749', 
    'family|music|romance');
    
# Mood anxious
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('anxious', '36|10402|37', 
    'history|music|western');

# Mood angry
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('angry', '28|10752', 
    'action|war');
    
# Mood lonely
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('lonely', '10749|10751', 
    'romance|family');
    
SELECT * FROM TMDBMapping;
