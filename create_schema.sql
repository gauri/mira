CREATE TABLE links(
   id INT PRIMARY KEY     NOT NULL,
   title          TEXT    NOT NULL,
   description    TEXT    NOT NULL,
   photo          CHAR(64)
);

CREATE TABLE topics(
   id INT PRIMARY KEY     NOT NULL,
   author_id INTEGER REFERENCES user(id) ON UPDATE CASCADE,
   title          TEXT    NOT NULL,
   description    TEXT    NOT NULL
);

CREATE TABLE users(
	id INT PRIMARY_KEY 	NOT NULL,
	name CHAR(64)	    NOT NULL,
	email CHAR(64) 		NOT NULL
);