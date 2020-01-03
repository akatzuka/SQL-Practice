SELECT ROUND(LAT_N, 4)
FROM station
WHERE LAT_N = (SELECT MIN(LAT_N) FROM station WHERE LAT_N > 38.7780);
