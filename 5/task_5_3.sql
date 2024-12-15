SELECT
    t.title AS book_title,
    CONCAT(a.au_fname, ' ', a.au_lname) AS top_author
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
WHERE ta.royaltyper = (
    SELECT MAX(ta2.royaltyper)
    FROM titleauthor ta2
    WHERE ta2.title_id = t.title_id
);
