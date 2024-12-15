-- Сортировка строк по полю `pub_id` в возрастающем порядке
select pub_id, type from titles order by pub_id
-- Сортировка строк сначала по `pub_id` в порядке возрастания, затем по `type` в порядке убывания
select pub_id, type from titles order by pub_id, type desc
-- Сортировка строк по 1-му столбцу (`pub_id`) в порядке возрастания, по 2-му (`type`) в порядке убывания
select pub_id, type from titles order by 1, 2 desc
-- Сортировка строк сначала по второму столбцу (`type`), затем по первому (`title`) в порядке возрастания
select title, type from titles order by 2, 1
-- Сортировка строк сначала по второму столбцу (`type`), затем по первому (`title`) в порядке убывания
select title, type from titles order by 2, 1 desc
-- Упорядочивание строк с учетом русского алфавита
select au_fname from authors order by au_fname
-- Сортировка строк, отобранных по критерию `State like 'РФ'`, в порядке убывания по `au_fname`
select au_fname from authors where State like 'РФ' order by au_fname desc
-- Упорядочивание фамилий авторов по алфавиту
select au_lname from authors where State like 'РФ' order by au_lname
-- Проверка учета регистра символов при сортировке
select au_fname from authors order by au_fname
-- Если не указан COLLATION, регистр влияет. Например, "A" < "a".
