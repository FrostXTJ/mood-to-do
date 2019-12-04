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
	VALUES ('cheerful', '28|12|16|35|18|14|878', 
    'action|adventure|animation|comedy|drama|fantasy|science fiction');

# Mood excited
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('excited', '28|27|9648|37|53', 
    'action|horror|mystery|western|thriller');
    
# Mood romantic
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('romantic', '16|14|10749', 
    'animation|fantasy|romance');

# Mood tense
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('tense', '18|10751|10402|10749', 
    'drama|family|music|romance');
    
# Mood anxious
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('anxious', '12|36|1040210749|37', 
    'adventure|history|music|romance|western');

# Mood angry
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('angry', '28|27|10752', 
    'action|horror|war');
    
# Mood lonely
INSERT INTO TMDBMapping (moodName, genreIds, genreNames) 
	VALUES ('lonely', '16|18|10751|14|36|878', 
    'animation|drama|family|fantasy|history|science fiction');
    
SELECT * FROM TMDBMapping;
