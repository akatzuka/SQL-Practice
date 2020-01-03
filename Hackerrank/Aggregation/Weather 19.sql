/*Euclidean Distance for 2D is SQRT((Q1-P1)^2 + (Q2-P2)^2)
p = (p1, p2) and q = (q1, q2)
p = a,c
q = b,d
a = min LAT
b = max LAT
c = min LONG
d = max LONG*/

SELECT ROUND(SQRT(POW((MAX(LAT_N) - MIN(LAT_N)), 2) + POW((MAX(LONG_W) - MIN(LONG_W)),2)), 4)
FROM station;
