SELECT
    AVG(s.qty) AS avg_quantity,
    MIN(s.qty) AS min_quantity,
    MAX(s.qty) AS max_quantity
FROM sales s
JOIN titles t ON s.title_id = t.title_id
WHERE t.title = 'Secrets of Silicon Valley';
