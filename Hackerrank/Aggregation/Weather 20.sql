SELECT ROUND(S.LAT_N , 4)
FROM station S
WHERE
    (SELECT COUNT(LAT_N)
    FROM station
    WHERE LAT_N < S.LAT_N) =
    (SELECT COUNT(LAT_N)
    FROM station
    WHERE LAT_N > S.LAT_N)
;
