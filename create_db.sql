CREATE TABLE page (
	id serial PRIMARY KEY,
	name text NOT NULL,
    first_char char(1),
    text_page text NOT NULL,
    img_path text,
    rate int DEFAULT 0,
    publisher int,
    last_rewrite date,
    last_rewrite_id int,
    create_date date,
    archive_status int
);

CREATE TABLE category (
	id serial PRIMARY KEY,
    name text
);

CREATE TABLE page_to_category ( id_page BIGINT UNSIGNED, 
id_cat BIGINT UNSIGNED, 
CONSTRAINT fk_page_to_category_page FOREIGN KEY (id_page) REFERENCES page (id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_page_to_category_category FOREIGN KEY (id_cat) REFERENCES category (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE page_rewrite (
    id_rewrite serial PRIMARY KEY,
    id_page BIGINT UNSIGNED,
    name text,
    page_text text,
    img_path text,
    rewriter int,
    rate int,
    CONSTRAINT fk_page_rewrite_to_page FOREIGN KEY (id_page) REFERENCES page (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE users (
    id serial PRIMARY KEY,
    loginn VARCHAR(255) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL,
    role int
);

CREATE TABLE profiles (
    id_profile serial PRIMARY KEY,
    id_user BIGINT UNSIGNED,
    nick text,
    role int,
    info text,
    summary_rate int,
    CONSTRAINT fk_profiles_to_users FOREIGN KEY (id_user) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE page_comments (
    id_comm serial PRIMARY KEY,
    id_user BIGINT UNSIGNED,
    id_page BIGINT UNSIGNED,
    rate int,
    comm_text text,
    CONSTRAINT fk_comments_to_users FOREIGN KEY (id_user) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);
