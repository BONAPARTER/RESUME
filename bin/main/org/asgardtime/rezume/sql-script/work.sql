CREATE SCHEMA conf;
CREATE TABLE conf.users --Пользователи
(
    id                   BIGINT PRIMARY KEY,
    user_name_tg         VARCHAR(30) NOT NULL,
    user_name            VARCHAR(30),
    date_entry           DATE        NOT NULL,
    field_of_activity    VARCHAR(50),
    number_of_conference INT,
    condition            VARCHAR(50) NOT NULL,
    basis_of_absence     VARCHAR(50),
    fine                 INT
);

CREATE TABLE conf.conf --конференция
(
    id                       BIGINT PRIMARY KEY,
    topic_conference         VARCHAR(50) NOT NULL,
    date_time_of_start       DATE        NOT NULL,
    conference_link          TEXT        NOT NULL,
    moderation_rules         VARCHAR(50) NOT NULL,
    link_of_moderation_rules TEXT        NOT NULL,
    conference_status        VARCHAR(50) NOT NULL
);

CREATE TABLE conf.balls --балы
(
    id     BIGINT PRIMARY KEY,
    reason VARCHAR(50) NOT NULL,
    balls  INT         NOT NULL DEFAULT 0
);

CREATE TABLE conf.voting --голосование
(
    id                            BIGINT PRIMARY KEY,
    balls_id                      INT         NOT NULL,
    voice_for_the_best_speaker    INT         NOT NULL,
    voice_for_the_worst_speaker   INT         NOT NULL,
    voice_for_the_best_moderator  INT         NOT NULL,
    voice_for_the_worst_moderator INT         NOT NULL,
    user_id                       BIGINT      NOT NULL,
    conference_id                 BIGINT      NOT NULL,
    status_of_a_participant       VARCHAR(50) NOT NULL,
    protruding                    INT         NOT NULL,
    moderator                     INT         NOT NULL,
    time_of_moderation            TIME        NOT NULL,
    FOREIGN KEY (user_id) REFERENCES conf.users (id),
    FOREIGN KEY (conference_id) REFERENCES conf.conf (id),
    FOREIGN KEY (balls_id) REFERENCES conf.balls (id)
);

CREATE TABLE conf.time --таблица свободного вреимени
(
    id      BIGINT PRIMARY KEY,
    user_id BIGINT    NOT NULL,
    time    TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES conf.users (id)
);

CREATE TABLE conf.topic --тема
(
    id            BIGINT PRIMARY KEY,
    user_id       BIGINT       NOT NULL,
    name_of_title VARCHAR(255) NOT NULL,
    count_users   INT          NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES conf.users (id)

);

CREATE TABLE conf.rules --правила
(
    id                 BIGINT PRIMARY KEY,
    data_of_offer      DATE         NOT NULL,
    user_id            BIGINT       NOT NULL,
    assume_formulation VARCHAR(255) NOT NULL,
    cause              VARCHAR(255) NOT NULL,
    time_step_start    TIMESTAMP    NOT NULL,
    time_step_finish   TIMESTAMP    NOT NULL,
    voice_for          INT          NOT NULL DEFAULT 0,
    voice_against      INT          NOT NULL DEFAULT 0

);



CREATE TABLE conf.modified_rules --правила
(
    id                         BIGINT PRIMARY KEY,
    formulation                VARCHAR(255) NOT NULL,
    number_of_rule_for_changes INT          NOT NULL,
    actual_rules               BOOLEAN
);

INSERT INTO conf.users (id, user_name_tg, user_name, date_entry, field_of_activity, number_of_conference, condition,
                        basis_of_absence, fine)
VALUES (1, 12123, '@Den', '2023-12-12', 'Den', '2', 'management', 'managementing', 3),
       (2, 12123, '@Masha', '2024-12-23', 'Masha', '3', 'coking', 'cokining', 4),
       (3, 12123, '@Vera', '2023-12-12', 'Vera', '4', 'painting', 'paintining', 2),
       (4, 12123, '@Dima', '2023-12-12', 'Dima', '5', 'drawing', 'drawining', 2);

INSERT INTO conf.conf(id, topic_conference, date_time_of_start, conference_link, moderation_rules,
                      link_of_moderation_rules, conference_status)
VALUES (1, 'Cats', '2025-10-19T12:00:00', 10, 'cat-link', 4, 'Состоялась'),
       (2, 'Dogs', '2025-10-19T13:00:00', 15, 'dog-link', 4, 'Состоялась');

INSERT INTO conf.balls(id, reason, balls)
VALUES (1, 'просто', 1),
       (2, 'просто', 2),
       (3, 'просто', 3),
       (4, 'просто', 4);


INSERT INTO conf.voting(id, balls_id, voice_for_the_best_speaker, voice_for_the_worst_speaker,
                        voice_for_the_best_moderator, voice_for_the_worst_moderator, user_id, conference_id,
                        status_of_a_participant, protruding, moderator, time_of_moderation)
VALUES (1, 2, 1, -1, 1, 1, 1, 2, 'присутствует', 4, 1, '12:00:00'),
       (2, 4, 2, 4, 1, 1, 2, 2, 'присутствует', 2, 1, '12:00:00'),
       (3, 1, 5, -1, 1, 1, 3, 2, 'отсутствует', 1, 1, '12:00:00'),
       (4, 3, 2, -2, 1, 1, 4, 2, 'присутствует', 5, 2, '12:00:00'),
       (5, 2, 7, -4, 1, 1, 1, 2, 'присутствует', 3, 2, '12:00:00'),
       (6, 3, -1, 7, 1, 1, 2, 2, 'отсутствует', 6, 3, '12:00:00'),
       (7, 2, -1, 5, 1, 1, 3, 2, 'присутствует', 7, 3, '12:00:00'),
       (8, 3, -2, 4, 1, 1, 4, 2, 'отсутствует', 9, 1, '12:00:00'),
       (9, 4, -4, 2, 1, 1, 1, 2, 'присутствует', 8, 1, '22:00:00');


INSERT INTO conf.time(id, user_id, time)
VALUES (1, 1, '2025-04-11T12:00:00'),
       (2, 1, '2025-04-11T13:00:00'),
       (3, 1, '2025-04-11T14:00:00'),
       (4, 1, '2025-04-11T15:00:00'),
       (5, 2, '2025-04-11T10:00:00'),
       (6, 2, '2025-04-11T11:00:00'),
       (7, 2, '2025-04-11T12:00:00'),
       (8, 2, '2025-04-11T13:00:00'),
       (9, 3, '2025-04-11T12:00:00'),
       (10, 3, '2025-04-11T13:00:00'),
       (11, 4, '2025-04-11T12:00:00'),
       (12, 4, '2025-04-11T16:00:00');

INSERT INTO conf.topic (id, user_id, name_of_title, count_users)
VALUES (1, 1, 'Cats', 4),
       (2, 1, 'Dogs', 3),
       (3, 3, 'Fish', 1),
       (4, 4, 'Birds', 1);

INSERT INTO conf.rules(id, data_of_offer, user_id, assume_formulation, cause, time_step_start, time_step_finish,
                       voice_for, voice_against)
VALUES (1, '2025-10-19T11:00:00', 123554, 'ерунда какая-то', 'не хотелось', '2025-04-11T16:00:00',
        '2025-04-11T19:00:00', 4, 4),
       (2, '2025-10-19T13:00:00', 123554, 'ерунда какая-то', 'не хотелось', '2025-04-11T16:00:00',
        '2025-04-11T16:00:00', 1, 4),
       (3, '2025-10-19T14:00:00', 123554, 'ерунда какая-то', 'не хотелось', '2025-04-11T16:00:00',
        '2025-04-11T16:00:00', 2, 4),
       (4, '2025-10-19T18:00:00', 123554, 'ерунда какая-то', 'не хотелось', '2025-04-11T16:00:00',
        '2025-04-11T17:00:00', 2, 4);



INSERT INTO conf.modified_rules(id, formulation, number_of_rule_for_changes, actual_rules)
VALUES (1, 'something', 2, 'true'),
       (2, 'something', 2, 'false'),
       (3, 'something', 2, 'false'),
       (4, 'something', 2, 'false');



SELECT u.user_name_tg,
       t.name_of_title,
       t.count_users
FROM conf.users u
    JOIN conf.topic t
        ON u.id = t.user_id;

explain SELECT
    (SELECT user_name_tg FROM conf.users u WHERE u.id = t.user_id),
       t.name_of_title,
       t.count_users
FROM conf.topic t;

SELECT * FROM conf.users
JOIN conf.voting v ON users.id = v.user_id;


SELECT u.user_name,
       u.user_name_tg,
       u.date_entry,
       u.field_of_activity,
       count(v.user_id),
       sum(b.balls),
       array_agg(v.user_id),
       sum(CASE WHEN v.status_of_a_participant = 'присутствует' then 1 ELSE 0 end ) AS counter
FROM conf.users u
         JOIN conf.voting v ON u.id = v.user_id
         JOIN conf.balls b ON v.balls_id = b.id
GROUP BY u.user_name, u.user_name_tg, u.date_entry, u.field_of_activity;


EXPLAIN SELECT c.topic_conference,
       c.date_time_of_start,
       v.moderator,
       c.moderation_rules,
       c.conference_link,
       c.conference_status,
       COUNT(v.user_id),
       c.link_of_moderation_rules
FROM conf.conf c
        JOIN conf.voting v ON c.id = v.conference_id
GROUP BY v.moderator, c.date_time_of_start, c.topic_conference, c.moderation_rules, c.conference_link, c.conference_status,
        c.link_of_moderation_rules;



EXPLAIN SELECT DISTINCT c.topic_conference,
       c.date_time_of_start,
       v.moderator,
       c.moderation_rules,
       c.conference_link,
       c.conference_status,
       COUNT(v.user_id) OVER(PARTITION BY c.topic_conference),
       c.link_of_moderation_rules
FROM conf.conf c
         JOIN conf.voting v ON c.id = v.conference_id

