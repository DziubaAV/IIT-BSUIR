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
  name VARCHAR(30) NOT NULL,
  constellation VARCHAR(30),
  con_id SMALLINT,
  distance SMALLINT,
  absolute_magnitude FLOAT,
  spectral_type VARCHAR(30),
  selestial_hemisphere VARCHAR(10),
  parallax INTEGER
);
-- Внесите в созданную таблицу следующие данные:
INSERT INTO
  stars (name, constellation, con_id, distance, absolute_magnitude, spectral_type,
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


-- Переименуйте столбец name в star_name
ALTER TABLE stars
RENAME COLUMN name TO star_name;



-- Создайте таблицу constellations, укажите тип данных, где это необходимо
CREATE TABLE constellations (
  con_id SERIAL NOT NULL PRIMARY KEY,
  con_name VARCHAR(20),
  con_area SMALLINT,
  bel_con_name VARCHAR(30),
  ru_con_name VARCHAR(30),
  num_stars1 SMALLINT, -- количество звезд, яркостью 2.4–4.4
  num_stars2 SMALLINT,      -- количество звезд, яркостью 4.4–5.5
  date_observed TEXT
);

-- Добавьте значения в таблицу constellations
INSERT INTO
  constellations (con_id, con_name, con_area, bel_con_name, ru_con_name, num_stars1, num_stars2, date_observed)
VALUES
(1, 'Canis Major', 380, 'Вялікі Пёс', 'Большой Пес', 13, 38, '2022-01-25'),
(2, 'Carina', 494, 'Кіль', 'Киль', 20, 53, '2022-01-30'),
(3, 'Bootes', 907, 'Валапас ', 'Волопас', 12, 39, '2022-02-10'),
(4, 'Lyra', 286, 'Ліра', ' Лира ', 8, 17, '2022-3-15'),
(5, 'Auriga', 657, 'Вознік', 'Возничий', 9, 36, '2022-03-18'),
(6,'Orion', 594, ' Арыён', 'орион', 19, 51, '2022-03-21'),
(7, 'Centaurus', 1060, 'Цэнтаўр', 'Кентавр', 31, 64, '2022-04-02'),
(8, 'Crux', 68, 'Паўднёвый Крыж', 'Южный крест', 6, 11, '2022-05-13'),
(9, 'Cygnus', 804, 'Лебедзь ', 'лебедь', 20, 56, '2022-06-23'),
(10, 'Gemini', 514, 'Блізняты', 'Близнецы ', 16, 28, '2022-07-10'),
(11, 'Ursa Major', 1280, 'Вялікая Мядзведзіца', 'Большая медведица', 14, 51, '2022-08-25'),
(12, 'Ursa Minor', 256, 'Малая Мядзведзіца', 'Малая медведица ', 5, 11, '2022-09-03'),
(13, 'Andromeda', 722, 'Андрамеда ', 'Андромеда', 14, 37, '2022-10-11'),
(16, 'Cetus', 1231, 'Кіт', 'Кит ', 14, 43, '2022-11-27'),
(17, 'Perseus', 615, 'Персей', 'персей', 22, 42, '2022-12-25');

-- Измените тип данных для колонки date_observed с текстового на дату
ALTER TABLE constellations
ALTER COLUMN date_observed TYPE DATE
USING date_observed::DATE;

 -- Измените таблицу constellations, добавьте колонку number_of_stars
ALTER TABLE constellations
ALTER COLUMN number_of_stars SMALLINT; -- количество зведд в полном созвездии

UPDATE constellations
SET number_of_stars = 56
WHERE con_id = 1;

UPDATE constellations
SET number_of_stars = 77
WHERE con_id = 2;

UPDATE constellations
SET number_of_stars = 53
WHERE con_id = 3;

UPDATE constellations
SET number_of_stars = 26
WHERE con_id = 4;

UPDATE constellations
SET number_of_stars = 47
WHERE con_id = 5;

UPDATE constellations
SET number_of_stars = 77
WHERE con_id = 6;

UPDATE constellations
SET number_of_stars = 101
WHERE con_id = 7;

UPDATE constellations
SET number_of_stars = 20
WHERE con_id = 8;

UPDATE constellations
SET number_of_stars = 79
WHERE con_id = 9;

UPDATE constellations
SET number_of_stars = 47
WHERE con_id = 10;

UPDATE constellations
SET number_of_stars = 71
WHERE con_id = 11;

UPDATE constellations
SET number_of_stars = 18
WHERE con_id = 12;

UPDATE constellations
SET number_of_stars = 54
WHERE con_id = 13;

UPDATE constellations
SET number_of_stars = 58
WHERE con_id = 16;

UPDATE constellations
SET number_of_stars = 65
WHERE con_id = 17;

-- Удалите лишние пробелы в названиях созвездий и примените фомат - заглавная первая буква
--слова- к названиям созвездий
UPDATE constellations -- изменяем данные
SET bel_con_name=trim(initcap(bel_con_name)), -- удаляем пробелы, меняем регистр
ru_con_name=trim(initcap(ru_con_name));

SELECT * FROM constellations;
-- Создайте таблицу stargazers, укажите тип данных
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
  ('Anatoly', 'Black', '2022-06-20', 16, '2006-10-15');

  UPDATE stargazers
  SET first_name = CONCAT (first_name, ' ', last_name); -- объедините имя и фамилию в один столбец
  --с разделителем пробел.

SELECT * FROM stargazers;

ALTER TABLE stargazers -- удалите колонку last_name
DROP COLUMN last_name;


INSERT INTO -- добавьте значения
  stargazers(first_name, observ_date, con_id, date_of_birth)
VALUES
    ('Mats Berg', '2022-03-25', 1, '1973-06-06'),
    ('Alex Larsson', '2022-09-15', 9, '1991-07-24'),
    ('Julia Watson', '2009-01-13', 1, '1982-11-12'),
    ('Linda Hatson', '2011-06-11', 8, '2002-05-08');


  ''' SELECT IN''' -- название созвездия находится в списке
SELECT * FROM stars
WHERE constellation IN ('Orion', 'Lyra', 'Cygnus');


'''BETWEEN''' -- расстояние находится в диапазоне значений
SELECT * FROM stars
WHERE distance BETWEEN 50 AND 500
ORDER BY distance;

'''IS NULL''' -- название созвездия равно NULL
SELECT * FROM stars
WHERE constellation IS NULL;

SELECT * FROM stars -- название созвездия не равно NULL
WHERE constellation IS NOT NULL;

SELECT MIN(con_area) -- выберите минимальную площадь созвездия
FROM constellations;

SELECT MAX(con_area) -- выберите максимальную площадь созвездия
FROM constellations;

SELECT AVG(con_area) -- выберите среднюю площадь созвездия
FROM constellations;

SELECT COUNT(constellation) FROM stars; -- посчитайте количество созвездий в таблице stars.

SELECT COUNT(DISTINCT constellation) FROM stars; --посчитайте количество неповторяющихся созвездий

SELECT DISTINCT constellation, COUNT(star_id) FROM stars -- посчитайте количество звезд в созвездии
GROUP BY constellation;

-- Выберите созвездия, количество звезд в которых больше 1
SELECT constellation, COUNT(star_id) AS nuber_of_stars
FROM stars
GROUP BY constellation
HAVING nuber_of_stars > 1;

'''Объединение таблиц, запросы'''
-- Какие созвездия наблюдали любители звезд?
SELECT first_name, observ_date, con_name
FROM stargazers s
LEFT JOIN constellations c
ON s.con_id = c.con_id;

-- Какие созвездия наблюдали любители звезд в сентябре?
SELECT first_name, observ_date, con_name
FROM stargazers s
LEFT JOIN constellations c
ON s.con_id = c.con_id
WHERE EXTRACT(MONTH FROM observ_date) = 09;

-- Как давно любители звезд проводили наблюдения?
SELECT first_name, con_name,
now() - observ_date as diff -- временной интервал от текущей даты до даты в таблице
FROM stargazers s
LEFT JOIN constellations c
ON s.con_id = c.con_id;

-- Сколько лет любителям звезд?
SELECT first_name, datediff(date_of_birth)
FROM stargazers;

-- Кто из любителей звезд родился в марте?
SELECT first_name
FROM stargazers
WHERE EXTRACT(MONTH FROM date_of_birth) = 03;

-- Какие звезды видели наблюдатели?
SELECT first_name, star_name
FROM stargazers
INNER JOIN stars
ON stargazers.con_id = stars.con_id

-- Сколько созвездий наблюдали любители в период с 2022-01-31 по 2022-06-30 с интервалом в 1 месяц?
WITH bins AS (
SELECT generate_series('2022-01-31', '2022-05-31', '1 month'::interval) AS lower,
	  generate_series('2022-02-28', '2022-06-30', '1 month'::interval) AS upper)
SELECT lower, upper, count(observ_date)
FROM bins
LEFT JOIN stargazers
ON observ_date >= lower
AND observ_date < upper
GROUP BY lower, upper
ORDER BY lower;


-- Какой временной интервал между наблюдениями, сделанными любителями звезд?
SELECT observ_date,
observ_date - lag(observ_date)
OVER (ORDER BY observ_date) AS gap
FROM stargazers;


-- Какие звезды расположены дальше, чем среднее расстояние до звед?
SELECT star_name FROM stars
WHERE distance > (SELECT AVG(distance) FROM stars);

-- Какой процент созвездий с количеством звезд больше 30 и удаленных более чем на 300 световых лет
--в северном и южном полушариях?
SELECT selestial_hemisphere,
ROUND(AVG(CASE WHEN number_of_stars > 30 AND distance > 300 THEN 1
WHEN number_of_stars > 30 AND distance < 300 THEN 0
END),2) AS pct_starry_constel
FROM stars s
INNER JOIN constellations c
ON s.con_id = c.con_id
GROUP BY selestial_hemisphere;


-- Когда, сколько звезд по сравнению со средним количеством увиденных звезд, в каких созвездиях
-- какие звезды наблюдали любители звезд?
-- SELECT
-- date_observed AS date,
-- SUM(num_stars1, num_stars2) AS number_stars_visible,
-- AVG(number_of_stars) OVER() AS overall_number,
-- con_name, ..., ...
-- FROM constellations c
-- LEFT JOIN stargazers s
-- ON c.con_id = s.con_id
-- LEFT JOIN stars
-- ON c.con_id = stars.con_id
-- GROUP BY date, number_of_stars, con_name, first_name, star_name, con_area
-- ORDER BY date; 
-- КОД НЕ РАБОТАЕТ 

-- ЗАМЕНА КОДА
SELECT
  date_observed AS date,
  num_stars1 + num_stars2 AS number_stars_visible,
  AVG(number_of_stars) OVER() AS overall_number,
  con_name, number_of_stars, con_name, first_name, star_name, con_area
FROM constellations c
LEFT JOIN stargazers s
  ON c.con_id = s.con_id
LEFT JOIN stars
  ON c.con_id = stars.con_id
--GROUP BY date, number_of_stars, con_name, first_name, star_name, con_area
ORDER BY date;


-- Выберите кто, какие звезды (их название, название созвездий,
-- расстояние по сравнению со средним расстоянием до созвездия) наблюдал;
-- разделите по имени наблюдателя (first_name) и con_id.
SELECT
  first_name,
  s.star_name,
  c.con_name,
  s.distance,
  AVG(s.distance) OVER(ORDER BY first_name, c.con_id) AS stargazer_distance_avg
FROM constellations AS c
INNER JOIN stargazers
  ON c.con_id = stargazers.con_id
INNER JOIN stars AS s
  ON c.con_id = s.con_id
GROUP BY c.con_name, s.distance, first_name, c.con_id, star_name;



-- Отнесите звезды по спектральным типам к группам по цвету
SELECT star_name,
CASE WHEN spectral_type LIKE 'O%' OR spectral_type LIKE 'B%' THEN 'Blue'
WHEN spectral_type LIKE 'A%' THEN 'White'
WHEN spectral_type LIKE 'F%' OR spectral_type LIKE 'G%' THEN 'Yellow'
WHEN spectral_type LIKE 'K%' THEN 'Orange'
WHEN spectral_type LIKE 'M%' THEN 'Red'
END AS color
FROM stars;

!!!!!!!!!!!!!!
-- Рассчитайте параллакс звезд используя CTE (common table expressions)
WITH parsec AS (
SELECT star_name, parallax, distance * 0.306601 AS d
FROM stars)
SELECT
star_name, parallax, ROUND(1 / ...(d, 0) * 1000, 2) AS parallax_estimated
FROM parsec;