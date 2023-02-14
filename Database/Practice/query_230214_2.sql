-- Managing Data

-- Q1
CREATE TABLE users (
	userID INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    birthday DATE NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (userID)
);

SHOW COLUMNS FROM users;

-- Q2
INSERT INTO
	users (first_name, last_name, birthday, city, country, email)
VALUES
	('Beemo', 'Jeong', '1000-01-01', NULL, NULL, 'beemo@hphk.kr'),
	('Jieun', 'Lee', '1993-05-16', 'Seoul', 'Korea', NULL),
	('Dami', 'Kim', '1995-04-09', 'Seoul', 'Korea', NULL),
	('Kwangsoo', 'Lee', '1985-07-14', 'Seoul', 'Korea', NULL);

-- Q3
INSERT INTO
	users (first_name, last_name, birthday, city, country, email)
VALUES
	('A', 'A', '1111-01-01', NULL, NULL, NULL),
	('B', 'B', '1234-01-01', 'Seoul', 'Korea', NULL),
	('C', 'C', '1345-03-05', 'Seoul', 'Korea', NULL),
	('D', 'D', '1789-06-02', 'Seoul', 'Korea', NULL),
	('E', 'E', '1357-10-04', NULL, NULL, NULL);

-- Q4
UPDATE users
SET
	first_name = 'Haein',
    last_name = 'Jung',
    birthday = '1998-10-09'
WHERE userID = 2;

-- Q5
UPDATE users
SET
	country = 'Korea'
WHERE
	country IS NULL;

-- Q6
DELETE FROM users
WHERE
	first_name = 'Beemo';
    
-- Q7
DELETE FROM users
WHERE
	first_name = 'Kwangsoo'
    AND last_name = 'Lee';

-- Q8
DELETE FROM users
ORDER BY created_at DESC
LIMIT 1;
