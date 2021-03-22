ALTER TABLE users
    ADD UNIQUE INDEX uq_users_username(username);

ALTER TABLE users
    ADD COLUMN first_name varchar(50) NULL AFTER password,
    ADD COLUMN last_name varchar(50) NULL AFTER first_name,
    ADD COLUMN birth_date timestamp NULL AFTER last_name;

ALTER TABLE users AUTO_INCREMENT = 100;
ALTER TABLE authorities AUTO_INCREMENT = 100;

INSERT INTO users (username, password, first_name, last_name, birth_date, enabled, email) values('user0', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'Илья', 'Терентьев', '1987-10-10', 1, 'juuko@gmail.com');
SELECT @userId := LAST_INSERT_ID();
INSERT INTO authorities (user_id, authority) VALUES (@userId, 'ROLE_PSYCHOLOGIST');

INSERT INTO users (username, password, first_name, last_name, birth_date, enabled, email) values('user1', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'Пётр', 'Фролов', '1993-05-5', 1, 'innokent@gmail.com');
SELECT @userId := LAST_INSERT_ID();
INSERT INTO authorities (user_id, authority) VALUES (@userId, 'ROLE_PSYCHOLOGIST');

INSERT INTO users (username, password, first_name, last_name, birth_date, enabled, email) values('user2', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'Анастасия', 'Иванова', '1983-05-4', 1, 'jnastiao@gmail.com');
SELECT @userId := LAST_INSERT_ID();
INSERT INTO authorities (user_id, authority) VALUES (@userId, 'ROLE_PSYCHOLOGIST');
--
-- INSERT INTO users (username, password, first_name, last_name, birth_date, enabled, email) values('user3', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'Кристина', 'Петрова', '1976-05-18', 1, 'kris@gmail.com');
-- SELECT @userId := LAST_INSERT_ID();
-- INSERT INTO authorities (user_id, authority) VALUES (@userId, 'ROLE_PSYCHOLOGIST');
--
-- INSERT INTO users (username, password, first_name, last_name, birth_date, enabled, email) values('user4', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'Зоя', 'Кудрявцева', '1987-05-8', 1, 'zoi@gmail.com');
-- SELECT @userId := LAST_INSERT_ID();
-- INSERT INTO authorities (user_id, authority) VALUES (@userId, 'ROLE_PSYCHOLOGIST');
--
-- INSERT INTO users (username, password, first_name, last_name, birth_date, enabled, email) values('user5', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'Филипп', 'Самойлов', '1981-05-7', 1, 'fil112@gmail.com');
-- SELECT @userId := LAST_INSERT_ID();
-- INSERT INTO authorities (user_id, authority) VALUES (@userId, 'ROLE_PSYCHOLOGIST');
--
-- INSERT INTO users (username, password, first_name, last_name, birth_date, enabled, email) values('user10', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 'Виталий', 'Лыткин', '1982-05-1', 1, 'qwerty228@gmail.com');
-- SELECT @userId := LAST_INSERT_ID();
-- INSERT INTO authorities (user_id, authority) VALUES (@userId, 'ROLE_PSYCHOLOGIST');
--
--
