SELECT CONCAT(name, '(', SUBSTR(occupation, 1, 1), ')')
FROM occupations
ORDER BY name ASC;

SELECT CONCAT("There are a total of ", count(occupation), " ", LOWER(occupation), "s.") as total
FROM occupations
GROUP BY occupation
ORDER BY total ASC;
