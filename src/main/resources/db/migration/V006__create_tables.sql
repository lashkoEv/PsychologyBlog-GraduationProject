drop table if EXISTS scales;
drop table if exists possible_answers;
drop table if exists questions;
drop table if EXISTS quizzes;

CREATE TABLE quizzes
(
    id          bigint(20)               NOT NULL AUTO_INCREMENT,
    user_id     bigint(20)               not NULL,
    title       varchar(255)             not NULL,
    body        text                     not NULL,
    status      enum ('OPENED','CLOSED') NOT NULL DEFAULT 'OPENED',
    created_ts  TIMESTAMP                not NULL,
    modified_ts TIMESTAMP                NULL,
    PRIMARY KEY (id),
    CONSTRAINT quizzes FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE questions
(
    id            bigint(20)                 NOT NULL AUTO_INCREMENT,
    quiz_id       bigint(20)                 not NULL,
    text_question text                       not NULL,
    type          enum ('SINGLE','MULTIPLE') NOT NULL DEFAULT 'SINGLE',
    position int4,
    PRIMARY KEY (id),
    CONSTRAINT questions_quiz_fk FOREIGN KEY (quiz_id) REFERENCES quizzes (id) ON DELETE CASCADE
);

CREATE TABLE possible_answers
(
    id          bigint(20) NOT NULL AUTO_INCREMENT,
    question_id bigint(20) not NULL,
    text_answer text       not NULL,
    position int4,
    PRIMARY KEY (id),
    CONSTRAINT possible_answers_question_fk FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE CASCADE
);

CREATE TABLE scales
(
    id         bigint(20) NOT NULL AUTO_INCREMENT,
    quiz_id    bigint(20) not NULL,
    min int4 not null default 1,
    max int4 not null default 5,
    text_scale text       not NULL,
    PRIMARY KEY (id),
    CONSTRAINT scales_quiz_fk FOREIGN KEY (quiz_id) REFERENCES quizzes (id) ON DELETE CASCADE
);


INSERT INTO quizzes(id, user_id, title, body, status, created_ts, modified_ts)
VALUES (1, 100, 'опрос 1', 'Цвета и отенки', 'OPENED', '2020-05-23 20:05:22', null);

INSERT INTO questions(id, quiz_id, text_question, type, position)
VALUES (1, 1, 'Укажите ваш любимый цвет', 'SINGLE', 1);
INSERT INTO questions(id, quiz_id, text_question, type, position)
VALUES (2, 1, 'Выберите отенки которые вам нравятся', 'MULTIPLE', 2);

INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (1, 1, 'синий', 1);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (2, 1, 'зеленый', 2);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (3, 1, 'красный', 3);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (4, 2, 'светло голубой', 1);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (5, 2, 'светло зеленый', 2);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (6, 2, 'темно филолетовый', 3);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (7, 2, 'темно малиновый', 4);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (8, 2, 'светло малиновый', 5);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (10, 2, 'светло коричневый', 6);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (11, 2, 'темно оранжевый', 7);
INSERT INTO possible_answers(id, question_id, text_answer, position)
VALUES (12, 2, 'салатный', 8);


INSERT INTO scales(id, quiz_id, min, max, text_scale)
VALUES (1, 1, 1, 3, 'Отличный выбор');
INSERT INTO scales(id, quiz_id, min, max, text_scale)
VALUES (2, 1, 4, 6, 'Замечательный выбор');
INSERT INTO scales(id, quiz_id, min, max, text_scale)
VALUES (3, 1, 7, 10, 'Очень удачный выбор');



ALTER TABLE scales
    AUTO_INCREMENT = 100;
ALTER TABLE possible_answers
    AUTO_INCREMENT = 100;
ALTER TABLE questions
    AUTO_INCREMENT = 100;
ALTER TABLE quizzes
    AUTO_INCREMENT = 100;
