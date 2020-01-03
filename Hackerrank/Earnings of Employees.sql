SELECT  (salary * months) AS earning, COUNT(*)
FROM employee
GROUP BY 1
ORDER BY earning DESC
LIMIT 1;
