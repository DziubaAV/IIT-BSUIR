--Исполните данный код. Просмотрите текст ошибки.
do
$$
declare
	rec record;
	begin
		select star_id, star_name  -- select a star
		into strict rec
		from stars
		where star_name LIKE '%a';
	end;
$$
language plpgsql;

--Добавьте в код exeption-блок с новым текстом текстом
do
$$
declare
	rec record;
	begin
		select star_id, star_name  -- select a star
		into strict rec
		from stars
		where star_name like '%a';
			exception  -- catch exception
				when too_many_rows then
				raise exception 'Search query returns too many rows';
	end;
$$
language plpgsql;

-- Дополните код несколькими условиями, когда могут возникнуть разные ошибки
do
$$
declare
	rec record;
	v_con_area int = 1230;
	begin
		select con_id, con_name  	-- select a constellation
		into strict rec
	    from constellations
		where  con_area = v_con_area;
		exception   -- catch exception
		   when sqlstate 'P0002' then
			  raise exception 'Constellation with area % is not found', v_con_area;
		   when too_many_rows then
			  raise exception 'The constellation with area % is not unique', v_con_area;
	end;
$$
language plpgsql;

-- Разные типы ошибок
do
$$
declare
	rec record;
	begin
	select con_id, con_name  	-- select a constellation
	into strict rec
	from constellations
	where con_area > 1000;
	exception   -- catch exception
		when sqlstate 'P0002' then
	    	raise exception 'Constellation with area is not found';
		when too_many_rows then
	    	raise exception 'The constellation with area is not unique';
end;
$$
language plpgsql;

-- Курсоры. Объявите курсор (в рамках транзакции)
BEGIN;
declare test_cur CURSOR WITH HOLD for SELECT * FROM stars;
COMMIT;

--Откройте курсор, добавьте устовие star_id = 1
open test_cur for select * from stars where star_id = 1;

--просмторите результат
fetch 1 from test_cur;

-- закройте курсор
close test_cur;

-- Откройте курсор в рамках функции. Функция показывает названия звезд, в качестве аргумента - название созвездия;
-- курсор собирает значения для star_name, constellation, distance, spectral_type
create or replace function get_stars_names(con varchar(30))
   returns text as $$
declare
	 stars_names text default '';
	 rec_stars   record;
	 cur_stars cursor(con varchar(30)) -- объявите курсор
		 for select star_name, constellation
		 from stars
		 where constellation = con;
begin
   open cur_stars(con);
   loop
      fetch cur_stars into rec_stars; --извлеките результаты с помощью курсора
      exit when not found;
      stars_names := stars_names || ',' || rec_stars.star_name || ':' || rec_stars.constellation; -- задайте переменную,которую вернет функция
	end loop;
    close cur_stars; -- закройте курсор
	return stars_names; --верните переменную
end; $$
language plpgsql;

select get_stars_names('Orion'); --задайте созвездие из таблицы stars

--Транзакции
begin; -- начните транзакцию
INSERT INTO clients(name, balance)  --добавить ряд в таблицу clients
VALUES('Fred',1000);
commit; -- принять изменения

SELECT * FROM clients;

--Выполните транзакцию - переведите 300 со счета Fred на счет Jane
BEGIN;
UPDATE clients
SET balance = balance - 300
WHERE name = 'Fred';

UPDATE clients
SET balance = balance + 300
WHERE name = 'Jane';

SELECT id, name, balance -- просмотрите результат
FROM clients;
COMMIT; -- commit the transaction

--Откатите транзакцию по переводу 100 со счета Kira на  счет Alice
BEGIN;
UPDATE clients
SET balance = balance - 100
WHERE name = 'Kira';

UPDATE clients
SET balance = balance + 100
WHERE name = 'Alice';
ROLLBACK; -- откат транзакции

SELECT * FROM clients; -- просмотрите таблицу, произошел ли перевод?

-- Точка сохранения в транзакции. Начните транзакцию - снимите 200 со счета Alice, сохраните транзакцию.
-- Пополните счет Kira на 200, откатите транзакцию до точки сохранения.
BEGIN;
UPDATE clients SET balance = balance - 200
    WHERE name = 'Alice';
SAVEPOINT my_savepoint;
UPDATE clients SET balance = balance + 200
    WHERE name = 'Kira';
ROLLBACK TO my_savepoint;

--Пополните счет Jane на 200.
UPDATE clients SET balance = balance + 200
    WHERE name = 'Jane';
END; --завершите транзакцию
--Просмотрите результаты.
SELECT id, name, balance -- select the data from accounts
FROM clients;

-- Объединение таблиц
-- SELF-JOIN
--создайте таблицу
-- DROP TABLE employee;
CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	manager_id INT,
	FOREIGN KEY (manager_id)
	REFERENCES employee (employee_id)
	ON DELETE CASCADE
);

-- Добавьте значения в таблицу
insert into employee (
	employee_id,
	first_name,
	last_name,
	manager_id
)
VALUES
	(1, 'Windy', 'Hays', NULL),
	(2, 'Ava', 'Christensen', 1),
	(3, 'Hassan', 'Conner', 1),
	(4, 'Anna', 'Reeves', 2),
	(5, 'Sau', 'Norman', 2),
	(6, 'Kelsie', 'Hays', 3),
	(7, 'Tory', 'Goff', 3),
	(8, 'Salley', 'Lester', 3);

-- Объедините таблицу саму с собой, чтобы посмотреть, какому работнику соответствует менеджер
select
    e.first_name || ' ' || e.last_name employee,
    m .first_name || ' ' || m .last_name manager
FROM
    employee e
INNER JOIN employee m on m.employee_id = e.manager_id
ORDER BY manager;

--Объедините таблицы stars и stargazers так, чтобы каждому названию звезды соответствовало last_name звездочета
select star_name, last_name
from stars
inner join stargazers;
