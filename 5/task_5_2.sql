SELECT
    t.title AS book_title,
    COUNT(ta.au_id) AS author_count
FROM titles t
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
GROUP BY t.title;
