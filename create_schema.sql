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

CREATE TABLE topics_links(
   topic_id INTEGER REFERENCES topics(id) ON UPDATE CASCADE,
   link_id INTEGER REFERENCES links(id) ON UPDATE CASCADE
);

CREATE TABLE tags(
	id INT PRIMARY_KEY 	NOT NULL,
	title CHAR(64)	    NOT NULL
);

CREATE TABLE topics_tags(
   topic_id INTEGER REFERENCES topics(id) ON UPDATE CASCADE,
   tag_id INTEGER REFERENCES tags(id) ON UPDATE CASCADE
);

CREATE TABLE users(
	id INT PRIMARY_KEY 	NOT NULL,
	name CHAR(64)	    NOT NULL,
	email CHAR(64) 		NOT NULL
);

CREATE TABLE link_upvotes(
   link_id INTEGER REFERENCES links(id) ON UPDATE CASCADE,
   user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE
);

CREATE TABLE link_downvotes(
   link_id INTEGER REFERENCES links(id) ON UPDATE CASCADE,
   user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE
);

CREATE TABLE comments(
	id INT PRIMARY_KEY 	NOT NULL,
    link_id INTEGER REFERENCES links(id) ON UPDATE CASCADE,
    user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE,
	comment CHAR(64)	    NOT NULL
);

CREATE TABLE comment_upvotes(
   comment_id INTEGER REFERENCES comments(id) ON UPDATE CASCADE,
   user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE
);

CREATE TABLE comment_downvotes(
   comment_id INTEGER REFERENCES comments(id) ON UPDATE CASCADE,
   user_id INTEGER REFERENCES users(id) ON UPDATE CASCADE
);

