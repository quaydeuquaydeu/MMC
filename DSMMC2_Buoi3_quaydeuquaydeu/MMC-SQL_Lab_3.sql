USE Testingsystem;

SELECT * FROM department
SELECT DepartmentName FROM department

SELECT DepartmentID FROM department WHERE DepartmentName = 'Sale'

SELECT * FROM `account` 
WHERE LENGTH(FullName) IN (SELECT MAX(LENGTH(FullName)) 
							FROM `account`);

SELECT * FROM `account` 
WHERE LENGTH(FullName) IN (SELECT MAX(LENGTH(FullName)) 
							FROM `account` WHERE DepartmentID = 3);
                            
SELECT * FROM `group` 
WHERE CreateDate < '2019-12-20'

SELECT QuestionID, CategoryID FROM `question` 
WHERE CategoryID >= 4

SELECT Code, Title, Duration FROM `exam` 
WHERE Duration >= 60

SELECT GroupName, CreateDate FROM `group` 
WHERE (SELECT TOP 5 FROM 'group' ORDER BY CreateDate DESC);

SELECT * FROM testingsystem.group ORDER BY CreateDate DESC LIMIT 5;
-- 10
SELECT COUNT(*) FROM testingsystem.account WHERE DepartmentID = 2;
-- 11
SELECT * FROM testingsystem.account WHERE FullName LIKE 'D%o';
-- 12
DELETE FROM testingsystem.exam WHERE CreateDate < '2019-12-20';

-- 13
DELETE FROM testingsystem.question WHERE Content LIKE 'Câu hỏi";

-- 14
UPDATE `account` SET FullName = 'Lô Văn Đề', Email = 'lo.vande@mmc.edu.vn' WHERE AccountID = 5;

-- 15
UPDATE `groupaccount` SET GroupID = 4 WHERE AccountID = 5;

