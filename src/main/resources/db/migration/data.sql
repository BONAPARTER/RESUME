Create schema if not exists public;
CREATE TABLE IF NOT EXISTS Employees(
    id BIGSERIAL PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    number VARCHAR(30) NOT NULL,
    nickTelegram VARCHAR(30) NOT NULL,
    image TEXT NOT NULL,
    english_level INT NOT NULL
);
CREATE TABLE IF NOT EXISTS Skills(
    id BIGSERIAL PRIMARY KEY,
    skill INT NOT NULL,
    id_employee BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES Employees (id)
);
CREATE TABLE IF NOT EXISTS Education(
    id BIGSERIAL PRIMARY KEY,
    startYear INT NOT NULL,
    endYear INT NOT NULL,
    nameSchool VARCHAR(50) NOT NULL,
    nameSpecialty VARCHAR(30) NOT NULL,
    id_employee BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES Employees (id)
);
CREATE TABLE IF NOT EXISTS Projects(
    id BIGSERIAL PRIMARY KEY,
    projectName VARCHAR(256) NOT NULL,
    projectDescription VARCHAR(256) NOT NULL,
    id_employee BIGINT NOT NULL,
    FOREIGN KEY (id_employee) REFERENCES Employees (id)
);
CREATE TABLE IF NOT EXISTS Tasks(
    id BIGSERIAL PRIMARY KEY,
    task VARCHAR(256) NOT NULL,
    id_project BIGINT NOT NULL,
    FOREIGN KEY (id_project) REFERENCES Projects (id)
);
INSERT INTO Employees (
        id,
        firstName,
        lastName,
        email,
        number,
        nickTelegram,
        image,
        english_level
    )
VALUES (
        1,
        'Ilya',
        'Golovach',
        'ilya.golovach1508@mail.ru',
        '+375295067831',
        '@crashERI',
        '/images/back.png',
        1
    ),
    (
        2,
        'Kirill',
        'Golovach',
        'kirill.golovach1508@mail.ru',
        '+375295067536',
        '@crash',
        '/images/bober.png',
        2
    ),
    (
        3,
        'Katya',
        'Kozuba',
        'katya.kozuba@mail.ru',
        '+375245453343',
        '@bisha',
        '/images/bober.png',
        3
    );
INSERT INTO Education (
        id,
        startYear,
        endYear,
        nameSchool,
        nameSpecialty,
        id_employee
    )
VALUES (
        1,
        2022,
        2025,
        'BrSTU',
        'инженер-программист',
        1
    ),
    (
        2,
        2022,
        2025,
        'BrSTU',
        'инженер-программист',
        2
    );
INSERT INTO Projects (id, projectName, projectDescription, id_employee)
VALUES (
        1,
        'Rezume',
        'My first project with Spring Boot and DB',
        1
    ),
    (
        2,
        'resume',
        'My two project with Spring Boot and DB',
        2
    );
INSERT INTO Tasks (id, task, id_project)
VALUES (1, 'create file index.html', 1),
    (2, 'create file style.css', 2);
INSERT INTO Skills (skill, id_employee)
VALUES (1, 1),
    (2, 2);