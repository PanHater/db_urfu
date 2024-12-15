-- Выбор авторов с royaltyper < 50
select name = au_lname, au_fname from authors where au_id in
(select au_id from titleauthor where royaltyper < 50)

-- Выбор авторов с royaltyper >= 50
select name = au_lname, au_fname from authors where au_id not in
(select au_id from titleauthor where royaltyper < 50)

-- Подсчет количества записей в таблице
select count(*) from titles
select count(*) from titles where advance is not null
select count(*) from titles where advance > 0 or advance < 0
-- Различия: NULL-значения игнорируются в условиях сравнения.

-- Поиск книг с ценой, равной цене книги, содержащей слово 'Talk'
select title, price from titles where price =
(select price from titles where charindex('Talk', title) > 0)

-- Использование LIKE вместо CHARINDEX
select title, price from titles where price =
(select price from titles where title like '%Talk%')

-- Авторы из Калифорнии с royaltyper < 30 и au_ord = 2
select au_lname, au_fname from authors where state = 'CA' and
au_id in (select au_id from titleauthor where royaltyper < 30 and au_ord = 2)

-- Авторы, писавшие для popular_comp
select au_lname, au_fname from authors where au_id in
(select au_id from titleauthor where title_id in
(select title_id from titles where type = 'popular_comp'))
order by au_lname, au_fname

-- Эквивалентный запрос с внутренним соединением
select distinct au_lname, au_fname from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titles.title_id = titleauthor.title_id
where type = 'popular_comp'
order by au_lname, au_fname
