'''Удаление, создание и изменение таблиц'''
-- Удалите таблицу astronoms
DROP TABLE astronoms;
-- Удалите таблицу constellations
DROP TABLE constellations;
-- Удалите таблицу stars
DROP TABLE stars;

-- Создайте таблицу stars, укажите  тип данных для столбцов star_name и constellation
-- как строковый тип переменной длины (30 символов)
CREATE TABLE stars (
  star_id SERIAL NOT NULL PRIMARY KEY,
  star_name VARCHAR(30) NULL,
  constellation ...,
  con_id SMALLINT,
  distance SMALLINT,
  absolute_magnitude FLOAT,
  spectral_type VARCHAR(30),
  selestial_hemisphere VARCHAR(10),
  parallax INTEGER
);
-- Внесите в созданную таблицу следующие данные:
INSERT INTO
  stars (star_name, constellation, con_id, distance, absolute_magnitude, spectral_type,
    selestial_hemisphere, parallax)
VALUES
  ('Sun', null, NULL, 0.000015823820, 4.8, 'G2V', null, NULL),
  ('Sirius', 'Canis Major', 1, 8.6, 1.4, 'A0mA1Va', 'Southern', 379.2),
  ('Canopus', 'Carina', 2, 309, -2.5, 'A9II', 'Southern', 10.55),
  ('Arcturus', 'Bootes', 3, 36.72, 0.2, 'K1.5IIIp', 'Northern', 88.8),
  ('Vega', 'Lyra', 4, 25, 0.6, 'A0Va', 'Northern', 130.2),
  ('Capella', 'Auriga', 5, 42.8, 0.4,	'G6III + G2III', 'Northern', 76.2),
  ('Rigel', 'Orion', 6, 862.86, -8.1, 'B81ae', 'Southern', 3.8),
  ('Betelgeuse', 'Orion', 6, 497.95, -7.2, 'M2Iab', 'Northern', 6.5),
  ('Rigil Kentaurus', 'Centaurus', 7, 4.3, 4.4, 'G2V', 'Southern', 754.81),
  ('Hadar', 'Centaurus', 7, 392.02, -4.4, 'B1III', 'Southern', 8.32),
  ('Acrux', 'Crux', 8, 321.97, -4.6, 'B0.5Iv + B1Vn', 'Southern', 10.13),
  ('Gacrux', 'Crux', 8, 88.56, -1.2, 'M3.5III', 'Southern', 36.8),
  ('Deneb', 'Cygnus', 9, 1411.95, -7.2, 'A2Ia', 'Northern', 2.3),
  ('Sadr', 'Cygnus', 9, null, null, 'F8Ib', 'Northern',  NULL),
  ('Mimosa', 'Crux', 8, 278.53, -4, 'B0.5III', 'Southern', 11.7),
  ('Castor', 'Gemini', 10, 50.87,	0.5, 'A1V + A2V', 'Northern', 64.1),
  ('Pollux', 'Gemini', 10, 33.79, 0.7, 'K0IIIb', 'Northern', 96.5),
  ('Polaris', 'Ursa minor', 12, 432.57, 1.98, 'F8Ib', 'Northern', 7.5),
  ('Spica', 'Virgo', 14, 249.74, 1.04, 'B1V', 'Northern', 13.1),
  ('Antares', 'Scorpius', 15, 553.76, -5.28, 'M0.5Iab-Ib + B3V', 'Northern', 5.9),
  ('Mira', 'Cetus', 16, 298.96, null, 'M5-9IIIe+DA', 'Northern', 10.9),
  ('Menkar', 'Cetus', 16, 249.17, null, 'M1.5IIIa', 'Northern', 13.1),
  ('Mirfak', 'Perseus', 17, 506.46, null, 'F51b', 'Northern', 6.4);

  -- Создайте таблицу constellations
  CREATE TABLE constellations (
    con_id SERIAL NOT NULL PRIMARY KEY,
    con_name VARCHAR(30),
    con_area SMALLINT,
    bel_con_name VARCHAR(30),
    ru_con_name VARCHAR(30),
    num_stars1 SMALLINT, -- количество звезд, яркостью 2.4–4.4
    num_stars2 SMALLINT,      -- количество звезд, яркостью 4.4–5.5
    date_observed DATE,
    number_of_stars SMALLINT
  );

  -- Добавьте значения в таблицу constellations
  INSERT INTO
     constellations(con_id, con_name, con_area, bel_con_name, ru_con_name, num_stars1, num_stars2, date_observed, number_of_stars)
  VALUES
  (1, 'Canis Major', 380, 'Вялікі Пёс', 'Большой Пес', 13, 38, '2022-01-25', 56),
  (2, 'Carina', 494, 'Кіль', 'Киль', 20, 53, '2022-01-30', 77),
  (3, 'Bootes', 907, 'Валапас ', 'Волопас', 12, 39, '2022-02-10', 53),
  (4, 'Lyra', 286, 'Ліра', 'Лира', 8, 17, '2022-3-15', 26),
  (5, 'Auriga', 657, 'Вознік', 'Возничий', 9, 36, '2022-03-18', 47),
  (6,'Orion', 594, 'Арыён', 'Орион', 19, 51, '2022-03-21', 77),
  (7, 'Centaurus', 1060, 'Цэнтаўр', 'Кентавр', 31, 64, '2022-04-02', 101),
  (8, 'Crux', 68, 'Паўднёвый Крыж', 'Южный крест', 6, 11, '2022-05-13', 20),
  (9, 'Cygnus', 804, 'Лебедзь ', 'Лебедь', 20, 56, '2022-06-23', 79),
  (10, 'Gemini', 514, 'Блізняты', 'Близнецы', 16, 28, '2022-07-10', 47),
  (11, 'Ursa Major', 1280, 'Вялікая Мядзведзіца', 'Большая медведица', 14, 51, '2022-08-25', 71),
  (12, 'Ursa Minor', 256, 'Малая Мядзведзіца', 'Малая медведица', 5, 11, '2022-09-03', 18),
  (13, 'Andromeda', 722, 'Андрамеда ', 'Андромеда', 14, 37, '2022-10-11', 54),
  (16, 'Cetus', 1231, 'Кіт', 'Кит', 14, 43, '2022-11-27', 58),
  (17, 'Perseus', 615, 'Персей', 'Персей', 22, 42, '2022-12-25', 65);

  -- Создайте таблицу stargazers
  CREATE TABLE stargazers(
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  observ_date DATE,
  con_id SMALLINT,
  date_of_birth DATE
  );

  INSERT INTO
    stargazers(first_name, last_name, observ_date, con_id, date_of_birth)
  VALUES
    ('Susi', 'Brown', '2022-01-25',  11, '1978-05-18'),
    ('Liz', 'Stoun', '2021-03-25', 3, '1985-08-20'),
    ('John', 'Swift', '2021-09-03', 5, '1963-11-04'),
    ('Volha', 'Swift', '2019-12-05', 4, '1995-03-11'),
    ('Anatoly', 'Black', '2022-06-20', 16, '2006-10-15'),
    ('Mats', 'Berg', '2022-03-25', 1, '1973-06-06'),
    ('Alex', 'Larsson', '2022-09-15', 9, '1991-07-24'),
    ('Julia',  'Watson', '2009-01-13', 1, '1982-11-12'),
    ('Linda', 'Hatson', '2011-06-11', 8, '2002-05-08');

  -- Creating table astronoms
    CREATE TABLE astronoms (
      con_id SMALLINT NOT NULL,
      author VARCHAR(30),
      origin TEXT
    );

    INSERT INSERT astronoms (con_id, author, origin)
    VALUES
      (1, 'Ptolemy', 'greek'),
      (2, 'Nicolas Louis de Lacaille', 'french'),
      (3, 'Ptolemy', 'greek'),
      (4, 'Ptolemy', 'greek'),
      (5, 'Ptolemy', 'greek'),
      (6, 'Ptolemy', 'greek'),
      (7, 'Ptolemy', 'greek'),
      (8, 'Frederick de Houtman', 'dutch'),
      (9, 'Ptolemy', 'greek'),
      (10, 'Ptolemy', 'greek'),
      (11, 'Ptolemy', 'greek'),
      (12, 'Ptolemy', 'greek'),
      (13, 'Ptolemy', 'greek'),
      (14, 'Ptolemy', 'greek'),
      (15, 'Ptolemy', 'greek'),
      (16, 'Ptolemy', 'greek'),
      (17, 'Ptolemy', 'greek');

      -- create table manuscript
      CREATE TABLE manuscripts (
        discoverer VARCHAR(30),
        published_in TEXT,
        year INTEGER
      );

      INSERT INTO manuscripts (discoverer, published_in, year)
      VALUES
        ('Ptolemy', 'Almagest', 150),
        ('Nicolas Louis de Lacaille', null, 1763),
        ('Frederick de Houtman', 'Uranometria', 1603);

SELECT * FROM stars; -- просмотрите все значения в таблице

SELECT * FROM constellations; -- просмотрите все значения в таблице

SELECT * FROM stargazers; -- просмотрите все значения в таблице

'''Предсавление. Создание, изменение'''
-- Создайте представление, содержащее информацию о месяце, в котором наблюдали созвездие
-- извлеките месяц из date_observed и сгруппируйте созвездия по сезону
-- данные возьмите из таблицы constellations

CREATE VIEW con_season AS
SELECT
con_name, con_id, con_area, extract(month from date_observed) as month,
CASE WHEN extract(month from date_observed) in(3,4,5)
THEN 'Spring_months'
WHEN extract(month from date_observed) in (6,7,8)
THEN 'Summer_months'
WHEN extract(month from date_observed) in (9,10,11)
THEN 'Autumn_months'
WHEN extract(month from date_observed) in (12,1,2)
THEN 'Winter_months'
END AS season
FROM constellations;


SELECT * FROM con_season; -- просмотрите результат создания представления

-- изменение базовой таблицы через изменение представления
INSERT INTO con_season(con_name, con_id, con_area) -- измените представление con_season, добавьте строку с новым созвездием
VALUES ('Draco', 18, 1083);

SELECT * FROM con_season; -- просмотрите результат изменения представления

SELECT * FROM constellations; -- просмотрите базовую таблицу. Появилась новая запись?




-- создать материализованное представление
CREATE MATERIALIZED VIEW con_age AS
SELECT
CONCAT(first_name, ' ', last_name) as person, -- объедините имя и фамилию в одну колонку
DATEDIFF(date_of_birth) as age_of_person, --рассчитайте возраст человека
now() - observ_date as time_since_observ, --рассчитайте время, прошедшее с момнента наблюдения (observ_date)
con_name,
number_of_stars, star_name, selestial_hemisphere
FROM stargazers s
INNER JOIN constellations c --объедините с таблицей, выбрав общие записи
USING (con_id)
INNER JOIN stars
USING (con_id) -- объедините по столбцу con_id
WITH NO DATA; -- уточните, что данные в представление еще не внесены

REFRESH MATERIALIZED VIEW con_age; -- обновите материализованное представление, данные загрузятся автоматически

SELECT * FROM con_age; -- выберите все из созданного материализованного представления

-- создайте представление с ограничением
-- создаем представление с фильтром  - площадь созвездия больше 500,
CREATE VIEW con_large AS
  SELECT
  con_id,
  con_name,
	con_area, number_of_stars
FROM
	constellations
WHERE
	con_area > 500;

CREATE -- создаем представление из первого с доп.фильтром - number_of_stars > 30
OR REPLACE VIEW con_large_starry AS SELECT
con_id,
con_name,
con_area, number_of_stars
FROM
	con_large
WHERE
	number_of_stars > 30
WITH CASCADED CHECK OPTION;

-- пробуем внести новые данные во второе мат. представление
INSERT INTO con_large_starry (con_id, con_name, con_area, number_of_stars)
VALUES
	(19, 'Cassiopeia', 598, 51);

-- еще пробуем внести новые данные во второе мат. представление
  INSERT INTO con_large_starry (con_id, con_name, con_area, number_of_stars) -- выдает ошибку? Почему?
  VALUES
  (20, 'Monoceros', 482, 36);