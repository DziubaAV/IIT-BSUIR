'''Порядок выполнения запроса '''
SELECT COUNT(*) FROM stars
WHERE con_id = 8;

'''Explain'''
EXPLAIN
SELECT *
FROM stars;
'''WHERE условие'''
EXPLAIN
SELECT * FROM stars WHERE star_name IN ('Betelgeuse','Arctur', 'Mira'); -- Where clause

'''create index'''
CREATE INDEX idx_name -- создать индекс
ON stars (star_name);

DROP INDEX idx_name -- удалить индекс

''' Explain witn indexes'''
EXPLAIN
SELECT * FROM stars WHERE star_name IN ('Betelgeuse','Arctur', 'Mira'); -- using index

'''ANALYZE and VERBOSE'''
EXPLAIN ANALYZE
SELECT * FROM constellations;

EXPLAIN VERBOSE
SELECT * FROM constellations;

EXPLAIN ANALYZE -- расчетное и реальное время выполнения запроса
SELECT selestial_hemisphere, AVG(distance) AS avg_dist
FROM stars
GROUP BY selestial_hemisphere; -- aggregate

EXPLAIN ANALYZE
SELECT selestial_hemisphere, star_name
FROM stars
ORDER BY star_name; --sort

EXPLAIN ANALYZE -- расчетное и реальное время выполнения запроса
SELECT selestial_hemisphere, star_name, con_name
FROM stars
INNER JOIN constellations ON stars.con_id = constellations.con_id; -- join

-- subqueries
SELECT COUNT(star_id)
FROM stars
WHERE con_id IN
(SELECT con_id FROM constellations
WHERE con_area > 500);



-- join
SELECT COUNT(star_id)
FROM stars s
INNER JOIN constellations c
ON s.con_id = c.con_id
AND con_area > 500;

-- CTE
WITH area AS
(
SELECT con_id
FROM constellations
WHERE con_area > 500
)
SELECT count(star_id)
FROM stars s
INNER JOIN area a
ON s.con_id = a.con_id
;



-- TEMP TABLE
CREATE TEMPORARY TABLE area AS
SELECT con_id
FROM constellations
WHERE con_area > 500;
SELECT count(star_id)
FROM stars s
INNER JOIN area a
ON s.con_id = a.con_id

-- аггрегирующие функции без группировки- ошибка:
SELECT star_name, constellation, COUNT(*)
FROM stars
WHERE con_id = 8;



-- аггрегирующие функции и группировка
SELECT star_name, constellation, COUNT(*)
FROM stars
WHERE con_id = 8
GROUP BY star_name, constellation;




'''Filtering with LIKE...OR'''
EXPLAIN ANALYZE
SELECT * FROM stars
WHERE spectral_type LIKE 'F%' OR spectral_type LIKE 'G%'




'''Filtering with ANY(ARRAY[...])'''
EXPLAIN ANALYZE
SELECT * FROM stars
WHERE spectral_type LIKE ANY(ARRAY['F%', 'G%']);



-- Создайте таблицу звездочеты, укажите тип данных
CREARE TABLE звездочеты(
имя VARCHAR(30),
дата_наблюдения DATE,
созвездие_id SMALLINT []
);

INSERT INTO -- внесите значения в таблицу
  звездочеты(имя, дата_наблюдения, созвездие_id)
VALUES
  ('Анна', '2022-01-25', ARRAY[1, 11, 12, 13]),
  ('Ольга', '2021-03-25', ARRAY[3, 6, 1]),
  ('Дмитрий', '2021-09-03', ARRAY[5, 9, 7, 2]),
  ('Константин', '2019-12-05', ARRAY[1, 4, 8, 17]),
  ('Мила', '2022-06-20', ARRAY[4, 10, 8, 16]);

SELECT * FROM звездочеты; -- выберите все из таблицы звездочеты


SELECT
имя,
unnest(созвездие_id) -- "распаковываем" массив в список
FROM звездочеты;

SELECT
имя,
созвездие_id[1] -- выбираем порядковый номер из массива
FROM звездочеты;


-- Сравним скорость выполнения запросов в зависимости от формулировки и типм данных:
'''Filtering with OR''' -- фильтрация символьного (текстового) типа данных
EXPLAIN ANALYZE
SELECT * FROM stars
WHERE constellation = 'Orion' OR constellation = 'Cetus'


'''Filtering with IN''' -- фильтрация символьного (текстового) типа данных
EXPLAIN ANALYZE
SELECT * FROM stars
WHERE constellation IN('Orion', 'Cetus');


'''Filtering with OR''' -- фильтрация числового типа данных
EXPLAIN ANALYZE
SELECT * FROM stars
WHERE con_id = 6 OR con_id = 16



'''Filtering with IN''' -- фильтрация числового типа данных
EXPLAIN ANALYZE
SELECT * FROM stars
WHERE con_id IN(6, 16);


-- Временные таблицы
-- Сперва создаем родительскую таблицу из которой потом выберем часть данных в дочернюю
-- Создайте таблицу constellations, укажите тип данных, где это необходимо
CREATE TABLE созвездия (
  con_id SERIAL NOT NULL PRIMARY KEY,
  con_name VARCHAR(20),
  con_area SMALLINT,
  bel_con_name VARCHAR(30),
  ru_con_name VARCHAR(30),
  num_stars1 SMALLINT, -- количество звезд, яркостью 2.4–4.4
  num_stars2 SMALLINT,      -- количество звезд, яркостью 4.4–5.5
  date_observed DATE
);

-- Добавьте значения в таблицу constellations
INSERT INTO созвездия
  (con_id, con_name, con_area, bel_con_name, ru_con_name, num_stars1, num_stars2, date_observed)
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

-- Множественное преобразование данных
CREATE TEMP TABLE names AS -- создаем временную таблицу
SELECT bel_con_name AS messy1, ru_con_name AS messy2, -- оригинальные значения с лишними пробелами
bel_con_name AS bel_con, ru_con_name AS ru_con -- новые колонки для исправленных значений
FROM созвездия;

UPDATE names -- изменяем данные
SET bel_con=trim(initcap(messy1)), -- удаляем пробелы, меняем регистр
ru_con=trim(initcap(messy2));

SELECT * FROM names; -- проверяем, что получилось

SELECT bel_con, ru_con, con_area -- объединяем две таблицы (временную с исправленными значениями и оригинальную)
FROM names
LEFT JOIN созвездия
ON bel_con_name = messy1 AND ru_con_name = messy2;