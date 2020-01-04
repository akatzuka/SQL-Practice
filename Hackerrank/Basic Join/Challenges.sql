/*
Hackers: hacker_id, name
Challenges: challenge_id, hacker_id

Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/

SELECT c.hacker_id, h.name, COUNT(c.challenge_id) as c_count
FROM hackers as h
INNER JOIN challenges as c
ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name
HAVING
    /* Output anyone with a count that is equal to... */
    c_count =
     /* the max count that anyone has */
        (SELECT MAX(temp1.cnt)
         FROM (SELECT COUNT(hacker_id) as cnt
              FROM challenges
              GROUP BY hacker_id
              ORDER BY hacker_id) temp1)
    /* or anyone who's count is in... */
    OR c_count IN
    /* the set of counts... */
        (SELECT t.cnt
        FROM (SELECT COUNT(*) as cnt
             FROM challenges
             GROUP BY hacker_id) t
      /* who's group of counts... */
        GROUP BY t.cnt
     /* has only one element */
        HAVING COUNT(t.cnt) = 1)
ORDER BY c_count DESC, c.hacker_id;
