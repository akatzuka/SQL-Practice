SELECT name
FROM students
WHERE marks > 75
ORDER BY SUBSTR(name, char_length(name)-2, 3), ID ASC;

--Alternative Solution by using RIGHT
--ORDER BY RIGHT(name, 3), ID ASC;
