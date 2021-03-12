
drop table if EXISTS authorities;
drop table if EXISTS users;

CREATE TABLE users  (
                        id bigint(20) NOT NULL AUTO_INCREMENT,
                        username varchar(50) NULL,
                        password varchar(255) NULL,
                        email varchar(50),
                        enabled tinyint NULL DEFAULT 1,
                        PRIMARY KEY (id)
);

CREATE TABLE authorities  (
                              id bigint(20) NOT NULL AUTO_INCREMENT,
                              user_id bigint(20) NULL,
                              authority varchar(255) NULL,
                              PRIMARY KEY (id),
                              CONSTRAINT authorities_user_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);


-- pass
INSERT INTO users (id, username, password, enabled) VALUES (1, 'adm', '{bcrypt}$2a$10$cyf5NfobcruKQ8XGjUJkEegr9ZWFqaea6vjpXWEaSqTa2xL9wjgQC', 1);
INSERT INTO authorities (user_id, authority) VALUES (1, 'ROLE_ADMIN');
