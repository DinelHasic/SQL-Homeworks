-------- Execute this first -------

-------------- SEDACADEMYDB DATABASE ------------------
CREATE DATABASE [SEDCACADEMY]

USE [SEDCACADEMY]

CREATE TABLE [dbo].[Teacher]
(
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[AcademicRank] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)
GO

CREATE TABLE [dbo].[Student]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[EnrolledDate] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[NationalIDNumber] [nvarchar](50) NOT NULL,
	[StudentCardNumber] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)
GO

CREATE TABLE [dbo].[Course]
(
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Credit] [tinyint] NOT NULL,
	[AcademicYear] [tinyint] NOT NULL,
	[Semester] [tinyint] NOT NULL,
	CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)
GO

CREATE TABLE [dbo].[AchievementType]
(
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[ParticipationRate] [tinyint] NOT NULL,
	CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)
GO

CREATE TABLE [dbo].[Grade]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [smallint] NOT NULL,
	[TeacherID] [smallint] NOT NULL,
	[Grade] [tinyint] NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)
GO

CREATE TABLE [dbo].[GradeDetails]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[AchievementTypeID] [tinyint] NOT NULL,
	[AchievementPoints] [tinyint] NOT NULL,
	[AchievementMaxPoints] [tinyint] NOT NULL,
	[AchievementDate] [datetime] NOT NULL,
	CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)
GO

GO
-- Delete Data from tables
------------------
delete from [dbo].[GradeDetails] where 1=1;
delete from [dbo].[Grade] where 1=1;
delete from [dbo].[AchievementType] where 1=1;
delete from [dbo].[Course] where 1=1;
delete from [dbo].[Student] where 1=1;
delete from [dbo].[Teacher] where 1=1;
GO

-- After running DBCC CHECKIDENT('TableName', RESEED, 0):
-- Newly created tables will start with identity 0
-- Existing tables will continue with identity 1
------------------
DBCC CHECKIDENT ('GradeDetails', RESEED, 0)
DBCC CHECKIDENT ('Grade', RESEED, 0)
DBCC CHECKIDENT ('AchievementType', RESEED, 0)
DBCC CHECKIDENT ('Course', RESEED, 0)
DBCC CHECKIDENT ('Student', RESEED, 0)
DBCC CHECKIDENT ('Teacher', RESEED, 0)
GO

-- Student
------------------
declare @FirstName table
(
	FirstName nvarchar(50)
,	Gender char(1)
)
insert into @FirstName (FirstName, Gender)
values
	('Adrijan','M'), ('Aleksandar','M'), ('Anastas','M'), ('Atanas','M'), ('Angel','M'), ('Andon','M'), ('Andrej','M'), ('Antonio','M'), ('Apostol','M')
,	('Aleksandra', 'F'), ('Ana', 'F'), ('Anastasija', 'F'), ('Angela', 'F'), ('Angelina', 'F'), ('Angja', 'F'), ('Atanasija', 'F')
,	('Blagoj', 'M'), ('Bogdan', 'M'), ('Bozidar', 'M'), ('Bozin', 'M'), ('Bojan', 'M'), ('Boris', 'M'), ('Borjan', 'M'), ('Boshko', 'M'), ('Branko', 'M')
,	('Biljana', 'F'), ('Bisera', 'F'), ('Blaga', 'F'), ('Blagica', 'F'), ('Blagorodna', 'F'), ('Blaguna', 'F'), ('Bozana', 'F'), ('Bojana', 'F'), ('Borjana', 'F'), ('Branka', 'F')
,	('Vangel', 'M'), ('Vasil', 'M'), ('Vasilij', 'M'), ('Veljan', 'M'), ('Venko', 'M'), ('Veselin', 'M'), ('Vidan', 'M'), ('Viktor', 'M'), ('Vladimir', 'M'), ('Vojdan', 'M'), ('Vojo', 'M'), ('Vojkan', 'M')
,	('Valentina', 'F'), ('Vangja', 'F'), ('Varvara', 'F'), ('Vasilka', 'F'), ('Vaska', 'F'), ('Velika', 'F'), ('Veljana', 'F'), ('Vera', 'F'), ('Veronika', 'F'), ('Vesna', 'F'), ('Violeta', 'F')
,	('Gavril', 'M'), ('Georgi', 'M'), ('Gerasim', 'M'), ('Gligor', 'M'), ('Gorazd', 'M'), ('Goran', 'M'), ('Gorjan', 'M'), ('Goce', 'M'), ('Grigor', 'M'), ('Grozdan', 'M')
,	('Galena', 'F'), ('Golubinka', 'F'), ('Gordana', 'F'), ('Gorica', 'F'), ('Gorjana', 'F'), ('Grozda', 'F')
,	('David', 'M'), ('Damjan', 'M'), ('Danail', 'M'), ('Daniel', 'M'), ('Darko', 'M'), ('Dejan', 'M'), ('Delco', 'M'), ('Despot', 'M'), ('Dimitar', 'M'), ('Dimitrij', 'M'), ('Dobre', 'M'), ('Dojcin', 'M'), ('Donco', 'M'), ('Dragan', 'M'), ('Dushko', 'M')
,	('Damjana', 'F'), ('Danica', 'F'), ('Dara', 'F'), ('Darinka', 'F'), ('Dafina', 'F'), ('Denica', 'F'), ('Despina', 'F'), ('Divna', 'F'), ('Dobrinka', 'F'), ('Domnika', 'F'), ('Donka', 'F'), ('Dosta', 'F'), ('Dragana', 'F'), ('Dushanka', 'F')
,	('Gjoko', 'M'), ('Gjoshe', 'M'), ('Gjorgji', 'M'), ('Gjorgjija', 'M'), ('Gjore', 'M'), ('Gjuro', 'M'), ('Gjurcin', 'M')
,	('Gjurgja', 'F'), ('Gjurgjica', 'F')
,	('Evgenij', 'M'), ('Evtim', 'M'), ('Emanuel', 'M'), ('Emil', 'M'), ('Efrem', 'M'), ('Eftim', 'M')
,	('Eva', 'F'), ('Evdokija', 'F'), ('Evgenija', 'F'), ('Ekaterina', 'F'), ('Elena', 'F'), ('Elisaveta', 'F'), ('Emilija', 'F'), ('Efimija', 'F'), ('Elka', 'F'), ('Efrosina', 'F'), ('Elica', 'F'), ('Efka', 'F'), ('Eleonora', 'F')
,	('Zafir', 'M'), ('Zarko', 'M'), ('Zdravko', 'M'), ('Zivko', 'M'), ('Zlatan', 'M'), ('Zlatko', 'M'), ('Zoran', 'M')
,	('Zagorka', 'F'), ('Zaklina', 'F'), ('Zdravka', 'F'), ('Zivka', 'F'), ('Zlata', 'F'), ('Zora', 'F'), ('Zorica', 'F'), ('Zorka', 'F')
,	('Zvezdan', 'M'), ('Zvonko', 'M')
,	('Zvezda', 'F')
,	('Ivan', 'M'), ('Ignat', 'M'), ('Igor', 'M'), ('Ilija', 'M'), ('Irinej', 'M'), ('Isak', 'M')
,	('Ivana', 'F'), ('Ivanka', 'F'), ('Ilinka', 'F'), ('Irina', 'F'), ('Iskra', 'F')
,	('Jakov', 'M'), ('Janakij', 'M'), ('Jane', 'M'), ('Janko', 'M'), ('Joakim', 'M'), ('Jovan', 'M'), ('Jonce', 'M'), ('Jordan', 'M'), ('Josif', 'M')
,	('Javorka', 'F'), ('Jagoda', 'F'), ('Jana', 'F'), ('Jasmina', 'F'), ('Jasminka', 'F'), ('Jasna', 'F'), ('Jovana', 'F'), ('Jordana', 'F'), ('Jordanka', 'F')
,	('Kalin', 'M'), ('Kiril', 'M'), ('Kliment', 'M'), ('Konstantin', 'M'), ('Kostadin', 'M'), ('Krste', 'M'), ('Kuzman', 'M'), ('Kocho', 'M')
,	('Kalina', 'F'), ('Karanfilka', 'F'), ('Kata', 'F'), ('Katerina', 'F'), ('Katina', 'F'), ('Katinka', 'F'), ('Klimentina', 'F'), ('Konstantina', 'F'), ('Kostadinka', 'F'), ('Krstana', 'F'), ('Kristina', 'F'), ('Ksenija', 'F')
,	('Lav', 'M'), ('Lazar', 'M'), ('Lambe', 'M'), ('Leonid', 'M'), ('Lefter', 'M'), ('Luka', 'M')
,	('Lena', 'F'), ('Lenka', 'F'), ('Lidija', 'F'), ('Lina', 'F'), ('Liljana', 'F')
,	('Ljuben', 'M'), ('Ljubomir', 'M'), ('Ljudmil', 'M'), ('Ljupco', 'M')
,	('Ljuba', 'F'), ('Ljubinka', 'F'), ('Ljubica', 'F'), ('Ljupka', 'F')
,	('Maksim', 'M'), ('Manuel', 'M'), ('Marin', 'M'), ('Marjan', 'M'), ('Marko', 'M'), ('Martin', 'M'), ('Matej', 'M'), ('Metodij', 'M'), ('Miladin', 'M'), ('Mirko', 'M'), ('Mitre', 'M'), ('Mihail', 'M'), ('Mojsej', 'M'), ('Mladen', 'M')
,	('Magdalena', 'F'), ('Makedonka', 'F'), ('Marija', 'F'), ('Marika', 'F'), ('Marina', 'F'), ('Marta', 'F'), ('Meglena', 'F'), ('Melanija', 'F'), ('Menka', 'F'), ('Mileva', 'F'), ('Milena', 'F'), ('Mirka', 'F'), ('Milica', 'F'), ('Milka', 'F'), ('Mirjana', 'F')
,	('Naum', 'M'), ('Natanail', 'M'), ('Nedelko', 'M'), ('Nestor', 'M'), ('Nikita', 'M'), ('Nikifor', 'M'), ('Nikola', 'M')
,	('Nada', 'F'), ('Nadezda', 'F'), ('Natalija', 'F'), ('Natasha', 'F'), ('Nevena', 'F'), ('Nevenka', 'F'), ('Neda', 'F'), ('Nikolina', 'F')
,	('Ognen', 'M'), ('Oliver', 'M'), ('Ordan', 'M'), ('Ozren', 'M')
,	('Olga', 'F'), ('Olivera', 'F')
,	('Pavle', 'M'), ('Panche', 'M'), ('Partenij', 'M'), ('Paskal', 'M'), ('Petar', 'M'), ('Petko', 'M')
,	('Pavlina', 'F'), ('Pavlinka', 'F'), ('Paraskeva', 'F'), ('Pauna', 'F'), ('Persa', 'F'), ('Petkana', 'F'), ('Petra', 'F'), ('Petranka', 'F')
,	('Rafael', 'M'), ('Rajko', 'M'), ('Riste', 'M'), ('Risto', 'M'), ('Roman', 'M')
,	('Rada', 'F'), ('Rajna', 'F'), ('Rahela', 'F'), ('Rahilka', 'F'), ('Ratka', 'F'), ('Ristana', 'F'), ('Rodna', 'F'), ('Rosa', 'F'), ('Roska', 'F'), ('Rosica', 'F'), ('Ruza', 'F'), ('Rumena', 'F'), ('Rusalina', 'F')
,	('Sazdo', 'M'), ('Samuil', 'M'), ('Sande', 'M'), ('Serafim', 'M'), ('Siljan', 'M'), ('Simeon', 'M'), ('Simon', 'M'), ('Slave', 'M'), ('Sofronij', 'M'), ('Sotir', 'M'), ('Spase', 'M'), ('Spiridon', 'M'), ('Srebre', 'M'), ('Stamen', 'M'), ('Stefan', 'M'), ('Stojan', 'M')
,	('Sandra', 'F'), ('Sara', 'F'), ('Sashka', 'F'), ('Svetlana', 'F'), ('Simeona', 'F'), ('Simona', 'F'), ('Sirma', 'F'), ('Slavica', 'F'), ('Slavjanka', 'F'), ('Slobodanka', 'F'), ('Snezana', 'F'), ('Sonja', 'F'), ('Sofija', 'F'), ('Spasija', 'F'), ('Spomenka', 'F'), ('Srebra', 'F'), ('Stamena', 'F'), ('Stojmena', 'F'), ('Stefanija', 'F'), ('Stojanka', 'F'), ('Suzana', 'F'), ('Suncica', 'F')
,	('Tadej', 'M'), ('Tanas', 'M'), ('Tashko', 'M'), ('Temelko', 'M'), ('Teodor', 'M'), ('Teodosij', 'M'), ('Teofan', 'M'), ('Teofil', 'M'), ('Timotej', 'M'), ('Tihomir', 'M'), ('Todor', 'M'), ('Toma', 'M'), ('Trajan', 'M'), ('Trajko', 'M'), ('Trifun', 'M'), ('Trpe', 'M')
,	('Tatjana', 'F'), ('Tamara', 'F'), ('Temjana', 'F'), ('Teodora', 'F'), ('Teodosija', 'F'), ('Teofilka', 'F'), ('Tijana', 'F'), ('Todorka', 'F'), ('Trajanka', 'F'), ('Trendafilka', 'F'), ('Trpana', 'F')
,	('Ubavka', 'F')
,	('Fidan', 'M'), ('Filip', 'M')
,	('Fanija', 'F'), ('Fidanka', 'F'), ('Filimena', 'F'), ('Florinka', 'F'), ('Frosina', 'F')
,	('Caslav', 'M'), ('Cedomir', 'M'), ('Cvetan', 'M'), ('Cvetko', 'M')
,	('Cveta', 'F'), ('Cvetanka', 'F')
,	('Hristijan', 'M'), ('Hristo', 'M')
,	('Hristina', 'F')
declare @LastName table
(
	LastName nvarchar(50)
,	Gender char(1)
)
insert into @LastName (LastName, Gender)
values
	('Aleksovska', 'F'), ('Andonov', 'M'), ('Andonova', 'F'), ('Angelov', 'M'), ('Angelova', 'F'), ('Angelovska', 'F'), ('Angelovski', 'M'), ('Arsov', 'M'), ('Arsova', 'F'), ('Arsovska', 'F'), ('Arsovski', 'M'), ('Asani', 'M'), ('Atanasov', 'M'), ('Atanasova', 'F'), ('Atanasovska', 'F'), ('Atanasovski', 'M')
,	('Blazevska', 'F'), ('Blazevski', 'M'), ('Bogdanovski', 'M'), ('Bozinovska', 'F'), ('Bozinovski', 'M')
,	('Cvetanovska', 'F'), ('Cvetkovska', 'F'), ('Cvetkovski', 'M')
,	('Dimitrievska', 'F'), ('Dimitrievski', 'M'), ('Dimitrov', 'M'), ('Dimitrova', 'F'), ('Dimitrovska', 'F'), ('Dimoski', 'M'), ('Dimov', 'M'), ('Dimova', 'F'), ('Dimovska', 'F'), ('Dimovski', 'M'), ('Dodevska', 'F'), ('Dodevski', 'M'), ('Donev', 'M')
,	('Georgieva', 'F'), ('Georgievska', 'F'), ('Gjorgieva', 'F'), ('Gjorgjiev', 'M'), ('Gjorgjieva', 'F'), ('Gjorgjievska', 'F'), ('Gjorgjievski', 'M')
,	('Iliev', 'M'), ('Ilieva', 'F'), ('Ilievska', 'F'), ('Ilievski', 'M'), ('Ivanov', 'M'), ('Ivanova', 'F'), ('Ivanovska', 'F'), ('Ivanovski', 'M')
,	('Jakimovska', 'F'), ('Jakimovski', 'M'), ('Janev', 'M'), ('Janeva', 'F'), ('Janevska', 'F'), ('Janevski', 'M'), ('Jovanoska', 'F'), ('Jovanoski', 'M'), ('Jovanov', 'M'), ('Jovanova', 'F'), ('Jovanovska', 'F'), ('Jovanovski', 'M')
,	('Kocev', 'M'), ('Koceva', 'F'), ('Kostadinov', 'M'), ('Kostadinova', 'F'), ('Kostova', 'F'), ('Kostovska', 'F'), ('Kostovski', 'M'), ('Krstevska', 'F'), ('Krstevski', 'M'), ('Kuzmanovska', 'F')
,	('Lazarevska', 'F'), ('Lazarov', 'M'), ('Lazarova', 'F')
,	('Markovska', 'F'), ('Markovski', 'M'), ('Mihajlovska', 'F'), ('Miloshevska', 'F'), ('Mitev', 'M'), ('Miteva', 'F'), ('Mitreska', 'F'), ('Mitrevska', 'F'), ('Mitrevski', 'M'), ('Mladenovska', 'F'), ('Mladenovski', 'M')
,	('Nikoloska', 'F'), ('Nikoloski', 'M'), ('Nikolov', 'M'), ('Nikolova', 'F'), ('Nikolovska', 'F'), ('Nikolovski', 'M')
,	('Pavlova', 'F'), ('Pavlovska', 'F'), ('Pavlovski', 'M'), ('Petkovska', 'F'), ('Petkovski', 'M'), ('Petreska', 'F'), ('Petreski', 'M'), ('Petrov', 'M'), ('Petrova', 'F'), ('Petrovska', 'F'), ('Petrovski', 'M'), ('Petrushevska', 'F'), ('Petrushevski', 'M'), ('Poposka', 'F'), ('Popova', 'F'), ('Popovska', 'F'), ('Popovski', 'M')
,	('Risteska', 'F'), ('Risteski', 'M'), ('Ristevska', 'F'), ('Ristevski', 'M'), ('Ristov', 'M'), ('Ristova', 'F'), ('Ristovska', 'F'), ('Ristovski', 'M')
,	('Simonovska', 'F'), ('Simonovski', 'M'), ('Sokolova', 'F'), ('Spasovska', 'F'), ('Spasovski', 'M'), ('Stankovska', 'F'), ('Stankovski', 'M'), ('Stefanovska', 'F'), ('Stefanovski', 'M'), ('Stojanoska', 'F'), ('Stojanoski', 'M'), ('Stojanov', 'M'), ('Stojanova', 'F'), ('Stojanovska', 'F'), ('Stojanovski', 'M'), ('Stojcevska', 'F'), ('Stojcevski', 'M'), ('Stojkova', 'F'), ('Stojkovska', 'F'), ('Stojkovski', 'M')
,	('Taseva', 'F'), ('Tasevska', 'F'), ('Tasevski', 'M'), ('Todorova', 'F'), ('Todorovska', 'F'), ('Todorovski', 'M'), ('Trajkov', 'M'), ('Trajkova', 'F'), ('Trajkovska', 'F'), ('Trajkovski', 'M'), ('Trifunova', 'F')
,	('Vasilevska', 'F'), ('Vasilevski', 'M'), ('Velickovska', 'F'), ('Velickovski', 'M'), ('Velkov', 'M'), ('Velkova', 'F'), ('Velkovska', 'F'), ('Velkovski', 'M')
declare @dt date = Getdate();

;with s as
(
	select
		fn.FirstName
	,	ln.LastName
	,	DATEADD(day, -14600 + ABS(CHECKSUM(NewID())) % 7300, @dt) as DateOfBirth	--40*365=14600--20*365=7300
	,	fn.Gender as Gender
	,	cast(100000 + ABS(CHECKSUM(NewID())) % 900000 as nvarchar(50)) as NationaIDNumber
	,	'sc-' + cast(10000 + ABS(CHECKSUM(NewID())) % 90000 as nvarchar(50)) as StudentCardNumber
	from
		@FirstName as fn
		inner join @LastName as ln
		on
			fn.Gender = ln.Gender
		and	Left(fn.FirstName,1) <> Left(ln.LastName,1)
)
insert into [dbo].[Student] ([FirstName], [LastName], [DateOfBirth], [EnrolledDate], [Gender], [NationalIDNumber], [StudentCardNumber])
select top 2 percent
	s.FirstName
,	s.LastName
,	s.DateOfBirth
,	DATEADD(day, 6570 + ABS(CHECKSUM(NewID())) % 1095, s.DateOfBirth) as EnrolledDate	--18*365=6570--3*365=1095
,	s.Gender
,	s.NationaIDNumber
,	s.StudentCardNumber
from
	s
order by
	NewID()

-- Teacher
------------------
;with t as
(
	select
		fn.FirstName
	,	ln.LastName
	,	DATEADD(day, -20075 + ABS(CHECKSUM(NewID())) % 7300, @dt) as DateOfBirth	--55*365=20075--20*365=7300
	,	ABS(CHECKSUM(NewID())) % 5 as AcademicRank
	,	9125 + ABS(CHECKSUM(NewID())) % 1825 as HireDays		--25*365=9125--5*365=1825
	from
		@FirstName as fn
		inner join @LastName as ln
		on
			fn.Gender = ln.Gender
		and	Left(fn.FirstName,2) = Left(ln.LastName,2)
)
insert into [dbo].[Teacher] ([FirstName], [LastName], [DateOfBirth], [AcademicRank], [HireDate])
select top 20 percent
	t.FirstName
,	t.LastName
,	t.DateOfBirth
,	case t.AcademicRank
		when 0 then 'Asistent'
		when 1 then 'Docent'
		when 2 then 'Naucen sorabotnik'
		when 3 then 'Vonreden profesor'
		when 4 then 'Redoven profesor'
		else 'Redoven profesor'
	end as AcademicRank
,	Dateadd(day, t.HireDays, t.DateOfBirth) as HireDate
from
	t
order by
	NewID()

--Correct Teachers (ID <= 41) HireDate (DateOfBirth), to be older than Student Minimum EnroledDate
declare @minStudentEndrolledDate date
set @minStudentEndrolledDate = (select min(EnrolledDate) from [dbo].[Student])
update [dbo].[Teacher]
set
	HireDate = DATEADD(day, (-1) * (111 + ABS(CHECKSUM(NewID())) % 333 + DATEDIFF(day, @minStudentEndrolledDate, HireDate)), HireDate)
,	DateOfBirth = DATEADD(day, (-1) * (111 + ABS(CHECKSUM(NewID())) % 333 + DATEDIFF(day, @minStudentEndrolledDate, HireDate)), DateOfBirth)
from
	[dbo].[Teacher]
where
	ID <= 41
and HireDate > @minStudentEndrolledDate
GO

-- Course
------------------
insert into [dbo].[Course]
values
	(N'?????? ? ?????????', 6, 1, 1), (N'????? ?? ?????????????? ?????', 6, 1, 1), (N'????????', 6, 1, 1), (N'????????????? ???????', 6, 1, 1), (N'?????????? ????????????', 6, 1, 1)
,	(N'?????? ?? ??? ??????', 6, 1, 2), (N'??????????? ? ???????????? ?? ??????????', 6, 1, 2), (N'????????? ??????????', 6, 1, 2), (N'???????? ??????????? ??????? ? ??????', 6, 1, 2), (N'????????-??????????? ????????????', 6, 1, 2), (N'????? ? ???????', 6, 1, 2)
,	(N'?????????? ??????????', 6, 2, 3), (N'???????? ???????????? ?? ????????? ??????', 6, 2, 3), (N'????????? ? ????????? ?????????', 6, 2, 3), (N'??????????? ? ??????????', 6, 2, 3), (N'???????????? ????? ? ??????????', 6, 2, 3)
,	(N'???????? ?????????????', 6, 2, 4), (N'????????? ??????????? ?? ?????', 6, 2, 4), (N'?????? ?? ?????????', 6, 2, 4), (N'??????? ?? ???????????? ??????', 6, 2, 4), (N'?????????? ???????', 6, 2, 4)
,	(N'???????????? ??????????', 6, 3, 5), (N'???????? ??? ??????', 6, 3, 5), (N'???? ?? ????????', 6, 3, 5), (N'????? ?? ??????? ?? ????????', 6, 3, 5), (N'?????? ? ??????????? ?? ???????', 6, 3, 5)
,	(N'???????? ?????', 6, 3, 6), (N'????????? ?????????', 6, 3, 6), (N'?????? ?? ????????????? ?????-?????????', 6, 3, 6), (N'??????????? ???????', 6, 3, 6), (N'?????????? ???????? ? ?????????', 6, 3, 6)
,	(N'?????????????? ?? ???? ?? ????????', 6, 4, 7), (N'?????????? ???????????', 6, 4, 7), (N'???????? ?? ??????? ????????', 6, 4, 7), (N'???????????? ?? ????? ????', 6, 4, 7), (N'?????? ??????', 6, 4, 7)
,	(N'????????? ??????', 6, 4, 8), (N'???????? ???? ?? ????????', 6, 4, 8), (N'???????????? ???????????? ???????', 6, 4, 8), (N'???????? ?? ???????? ? ?????????? ?????????', 6, 4, 8), (N'?????????? ?? ??? ???????', 6, 4, 8)
GO

-- AchievementType
------------------
insert into [dbo].[AchievementType](Name, ParticipationRate)
values
	('Domasni', 7)
,	('Seminarska', 8)
,	('Redovnost', 5)
,	('Kolokvium1', 40)
,	('Kolokvium2', 40)
,	('Ispit', 80)
GO

-- Grade
------------------
declare @dt date = Getdate();
declare @TeacherStartID smallint
set @TeacherStartID = (select min(ID) from [dbo].[Teacher])
declare @Comment table
(
	ID tinyint
,	Comment nvarchar(100)
)
insert into @Comment (ID, Comment)
values (1, 'Dobar'), (2, 'Trudoljubiv'), (3, 'Vreden'), (4, 'Neredoven'), (5, 'Neispolnitelen'), (6, 'Snaodliv'), (7, 'Komunikativen')
insert into [dbo].[Grade] ([StudentID], [CourseID], [TeacherID], [Grade], [Comment], [CreatedDate])
select
	s.ID as StudentID
,	ct.CourseID 
,	ct.TeacherID
,	case
		when s.ID % 10 < 1 then 9 + ABS(CHECKSUM(NewID())) % 2
		when s.ID % 10 between 1 and 2 then 8 + ABS(CHECKSUM(NewID())) % 3
		else 6 + ABS(CHECKSUM(NewID())) % 5
	end as Grade
,	cm.Comment
,	DateAdd(day, CreatedRndDays, s.EnrolledDate) as CreatedDate
from
	Student as s
	CROSS APPLY
	(
		select
			q.CourseID, q.Semester, q.TeacherID
		,	q.Semester * 6 * 30 + ABS(CHECKSUM(NewID())) % 365 as CreatedRndDays
		from
		(
			select
				c.ID as CourseID, c.Semester, t.ID as TeacherID
			,	ROW_NUMBER() OVER(PARTITION BY s.ID, c.ID ORDER BY NewID()) as RndTeacher
			from
				[dbo].[Course] as c
				inner join [dbo].[Teacher] as t on c.ID = (t.ID - @TeacherStartID) % 41 + @TeacherStartID
			where
				t.HireDate < s.EnrolledDate
			and t.ID not in (44, 55, 66, 77)
		) as q
		where
			q.RndTeacher = 1
	) as ct
	inner join @Comment as cm on (s.ID*ct.CourseID*ct.TeacherID) % 7 + 1 = cm.ID
where
	(
		s.ID %10 < 8
	or
	(
		ct.Semester < 6 or ct.CourseID % 10 > 3)
	)
	--	ct.Semester < 6
	--or	(ct.Semester >= 6 and (ct.CourseID + s.ID) % 10 > 3)
and	DateAdd(day, CreatedRndDays, s.EnrolledDate) <= @dt
order by
	s.EnrolledDate
,	s.ID
,	ct.CourseID
,	ct.TeacherID
GO

-- GradeDetails
------------------
;with g as
(
	select
		*
	,	Cast((StudentID*CourseID) % 2 as bit) as Exam
	,	(Grade - 1) * 10 + 1 as PointsFrom
	from
		[dbo].[Grade]
)
insert into [dbo].[GradeDetails] ([GradeID], [AchievementTypeID], [AchievementPoints], [AchievementMaxPoints], [AchievementDate])
select
	g.ID as GradeID
,	a.ID as AchievementTypeID
,	case
		when a.[Name] in ('Domasni', 'Seminarska', 'Redovnost') then 20 + ABS(CHECKSUM(NewID())) % 80
		else g.PointsFrom + ABS(CHECKSUM(NewID())) % 10
	end as AchievementPoints
,	100 as AchievementMaxPoints
,	DATEADD(day, -30 + ABS(CHECKSUM(NewID())) % 30, g.CreatedDate) as AchievementDate
from
	g
	cross apply [dbo].[AchievementType] as a
where
	(g.Exam = 1 and a.[Name] in ('Domasni', 'Seminarska', 'Redovnost', 'Ispit'))
or	(g.Exam = 0 and a.[Name] in ('Domasni', 'Seminarska', 'Redovnost', 'Kolokvium1', 'Kolokvium2'))
order by
	g.ID
GO

select * from Student
select * from Course
select * from Teacher
select * from AchievementType
select * from Grade
select * from GradeDetails



------------------ SEDC TABLE ---------------
USE [master]
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SEDC')
	ALTER DATABASE [SEDC] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [Master]
GO
DROP DATABASE IF EXISTS [SEDC]
GO
CREATE DATABASE [SEDC]
GO
USE [SEDC]
GO


DROP TABLE IF EXISTS [dbo].OrderDetails;
DROP TABLE IF EXISTS [dbo].[Order];
DROP TABLE IF EXISTS [dbo].[BusinessEntity];
DROP TABLE IF EXISTS [dbo].Customer;
DROP TABLE IF EXISTS [dbo].Product;
DROP TABLE IF EXISTS [dbo].Employee;
GO

CREATE TABLE [dbo].[BusinessEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Region] [nvarchar](1000) NULL,
	[Zipcode] [nvarchar](10) NULL,
	[Size] [nvarchar](10) NULL,
 CONSTRAINT [PK_BusinessEntity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[City] [nvarchar](100) NULL,
	[RegionName] [nvarchar](100) NULL,
	[CustomerSize] [nvarchar](10) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
	[NationalIdNumber] [nvarchar](20) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[Cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[Status] [smallint] NULL,
	[BusinessEntityId] [int] NULL,
	[CustomerId] [int] NULL,
	[EmployeeId] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

--------------------------- SEDC DATA ----------------------------------------------------------------------

-- Business Entity
------------------

delete from dbo.OrderDetails where 1=1;
delete from dbo.[Order] where 1=1;
delete from dbo.BusinessEntity where 1=1;
delete from dbo.Employee where 1=1;
delete from dbo.Product where 1=1;
delete from dbo.Customer where 1=1;
GO

DBCC CHECKIDENT ('OrderDetails', RESEED, 0)
DBCC CHECKIDENT ('[Order]', RESEED, 0)
DBCC CHECKIDENT ('BusinessEntity', RESEED, 0)
DBCC CHECKIDENT ('Employee', RESEED, 0)
DBCC CHECKIDENT ('Product', RESEED, 0)
DBCC CHECKIDENT ('Customer', RESEED, 0)
GO

insert into dbo.BusinessEntity (Name,Region,Zipcode,Size)
values ('Vitalia Skopje','Skopski','1000','Large')
GO

insert into dbo.BusinessEntity (Name,Region,Zipcode,Size)
values ('Vitalia Bitola','Bitolski','2000','Large')
GO

insert into dbo.BusinessEntity (Name,Region,Zipcode,Size)
values ('Vitalia Strumica','Strumicki','987','Medium')
GO

insert into dbo.BusinessEntity (Name,Region,Zipcode,Size)
values ('Vitalia Kumanovo','Kumanovski','500','Medium')
GO

insert into dbo.BusinessEntity (Name,Region,Zipcode,Size)
values ('Vitalia Tetovo','Polog','700','Small')
GO

insert into dbo.BusinessEntity (Name,Region,Zipcode,Size)
values ('Vitalia Stip','Stipski','300','Small')
GO

insert into dbo.BusinessEntity (Name,Region,Zipcode,Size)
values ('Vitalia Ohrid','Ohridski','100','Small')
GO


-- Employee table

declare @FirstName table (FirstName nvarchar(50))
insert into @FirstName values ('Aleksandar'),('Ana'),('Borce'),('Biljana'),('Viktor'),('Valentina'),('Goran'),('Gordana'),('Maja'),('Marko')

declare @LastName table (LastName nvarchar(50))
insert into @LastName values ('Stojanovski'),('Nikolovski'),('Zdravevski'),('Ivanovski'),('Popovski'),('Mitrevski'),('Stoilov'),('Pandev'),('Todorov'),('Trajanov')

insert into dbo.Employee (FirstName,LastName,DateOfBirth,Gender,HireDate,NationalIdNumber)
select f.FirstName, l.LastName,'1980.01.01' as date, case when FirstName in ('Ana','Biljana','Valentina','Gordana','Maja') then 'F' else 'M' end as Gender,'2015.01.01' as HireDate,1 as IdNumber
from @FirstName f
CROSS JOIN @LastName l
GO

update e set DateOfBirth = dateadd(MM,Id,DateOfBirth),  
			 HireDate = dateadd(MM,2*Id,'1990.01.01'), 
			 NationalIdNumber =  id + cast(10000000 * rand(id*10) as int)
from dbo.Employee e
GO


-- Customer
-----------
declare @City table (City nvarchar(100),Region nvarchar(100))
insert into @City
select substring(name,9,100),Region 
from dbo.BusinessEntity
UNION select 'Radovis','Strumicki'
UNION select 'Kocani','Stipski'
UNION select 'Gevgelija','Strumicki'

declare @Market table (name nvarchar(100))
insert into @Market values ('Vero'),('Tinex'),('Ramstor'),('Kam'),('Zito'),('Zegin'),('Eurofarm'),('Makpetrol'),('Lukoil'),('Tobacco')

insert into dbo.Customer (Name, City,RegionName, isActive)
select m.name + N' ' + c.City as Name, c.City as City, case when c.Region = 'Strumicki' then 'Stipski' else c.Region end as Region, 1 as IsActive
from @Market m
CROSS APPLY @City c

update c set AccountNumber = id + cast(233255 * rand(id*7) as int),
CustomerSize = case when id%3 = 0 then 'Small' when id % 3 = 1 then 'Medium' else 'Large' end, 
PhoneNumber = N'070' + Cast(cast(1000000 * rand(id*3) as int) as nvarchar(10))
 from dbo.Customer c

 GO

-- Product
-----------

INSERT INTO dbo.Product (Name)
VALUES('Crunchy'),('Granola'),('Regular/soft'),('Gluten Free'),('Multigrain'),('Take away'),('Cornflakes'),('Cereals'),('Protein Bar'),('Raw bars'),('No Sugar Added'),('Multigrain'),
('Gluten Free'),('Kids Bar'),('Fruit, Nuts & Seeds'),('Protein balls'),('Rice Cakes'),('Mini cereal bites'),('Dried Fruits'),('Crackers'),('Cookies'),('Unrefined sugars'),
('Natural Sweeteners'),('Diabetic'),('Plant-based drinks'),('Smoothie drinks'),('Natural Juices'),('Green Teas'),('Functional Teas'),('Fruit Teas'),('Seeds'),('Oils & Vinegars'),
('Gluten Free Pasta'),('Flours'),('Superfoods'),('Sport Supplements'),('Honey Syrup'),('Sweet Spreads'),('Spices'),('Soups'),('Salty Spreads'),('Soy Pates'),('Soy milks')


update p set Weight = cast(100* id * rand(100+id) as int),
Cost = cast(20 + 10* id * rand(23+id) as int),
Price = 5 + id + cast(20 + 10* id * rand(23+id) as int),
Code = substring(Name,1,3) + cast(id as nvarchar(10)),
Description = Name + ' description'
from dbo.Product p
GO

-- Order
--------
 
 Insert into dbo.[Order] (OrderDate, Status, BusinessEntityId, CustomerId,EmployeeId,TotalPrice,Comment)
 select '2019.05.01' as OrderDate, 0 as Status, b.Id , c.Id, e.Id, 0 as TotalPrice, N'' as comment
 from dbo.BusinessEntity b
 cross apply dbo.Customer c
 cross apply dbo.Employee e
 where b.Id not in (13,15)
 and c.Id % 10 >3
 and e.Id % 10 <7
 and b.Region = c.RegionName

 update o set OrderDate =  dateadd(DD,-(Id%120),OrderDate)
 from dbo.[Order] o
 GO

 -- Order details
 INSERT INTO dbo.OrderDetails (OrderId, ProductId,Quantity,Price)
 select o.id,p.Id, 1 + (p.id + o.id) % 13,p.Price
 from [Order] o
 cross apply Product p 
 where (o.id %2 + o.id %3 )= p.id % 11
 and p.id % 10 not in (3,4)
 and o.id % 10 < 7
 GO

 ; with cte as (
 select o.Id, sum(d.Quantity * d.Price) as TotalPrice
 from dbo.[Order] o
 inner join dbo.OrderDetails d on o.Id = d.OrderId
 group by o.id 
 )
 update o set TotalPrice = c.TotalPrice
 from dbo.[Order] o
 inner join cte c on c.Id = o.id

GO


SELECT * from dbo.BusinessEntity
select * from dbo.Employee
SELECT * from dbo.Product
select * from dbo.Customer 
select * from dbo.[Order]
select * from dbo.[OrderDetails]