CREATE TABLE "Единицы Измерения" (
                                     "КодЕдИзм" SERIAL PRIMARY KEY,
                                     "Наим" VARCHAR(255) NOT NULL UNIQUE,
                                     "Сокращ" VARCHAR(255) NOT NULL
);

CREATE TABLE "Товарно-материальные ценности" (
                                                 "КодТов" SERIAL PRIMARY KEY,
                                                 "НаимТов" VARCHAR(255) NOT NULL,
                                                 "Произв" VARCHAR(255) NOT NULL,
                                                 "КодЕдИзм" INTEGER NOT NULL REFERENCES "Единицы Измерения" ("КодЕдИзм") ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE "Должности" (
                             "КодДолжн" SERIAL PRIMARY KEY,
                             "НаимДолжн" VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE "Сотрудники" (
                              "КодУчетНомСотр" SERIAL PRIMARY KEY,
                              "ФИОСпец" VARCHAR(255) NOT NULL,
                              "ДатРожд" DATE NOT NULL,
                              "КодДолжн" INTEGER NOT NULL REFERENCES "Должности" ("КодДолжн") ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE "Места хранения" (
                                  "КодСтрукт" SERIAL PRIMARY KEY,
                                  "НаимСтр" VARCHAR(255) NOT NULL,
                                  "Адр" VARCHAR(255) NOT NULL
);

CREATE TABLE "Приказ о проведении инвентар" (
                                                      "КодПрик" SERIAL PRIMARY KEY,
                                                      "КодМест" INTEGER REFERENCES "Места хранения" ("КодСтрукт") ON UPDATE CASCADE ON DELETE RESTRICT,
                                                      "Дата" DATE NOT NULL DEFAULT CURRENT_DATE,
                                                      "КодПредс" INTEGER REFERENCES "Сотрудники" ("КодУчетНомСотр") ON UPDATE CASCADE ON DELETE SET NULL,
                                                      "КодДирект" INTEGER REFERENCES "Сотрудники" ("КодУчетНомСотр") ON UPDATE CASCADE ON DELETE SET NULL,
                                                      "КодМОТ" INTEGER REFERENCES "Сотрудники" ("КодУчетНомСотр") ON UPDATE CASCADE ON DELETE SET NULL,
                                                      "ДатаНач" DATE NOT NULL DEFAULT CURRENT_DATE,
                                                      "ДатаОконч" DATE NOT NULL DEFAULT CURRENT_DATE,
                                                      CONSTRAINT chk_Дата CHECK ("ДатаОконч" >= "ДатаНач")
);

CREATE TABLE "ТаблЧасть_Приказ" (
                                    "ID" SERIAL PRIMARY KEY,
                                    "КодПрик" INTEGER REFERENCES "Приказ о проведении инвентар" ("КодПрик") ON UPDATE CASCADE ON DELETE CASCADE,
                                    "КодУчетНомСотр" INTEGER REFERENCES "Сотрудники" ("КодУчетНомСотр") ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE "Инвентаризационная опись" (
                                            "КодИнвОп" SERIAL PRIMARY KEY,
                                            "КодМест" INTEGER REFERENCES "Места хранения" ("КодСтрукт") ON UPDATE CASCADE ON DELETE SET NULL,
                                            "КодПрик" INTEGER REFERENCES "Приказ о проведении инвентар" ("КодПрик") ON UPDATE CASCADE ON DELETE SET NULL,
                                            "Дата" DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE "ТаблЧасть_ИнвОп" (
                                   "ID" SERIAL PRIMARY KEY,
                                   "КодИнвОп" INTEGER REFERENCES "Инвентаризационная опись" ("КодИнвОп") ON UPDATE CASCADE ON DELETE CASCADE,
                                   "КодТов" INTEGER REFERENCES "Товарно-материальные ценности" ("КодТов") ON UPDATE CASCADE ON DELETE SET NULL,
                                   "БухУчетКолТов" INTEGER,
                                   "ФактУчетКолТов" INTEGER,
                                   "Наим" VARCHAR(255) NOT NULL,
                                   "Излишки" INTEGER GENERATED ALWAYS AS (
                                       CASE
                                           WHEN "ФактУчетКолТов" > "БухУчетКолТов" THEN "ФактУчетКолТов" - "БухУчетКолТов"
                                           ELSE NULL
                                           END
                                       ) STORED,
                                   "Недостача" INTEGER GENERATED ALWAYS AS (
                                       CASE
                                           WHEN "ФактУчетКолТов" < "БухУчетКолТов" THEN "БухУчетКолТов" - "ФактУчетКолТов"
                                           ELSE NULL
                                           END
                                       ) STORED
);

CREATE TABLE "Приходно-расходный ордер" (
                                            "КодПрихРасхОрд" SERIAL PRIMARY KEY,
                                            "КодИнвОп" INTEGER REFERENCES "Инвентаризационная опись" ("КодИнвОп") ON UPDATE CASCADE ON DELETE RESTRICT,
                                            "КодМест" INTEGER REFERENCES "Места хранения" ("КодСтрукт") ON UPDATE CASCADE ON DELETE SET NULL,
                                            "Дата" DATE NOT NULL DEFAULT CURRENT_DATE,
                                            "КодУчетНомСотр" INTEGER REFERENCES "Сотрудники" ("КодУчетНомСотр") ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE "ТаблЧасть_ПрихРасхОрд" (
                                         "ID" SERIAL PRIMARY KEY,
                                         "КодПрихРасхОрд" INTEGER REFERENCES "Приходно-расходный ордер" ("КодПрихРасхОрд") ON UPDATE CASCADE ON DELETE CASCADE,
                                         "КодТов" INTEGER REFERENCES "Товарно-материальные ценности" ("КодТов") ON UPDATE CASCADE ON DELETE SET NULL,
                                         "Знач" INTEGER NOT NULL,
                                         "Наим"  VARCHAR(255) NOT NULL
);