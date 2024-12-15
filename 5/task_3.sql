-- Объявление переменных и присваивание значений
declare @a int, @b int, @c char(21)
select @b = 4
select @a = 2 * @b
select @c = 'result = ' + convert(char(2), @a)
print @c

-- Вычисление максимальной цены и итоговой суммы продаж
declare @veryhigh money
select @veryhigh = max(price) from titles
if @veryhigh > $20 print 'Ого !'
select @veryhigh = sum(ytd_sales * price) from titles
select @veryhigh as 'Всего продано на сумму'

-- Использование переменных для построения запроса
declare @c varchar(21), @d char(7)
select @c = 'Проживает в ', @d = 'Oakland'
select au_id, Фамилия = au_lname, Имя = au_fname, @c + @d as Штат
from authors where city = @d

-- Использование округления и арифметических операций
declare @pr decimal(7,2), @pr1 int, @pr2 int
select @pr = 1.20, @pr1 = 1.20, @pr2 = 0.80
select ytd_sales, окр = round(@pr * ytd_sales, 1),
       @pr * ytd_sales, @pr1 * ytd_sales, @pr2 * ytd_sales
from titles

-- Запрос с присваиванием всех фамилий в переменную
declare @last_names varchar(max)
select @last_names = string_agg(au_lname, ', ')
from authors
print @last_names
