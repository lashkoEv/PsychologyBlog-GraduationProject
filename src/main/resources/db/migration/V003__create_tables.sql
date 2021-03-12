drop table if EXISTS posts;

CREATE TABLE posts
(
    id        bigint(20) NOT NULL AUTO_INCREMENT,
    user_id   bigint(20) not NULL,
    parent_id bigint(20) NULL,
    title     varchar(100)       not NULL,
    body      text       not NULL,
    deleted   boolean default false,
    created_ts TIMESTAMP not NULL,
    modified_ts TIMESTAMP NULL,
    PRIMARY KEY (id),
    CONSTRAINT posts_user_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT posts_post_fk FOREIGN KEY (parent_id) REFERENCES posts (id) ON DELETE CASCADE
);
