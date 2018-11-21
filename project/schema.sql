DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS review;

CREATE TABLE user (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	username TEXT NOT NULL,
	password TEXT NOT NULL
);

CREATE TABLE location (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	postcode TEXT NOT NULL,
	lat REAL NOT NULL,
	lng REAL NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE review (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	location_id INTEGER NOT NULL,
	rating INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
	review TEXT DEFAULT '',
    FOREIGN KEY (user_id) REFERENCES user (id),
	FOREIGN KEY (location_id) REFERENCES location (id)
);
