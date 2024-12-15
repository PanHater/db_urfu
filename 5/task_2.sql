-- Подсчет общего количества строк и суммы `ytd_sales` по всей таблице
select count(*), total = sum(ytd_sales) from titles
-- Группировка по `pub_id` и подсчет количества строк, суммы `ytd_sales` по каждой группе
select count(*), pub_id, total = sum(ytd_sales) from titles group by pub_id
-- Отбор групп с количеством строк больше 5
select count(*), pub_id, total = sum(ytd_sales) from titles group by pub_id having count(*) > 5
-- Итоговые строки, добавление суммы `price` по каждому типу
select type, price, advance from titles order by type compute sum(price) by type
-- Итоговые строки с расчетом сумм `price` и `advance` по каждому типу
select type, price, advance from titles order by type compute sum(price), sum(advance) by type
-- Итоговые строки с вложенными группировками
select type, pub_id, price from titles where type = 'psychology'
order by type, pub_id, price
compute sum(price) by type, pub_id
compute sum(price) by type
