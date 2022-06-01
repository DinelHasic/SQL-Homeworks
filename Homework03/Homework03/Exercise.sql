
select * from Student
select * from Course
select * from Teacher
select * from AchievementType
select * from Grade
select * from GradeDetails

--------------------Homework 3---------------------

------Calculate the count of all grades per Teacher in the system------
SELECT Teacher.ID,Teacher.FirstName, COUNT(Grade) AS [Total Grades] FROM Grade
JOIN Teacher ON TeacherID = Teacher.ID
GROUP BY  Teacher.ID,Teacher.FirstName
ORDER BY ID


----Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)-----
SELECT Teacher.ID,Teacher.FirstName, COUNT(Grade) AS [Total Grades] FROM Grade
JOIN Teacher ON TeacherID = Teacher.ID
WHERE StudentID < 100
GROUP BY  Teacher.ID,Teacher.FirstName
ORDER BY ID

------ Find the Maximal Grade, and the Average Grade per Student on all grades in the system ------------
SELECT Student.ID,Student.FirstName, MAX(Grade) AS [Max Grade], AVG(Grade) AS [Average Grade] FROM Grade
JOIN Student ON Student.ID = Grade.StudentID
GROUP BY  Student.ID,Student.FirstName

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT Teacher.ID,Teacher.FirstName, COUNT(Grade) AS [Total Grades] FROM Grade
JOIN Teacher ON TeacherID = Teacher.ID
GROUP BY  Teacher.ID,Teacher.FirstName
HAVING  COUNT(Grade) > 200
ORDER BY ID;

---Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade----

SELECT Student.ID,Student.FirstName,COUNT(Grade) AS [Total Grades], MAX(Grade) AS [Max Grade], AVG(Grade) AS [Average Grade] FROM Grade
JOIN Student ON Student.ID = Grade.StudentID
GROUP BY  Student.ID,Student.FirstName
HAVING MAX(Grade) = AVG(Grade)




----- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student----------
CREATE OR ALTER VIEW vv_StudentGrades AS
SELECT Student.ID, COUNT(Grade) AS [Total Grades] FROM [dbo].Grade
JOIN [dbo].Student ON Grade.StudentID= Student.ID
GROUP BY Student.ID


SELECT * FROM  [dbo].vv_StudentGrades;


---Change the view to show Student First and Last Names instead of StudentID---

CREATE OR ALTER VIEW vv_StudentGrades AS
SELECT Student.FirstName,Student.LastName, COUNT(Grade) AS [Total Grades] FROM [dbo].Grade
JOIN [dbo].Student ON Grade.StudentID= Student.ID
GROUP BY Student.FirstName,Student.LastName

SELECT * FROM  [dbo].vv_StudentGrades;

-- List all rows from view ordered by biggest Grade Count ---

SELECT * FROM  vv_StudentGrades  
ORDER BY [Total Grades] DESC
