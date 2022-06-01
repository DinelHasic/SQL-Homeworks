
USE [SEDCACADEMY]
--------- Homework 2---------
---- Find all Students with FirstName = Antonio ---
SELECT * FROM [Student] WHERE FirstName = 'Antonio';




----- Find all Students with DateOfBirth greater than ‘01.01.1999’ ---
SELECT * FROM [Student] WHERE DateOfBirth > '01.01.1999';


----Find all Students with LastName starting With ‘J’ enrolled in January/1998 -----
SELECT * FROM [Student] WHERE LastName LIKE 'J%' AND EnrolledDate >= '01.01.1998' AND EnrolledDate <= '01.31.1998'




---- List all Students ordered by FirstName ------
SELECT * FROM [Student] ORDER BY FirstName;



---- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates ----
(SELECT FirstName FROM [Student])
UNION
(SELECT FirstName FROM [Teacher]);




---- Create Foreign key constraints from diagram or with script-----
alter table  [GradeDetails]
add constraint [FK_GradeID] foreign key([GradeID])
references [Grade]([ID])


-----List all possible combinations of Courses names and AchievementType names that can be passed by student-----
SELECT Course.[Name],AchievementType.[Name] FROM [Course]
CROSS JOIN AchievementType;



----- List all Teachers without exam Grade -----------
SELECT * FROM Teacher
LEFT JOIN [Grade]  ON Grade.TeacherID = Teacher.ID
WHERE Grade.TeacherID IS NULL;


---- Extra Homework --------
USE [SEDC]


---- List all possible combinations of Customer names and Product names that can be ordered from specific customer ----
SELECT Customer.[Name],Product.[Name] FROM [Customer]
CROSS JOIN Product;


--- List all Business Entities that has any order ---
SELECT * FROM BusinessEntity 
JOIN [Order] ON [Order].BusinessEntityId = BusinessEntityId; 

---List all Entities without orders----
SELECT * FROM BusinessEntity 
LEFT JOIN [Order] ON [Order].BusinessEntityId = BusinessEntity.Id
WHERE [Order].BusinessEntityId IS NULL;


----List all Customers without orders (using Right Join and using Left join) ----
SELECT * FROM Customer
FULL JOIN [Order] ON [Order].CustomerId = Customer.Id
WHERE [Order].CustomerId IS NULL;
