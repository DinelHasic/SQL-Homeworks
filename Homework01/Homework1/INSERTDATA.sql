

--------- Student ------------
INSERT INTO [Student]([ID],[FirstName],[LasttName],[DateOfBirth],[EnrolledDate],[Gender],[NationalIDNumber],[StudentCardNumber]) VALUES(1,'Dinko','Dinko2','5/1/1999','1/1/2018','M','S111','333333333'),
                                                                                                                                       (2,'Elizabeth','Teylor','3/1/1998','1/2/2015','F','S264 ','982695675'),
                                                                                                                                       (3,'Tom','Holand','1/1/2002','2/1/2021','M','S222','229643459'),
                                                                                                                                       (4,'Amie ','Poole','3/2/2002','2/1/2019','F','S943 ','329506614'),
                                                                                                                                       (5,'Sharna ','Levine','4/5/1997','2/1/2019','F','S823','385176978'),
                                                                                                                                       (6,'Chante','Kinney','3/3/2003','2/1/2022','M','S917','226226989 '),
                                                                                                                                       (7,'Orlando','Kurylenko','5/12/2000','2/1/2019','M','S119','263779016 ');

------  Teacher -----------------
INSERT INTO [Teacher]([ID],[FirstName],[LasttName],[DateOfBirth],[AcademicRank],[HireDate]) VALUES(1,'Ben','Stiller','4/5/1965','Trener','4/5/1997'),
                                                                                                  (2,'Tim',' McGraw','3/2/1970','Assistant','8/23/2003'),
                                                                                                  (3,'Vanessa','Hudgens','4/5/1980','Trener','9/7/2004'),
                                                                                                  (4,'Dwight','Howard','12/1/1990','Trener','3/14/2007'),
                                                                                                  (5,'Al','Pacino','7/23/1972','Trener','2/2/1893');


--------Course---------------
INSERT INTO [Course]([ID],[Name],[Credit],[AcademicYear],[Semester]) VALUES(1,'Basic C#',5,'2022',2),
                                                                           (2,'Advance C#',6,'2022',2),
                                                                           (3,'HTML/CSS',3,'2021',1),
																		   (4,'Basic JS',3,'2021',1),
                                                                           (5,'SQL',3,'2021',2);
																		   

-------Grade---------
INSERT INTO [Grade]([ID],[StudentID],[CourseID],[TeacherID],[Grade],[Comment],[CreatedDate]) VALUES(1,1,1,1,7,'Good','5/5/2022'),
                                                                                             (2,2,2,2,10,'Congrats','1/20/2022'),
                                                                                             (3,3,3,3,6,'Study More','4/25/2022'),
                                                                                             (4,4,4,4,8,'Exelent','7/25/2021'),
                                                                                             (5,5,5,5,8,'Exelent','8/15/2021'),
                                                                                             (6,1,3,4,8,'Exelent','4/5/2022'),
                                                                                             (7,7,4,1,8,'Exelent','1/2/2022');



----------AchivmentType----------
INSERT INTO [AchivmentType]([ID],[Name],[Description],[PracticipationRate]) VALUES(1,'High','Exelent',20),
                                                                                  (2,'Low','Bad',2),
                                                                                  (3,'Average','Good',10);

---------Grade Details----------------------
INSERT INTO [GradeDetails]([Id],[GradeID],[AchivmentTypeID],[AchivmentPoints],[AchivmentMaxPoints],[AchivmentDate]) VALUES(1,2,1,100,100,'1/11/2022'),
                                                                                                                          (2,3,2,54,100,'2/14/2022'),
                                                                                                                          (3,4,1,89,100,'2/15/2022'),
                                                                                                                          (4,7,3,81,100,'1/17/2022');

SELECT * FROM [Student];
SELECT * FROM [Teacher];
SELECT * FROM [Course];
SELECT * FROM [Grade];
SELECT * FROM [AchivmentType];
SELECT * FROM [GradeDetails];