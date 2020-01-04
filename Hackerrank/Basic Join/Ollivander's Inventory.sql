/*
Wands: id, code, coins_needed, power
Wands_Property: code, age, is_evil

Determine the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
*/

SELECT w.id, p.age, w.coins_needed, w.power
FROM wands as w
INNER JOIN wands_property as p
ON w.code = p.code
WHERE p.is_evil = 0 AND w.coins_needed = (
    SELECT min(coins_needed)
    FROM wands
    JOIN wands_property ON (wands.code = wands_property.code)
    WHERE wands.power = w.power AND wands_property.age = p.age)
ORDER BY w.power DESC, p.age DESC;
