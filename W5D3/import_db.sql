DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    f_name VARCHAR(255) NOT NULL,
    l_name VARCHAR(255) NOT NULL,
);

INSERT INTO
    users(
        f_name,
        l_name
    )
VALUES
    ('Jonathan','Hill'),
    ('Ying','Chen'),
    ('Anthony', 'Chen')

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    FOREIGN KEY (u_id) REFERENCES users(id)
);

INSERT INTO
    questions(
        title,
        body
        u_id
    );

VALUES
    ('Need help formatting SQL file', 'I don''t understand the syntax because I''ve never written something this way before',
    SELECT id FROM users WHERE user = 'Jonathan Hill')
    ('Don''t understand grid CSS styling', 'I can''t seem to make the indices work out', SELECT id FROM users WHERE user = 'Jonathan Hill')

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (u_id) REFERENCES users(id)
    FOREIGN KEY (q_id) REFERENCES questions(id)
);
