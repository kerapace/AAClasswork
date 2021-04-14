DROP TABLE IF EXISTS users;


PRAGMA foreign_keys = ON;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL
);

INSERT INTO
    users(
        f_name,
        l_name
    )
VALUES
    ('Jonathan','Hill'),
    ('Ying','Chen'),
    ('Anthony', 'Chen');

DROP TABLE IF EXISTS questions;

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    u_id INTEGER NOT NULL,
    FOREIGN KEY (u_id) REFERENCES users(id)

);

INSERT INTO
    questions(
        title,
        body,
        u_id
    )

VALUES
    ('Need help formatting SQL file', 'I don''t understand the syntax because I''ve never written something this way before',
    (SELECT id FROM users WHERE f_name = 'Jonathan')),
    ('Don''t understand grid CSS styling', 'I can''t seem to make the indices work out', (SELECT id FROM users WHERE f_name = 'Jonathan'));

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    u_id INTEGER NOT NULL,
    q_id INTEGER NOT NULL,
    FOREIGN KEY (u_id) REFERENCES users(id)
    FOREIGN KEY (q_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    q_id INTEGER NOT NULL,
    p_reply_id INTEGER,
    body TEXT NOT NULL,
    FOREIGN KEY (q_id) REFERENCES questions(id)
    FOREIGN KEY (p_reply_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    u_id INTEGER NOT NULL,
    q_id INTEGER NOT NULL,
    FOREIGN KEY (u_id) REFERENCES users(id)
    FOREIGN KEY (q_id) REFERENCES questions(id)
);