SELECT
    s.ord_num AS order_number,
    s.ord_date AS order_date,
    s.qty AS quantity,
    t.title AS book_title
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE a.au_fname = 'Stringer' AND a.au_lname = 'Dirk'
ORDER BY s.ord_date ASC;
