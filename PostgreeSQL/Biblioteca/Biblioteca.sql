
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    author_id INT REFERENCES authors(author_id),
    genre_id INT REFERENCES genres(genre_id),
    isbn VARCHAR(20) UNIQUE
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    member_id INT REFERENCES members(member_id),
    loan_date DATE DEFAULT CURRENT_DATE,
    return_date DATE
);

INSERT INTO authors (first_name, last_name) VALUES
(
    'Stephen',
    'King'
),
(
    'J.K.',
    'Rowling'
);

INSERT INTO genres (genre_name) VALUES
(
    'Horror'
),
(
    'Fantasy'
);

INSERT INTO books (title, publication_year, author_id, genre_id, isbn) VALUES
(
    'It',
    1986,
    (SELECT author_id FROM authors WHERE first_name = 'Stephen' AND last_name = 'King'),
    (SELECT genre_id FROM genres WHERE genre_name = 'Horror'),
    '978-045145721
'),
(
    'Harry Potter and the Sorcerer''s Stone',
    1997,
    (SELECT author_id FROM authors WHERE first_name = 'J.K.' AND last_name = 'Rowling'),
    (SELECT genre_id FROM genres WHERE genre_name = 'Fantasy'),
    '978-0590353403'
);

INSERT INTO members (first_name, last_name, email, phone) VALUES
(
    'Peter',
    'Parker',
    'peter.parker@example.com',
    '111-111-1111'
),
(
    'Mary',
    'Jane',
    'mary.jane@example.com',
    '222-222-2222'
);

INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
(
    (SELECT book_id FROM books WHERE title = 'It'),
    (SELECT member_id FROM members WHERE email = 'peter.parker@example.com'),
    '2024-08-01',
    '2024-08-15'
);


