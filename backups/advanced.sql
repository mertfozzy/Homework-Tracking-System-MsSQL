--1- ordering according to names
SELECT member_id, username, lastname FROM member ORDER BY username ASC

--2- left join from member lecture table (member id values)
SELECT member.member_id, member.username, member.lastname FROM member LEFT JOIN member_lecture ON member_lecture.member_id = member.member_id

--3- full join to see member's messaging status. NULLs are not using message (nothing send or receive)
SELECT * FROM member FULL OUTER JOIN member_messages ON member_messages.member_id = member.member_id

--4- full join to see which lecture have no students
SELECT * FROM lectures FULL OUTER JOIN member_lecture ON member_lecture.lecture_id = lectures.lecture_id 

--5- right join to see which lecture have no documents (-or resources)
SELECT * FROM document RIGHT JOIN lectures ON lectures.lecture_id = document.lecture_id

--6- ordering the student names which are going to 3th or 4th level Engineering classess. (level + faculty filter)
SELECT * FROM member WHERE level_id>2 AND faculty_id=1 ORDER BY lastname, username

--7- ordering students according to their birthdays
SELECT member_id, username, lastname, date_of_birth FROM member ORDER BY date_of_birth desc

--8- grouping currently students according to their faculties (how many students continues in which faculty?)
SELECT faculty_id, COUNT(*) AS 'Number of Currently Students' FROM member WHERE level_id<5 GROUP BY faculty_id

--9- full join to see which types of documents are not available
SELECT * FROM document FULL OUTER JOIN document_type ON document_type.type_no = document.type_no

--10 right join to see the list of departments with the faculty names together
SELECT * FROM department RIGHT JOIN member_faculty ON member_faculty.faculty_id = department.faculty_id

--11 grouping faculties, according to students who come from İstanbul
SELECT faculty_id, COUNT(*) AS 'Number of Students who from İstanbul' FROM member WHERE city like 'İ%' GROUP BY faculty_id

--12 join to see student's scores (id and score come from different tables) 
SELECT member.member_id, score FROM member_document JOIN member ON member.member_id = member_document.member_id

--13 intersect 2 different tables (member_document & member_lecture)
SELECT member_id FROM member_document INTERSECT select member_id from member_lecture ORDER BY member_id

--14 grouping and ordering students according to their city
SELECT COUNT(member_id) as 'Number of students', city FROM member GROUP BY city ORDER BY COUNT(member_id) DESC

--15 joining 2 tables and grouping with lecture_id to see "how many students taking which lecture?"
SELECT member_lecture.lecture_id, COUNT(member_id) AS 'Number of Current Students' FROM member_lecture JOIN lectures ON member_lecture.lecture_id=lectures.lecture_id  GROUP BY member_lecture.lecture_id 

--16 left join to find, are there any messaging activity for a document
SELECT * FROM member_document LEFT JOIN member_messages ON member_messages.member_id = member_document.member_id

--17 a filter, finds the students who are taking a 1st or 2nd year course 
SELECT member_id from member WHERE member_id IN (select member_id from member_lecture where lecture_id < 130)

--18 datediff function to calculate student's ages from their birthday
SELECT member_id, username, lastname, date_of_birth, DATEDIFF(MONTH, date_of_birth, GETDATE())/12 AS 'Age of Student' from member 

--19 calculate student's ages, just show people whose ages between 20 and 30
SELECT username, lastname, date_of_birth, DATEDIFF(MONTH, date_of_birth, GETDATE())/12 AS 'Age of Student' from member where (DATEDIFF(MONTH, date_of_birth, GETDATE())/12 BETWEEN 20 and 30)

--20 calculates how many days have passed since the message was sent
SELECT message_id, message_date,  DATEDIFF(DAY, message_date, GETDATE()) AS 'Day Passed' from member_messages

--21 finds the passwords which are not contains at least 8 characters
SELECT username, lastname, member_password from member where len(member_password) < 8 

--22 finds the students who passed (higher than 70 scores) and orders by score
SELECT member_document.member_id, score from member_document where score > 70 ORDER BY score

--23 right join to see students who are not messaging about any lecture
SELECT member_messages.member_id, message_id from member_messages RIGHT JOIN member_lecture ON member_lecture.member_id = member_messages.member_id

--24 left join to see levels of students who live in Ümraniye
SELECT username, lastname, adress, member.level_id from member LEFT JOIN member_level ON member_level.level_id = member.level_id where adress like 'Ümraniye'

--25 inner join to see types of documents with their names
SELECT document.type_no, document_id, title from document INNER JOIN document_type ON document_type.type_no = document.type_no ORDER BY type_no

--UPDATES
UPDATE member SET member_password = 'admin123' where member_id = 3226312503
UPDATE document SET title = 'The Great Gatsby' where document_id = 10709
UPDATE lectures SET credit = 5 where lecture_id between 120 and 130
UPDATE document_type SET finish_time = '2022-03-19 21:00:00' where doc_type_name = 'Finance'
UPDATE member SET faculty_id = 3 where phone = 5520639851

--DELETES
DELETE FROM member_messages WHERE message_id = 9717
DELETE FROM document_type WHERE type_no = 174