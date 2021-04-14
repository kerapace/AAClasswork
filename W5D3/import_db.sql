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
    ('Anthony', 'Chen'),
    ('Tina', 'Turner'),
    ('Goofus','Garibaldi'),
    ('Gallant', 'Goodall'),
    ('Mister', 'Miyagi');

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
    ('Don''t understand grid CSS styling', 'I can''t seem to make the indices work out', (SELECT id FROM users WHERE f_name = 'Jonathan')),
    ('How do I use Progress Tracker?', 'I''m on my last strike and I don''t know where to check in!', (SELECT id FROM users WHERE f_name = 'Goofus')),
    ('How can I help other people if I finish early?','The instructions say to work on tomorrow''s homework, but I''m already done',(SELECT id FROM users WHERE f_name = 'Gallant'));

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    u_id INTEGER NOT NULL,
    q_id INTEGER NOT NULL,
    FOREIGN KEY (u_id) REFERENCES users(id)
    FOREIGN KEY (q_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows(
        u_id,
        q_id
    )

VALUES
    ((SELECT id FROM users WHERE f_name = 'Goofus'), (SELECT id FROM questions WHERE title = 'Need help formatting SQL file')),
    ((SELECT id FROM users WHERE f_name = 'Goofus'), (SELECT id FROM questions WHERE title = 'Don''t understand grid CSS styling')),
    ((SELECT id FROM users WHERE f_name = 'Gallant'), (SELECT id FROM questions WHERE title = 'Don''t understand grid CSS styling')),
    ((SELECT id FROM users WHERE f_name = 'Gallant'), (SELECT id FROM questions WHERE title = 'Need help formatting SQL file')),
    ((SELECT id FROM users WHERE f_name = 'Gallant'), (SELECT id FROM questions WHERE title = 'How do I use Progress Tracker?'));

DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    q_id INTEGER NOT NULL,
    p_reply_id INTEGER,
    body TEXT NOT NULL,
    FOREIGN KEY (q_id) REFERENCES questions(id)
    FOREIGN KEY (p_reply_id) REFERENCES replies(id)
);

INSERT INTO
    replies(
        q_id,
        p_reply_id,
        body
    )

VALUES
    ((SELECT id FROM questions WHERE title = 'How do I use Progress Tracker?'), NULL, 'You''ve got to set an alarm on your computer so you won''t miss the check-in!'),
    ((SELECT id FROM questions WHERE title = 'How do I use Progress Tracker?'), 1, 'I''ve tried, but I still seem to forget after I''ve dismissed the alarm'),
    ((SELECT id FROM questions WHERE title = 'How do I use Progress Tracker?'), 2, 'C''mon man'),
    ((SELECT id FROM questions WHERE title = 'Need help formatting SQL file'), NULL, 'You''ve got to make sure you remembered to place semicolons correctly!'),
    ((SELECT id FROM questions WHERE title = 'Need help formatting SQL file'), 4, 'And don''t forget to use two single quotes to escape quotes in string literals in SQL!');
DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    u_id INTEGER NOT NULL,
    q_id INTEGER NOT NULL,
    FOREIGN KEY (u_id) REFERENCES users(id)
    FOREIGN KEY (q_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes(
        u_id,
        q_id
    )

VALUES
    ((SELECT id FROM users WHERE f_name = 'Gallant'), (SELECT id FROM questions WHERE title = 'How do I use Progress Tracker?')),
    ((SELECT id FROM users WHERE f_name = 'Gallant'), (SELECT id FROM questions WHERE title = 'Don''t understand grid CSS styling')),
    ((SELECT id FROM users WHERE f_name = 'Gallant'), (SELECT id FROM questions WHERE title = 'Need help formatting SQL file')),
    ((SELECT id FROM users WHERE f_name = 'Mister'), (SELECT id FROM questions WHERE title = 'Don''t understand grid CSS styling'));