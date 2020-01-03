SELECT DISTINCT city
FROM station
WHERE LOWER (SUBSTR(city, 1, 1)) in ('a','e','i','o','u')
AND LOWER (SUBSTR(city, char_length(city), 1)) in ('a','e','i','o','u');
