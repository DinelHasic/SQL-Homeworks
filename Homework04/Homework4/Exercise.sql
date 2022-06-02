
---Declare scalar variable for storing FirstName values Assign value ‘Antonio’ to the FirstName variable•Find all Students having FirstName same as the variable-----
GO
DECLARE @FirstName VARCHAR(255);

SET  @FirstName = 'Antonio'
SELECT *  FROM Student WHERE @FirstName = Student.FirstName; 


----Declare table variable that will contain StudentId, StudentName and DateOfBirth Fill the table variable with all Female students
GO
DECLARE @StudentFemale TABLE (ID INT,FirstName VARCHAR(255),DateOfBirth DATE);

INSERT INTO @StudentFemale SELECT [ID],[FirstName],[DateOfBirth] FROM [Student]
WHERE Student.Gender = 'F';
SELECT * FROM @StudentFemale


---Declare temp table that will contain LastName and EnrolledDate columns 
----Fill the temp table with all Male students having First Name starting with ‘A’ Retrieve the students from the table which last name is with 7 characters
GO
CREATE TABLE #MaleStudents (LastName VARCHAR(255),EnrolledDate DATE); 

INSERT INTO #MaleStudents SELECT [LastName],[EnrolledDate] FROM Student
WHERE Student.Gender = 'M' AND FirstName LIKE 'A%' AND LEN(LastName) =  7

SELECT * FROM #MaleStudents -- No student found

----- Find all teachers whose FirstName length is less than 5 and  the first 3 characters of their FirstName and LastName are the same
GO
SELECT * FROM Teacher
WHERE LEN(FirstName) = 5 AND LEFT(FirstName,3) = LEFT(LastName,3)