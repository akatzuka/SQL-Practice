/*
Hacker: hacker_id, name
Difficulty: difficulty_level, score
Challenges: challenge_id, hacker_id, difficulty_level
Submissions: submission_id, hacker_id, challenge_id, score

Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id
*/

SELECT h.hacker_id, h.name
FROM submissions as s
INNER JOIN challenges as c
ON s.challenge_id = c.challenge_id
INNER JOIN difficulty as d
ON c.difficulty_level = d.difficulty_level
INNER JOIN hackers as h
ON s.hacker_id = h.hacker_id
WHERE s.score = d.score AND c.difficulty_level = d.difficulty_level
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC;
