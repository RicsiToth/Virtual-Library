DROP TABLE IF EXISTS Author;
CREATE TABLE Author (
    author_id INTEGER NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    info TEXT NOT NULL
);

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    book_id INTEGER NOT NULL PRIMARY KEY,
    author_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    book_language TEXT NOT NULL,
    genre TEXT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Author (author_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Book_information;
CREATE TABLE Book_information (
    book_id INTEGER NOT NULL,
    number_of_pages INTEGER NOT NULL,
    publisher TEXT NOT NULL,
    ISBN TEXT NOT NULL,
    about_book_text TEXT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books (book_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Book_state;
CREATE TABLE Book_state (
    book_id INTEGER NOT NULL,
    state TEXT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books (book_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Rating;
CREATE TABLE Rating (
    book_id INTEGER NOT NULL,
    about_rating_text TEXT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books (book_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Comments;
CREATE TABLE Comments (
    comment_id INTEGER NOT NULL PRIMARY KEY,
    book_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books (book_id)
        ON DELETE CASCADE ON UPDATE NO ACTION
);