CREATE DATABASE [SEDACADEMYDB];

CREATE TABLE [Student](
[ID] INT PRIMARY KEY NOT NULL,
[FirstName] NVARCHAR(255) NOT NULL,
[LastName] NVARCHAR(255) NOT NULL,
[DateOfBirth] DATE NOT NULL,
[EnrolledDate] DATE NOT NULL,
[Gender] CHAR(1) NOT NULL,
[NationalIDNumber]  NVARCHAR(100) NOT  NULL,
[StudentCardNumber] NVARCHAR(100) NOT NULL
);


CREATE TABLE [Teacher](
[ID] INT PRIMARY KEY NOT NULL,
[FirstName] NVARCHAR(255) NOT NULL,
[LasttName] NVARCHAR(255) NOT NULL,
[DateOfBirth] DATE NOT NULL,
[AcademicRank] NVARCHAR(50) NOT NULL,
[HireDate] DATE NOT NULL
);



CREATE TABLE [Grade](
[ID] INT PRIMARY KEY NOT NULL,
[StudentID] INT NOT NULL,
[CourseID]  INT NOT NULL,
[TeacherID] INT NOT NULL,
[Grade]  TINYINT  NOT NULL,
[Comment] NVARCHAR(150) NOT NULL,
[CreatedDate] DATE NOT NULL
);

CREATE TABLE [Course](
[ID] INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(50) NOT NULL,
[Credit]  DECIMAL(3,2) NOT NULL,
[AcademicYear] DATE NOT NULL,
[Semester]  TINYINT  NOT NULL,
);

CREATE TABLE [GradeDetails](
[ID] INT PRIMARY KEY NOT NULL,
[GradeID] INT NOT NULL,
[AchivmentTypeID] INT NOT NULL,
[AchivmentPoints] INT NOT NULL,
[AchivmentMaxPoints] INT NOT NULL,
[AchivmentDate]  DATE NOT NULL,
);

CREATE TABLE [AchivmentType](
[ID] INT PRIMARY KEY NOT NULL,
[Name] NVARCHAR(50) NOT NULL,
[Description] NVARCHAR(150) NOT NULL,
[PracticipationRate] INT NOT NULL
);