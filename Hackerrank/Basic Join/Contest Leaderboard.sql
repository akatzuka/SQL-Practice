/*
Hackers: hacker_id, name
Submissions: submission_id, hacker_id, challenge_id, score

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.
*/

SELECT h.hacker_id, name, SUM(score) as total_score
FROM hackers as h
INNER JOIN (SELECT hacker_id, max(score) AS score FROM submissions
                   GROUP BY challenge_id, hacker_id) max_score
ON h.hacker_id = max_score.hacker_id
GROUP BY h.hacker_id, name
HAVING total_score > 0
ORDER BY total_score DESC, h.hacker_id ASC;
