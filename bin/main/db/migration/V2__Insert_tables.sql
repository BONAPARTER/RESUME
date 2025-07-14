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
        'Kotsuba',
        'katya.kotsuba@mail.ru',
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




-- INSERT INTO employees (id, firstName, lastName, email, nickTelegram, image, english_level)
-- VALUES (4,
--         'Max',
--         'Maximov',
--         'max.maximov@mail.ru',
--         '+375298563421',
--         '@maximovM',
--         '/images/back.png',
--         2);