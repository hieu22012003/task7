create database ipin
go
use ipin
go
create table Class(
ClassCode varchar(10) primary key,
HeadTeacher varchar(30),
Room varchar(30),
TimeSlot char,
CloseDate datetime
)
go
insert into Class values
('C1007L','Nguyen Van An','Class 1','G','06-30-2022'),
('T2203M','Dang Kim Thi','Class 2','L','07-01-2022'),
('T2012M','Nguyen Van Luyen','Class 3','G','06-27-2022'),
('C9097L','Nguyen Van Tuan','Class 4','I','06-28-2022'),
('A2307L','Nguyen Van Kim','Class 5','M','06-29-2022')
go
create table Student(
RollNo varchar(10) primary key,
ClassCode varchar(10) foreign key references Class(ClassCode),
FullName Varchar(30),
Male bit,
BirthDate datetime,
Address varchar(30),
Provice char(3),
Email varchar(30)
)
go
insert into Student values
('A00264','T2203M','Nguyen Trung Quoc',1,'03-12-2003','Ha Noi','HN','trunguoc@gmail.com'),
('A00263','T2203M','Bach Ty Phu',1,'03-01-1998','Ha Noi','HN','typhuday@gmail.com'),
('A00262','C1007L','Nguyen Bat Hieu',1,'03-05-1999','Ha Noi','HN','bathieu@gmail.com'),
('A00261','A2307L','Pham Binh Minh',1,'03-11-1997','Ha Noi','HN','binhminhrangngoi@gmail.com'),
('A00265','T2012M','Duong Qua',1,'03-12-1996','Ha Noi','HN','mottaycantaT@gmail.com')
go
create table Subjects(
SubjectCode  varchar(10) primary key,
SubjectName varchar(40),
WMark bit,
PMark bit,
WTest_per int,
PTest_per int
)
go
insert into Subjects values
('EPC','Logic C',1,0,1,2),
('CF','Logic HTML',1,1,1,2),
('Javal','Javal',1,0,1,2),
('PHP','PyThon',0,0,1,2),
('JS','Java Script',0,1,1,2)
go
Create table Mark(
RollNo varchar(10) foreign key references Student(RollNo),
SubjectCode varchar(10) foreign key references Subjects(SubjectCode),
WMark float,
PMark float,
Mark float
)
go
insert into Mark values 
('A00264','EPC',8,0,3.33),
('A00263','CF',8,6,6.67),
('A00262','Javal',7,0,2.33),
('A00261','PHP',0,0,0),
('A00265','JS',0,8,5.33)
insert into Mark values ('A00264','CF',8,6,6.67)
go
create view view_4_2
as
select s.FullName, count(SJ.SubjectCode) as CK
from Student s
inner join Mark M on s.RollNo=M.RollNo
inner join Subjects SJ on SJ.SubjectCode=M.SubjectCode
group by s.FullName
having COUNT(SJ.SubjectCode)>=2
go
select * from view_4_2