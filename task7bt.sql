create database upin
go
use upin
go
create table Customer(
CustomerID int identity primary key,
CustomerName varchar(50),
Address varchar(100),
Phone varchar(12)
)
go
insert into Customer values
('Trung Hiếu','HUẾ','0364647848'),
('Trung Tỷ','QUẢNG BÌNH','+84364647848'),
('Thế Bách','HÀ TĨNH','0962310869'),
('Thế Tũn','HÀ NỘI','+84962310869'),
('Khánh Linh','HẢI PHÒNG','0924356789')
go



create table Book(
BookCode int identity primary key,
Category varchar(50),
Author varchar(50),
Publisher varchar(50),
Title varchar(100),
Price int,
InStore int
)
go
insert into Book values
('Triet Hoc','Richard David Precht','Nha Nam','Toi la ai',150000,100),
('Tieu Thuyet','Murakami Haruki','Nha Nam','Rung Na Uy',100000,80),
('Bai Phat Bieu','Albert Einstein ','Tri Thuc','The gioi nhu toi thay',120000,50),
('Tieu Thuyet',' Albert Camus','Van Hoc','Nguoi dung',110000,60),
('Tieu Thuyet','Gabriel Gacia Marques','Van Hoc','Tram Nam Co Don',90000,60)
go
create table BookSold(
BookSoldID int identity primary key,
CustomerID int foreign key references Customer(CustomerID),
BookCode int foreign key references Book(BookCode),
Date datetime,
Price int,
Amount int
)
go
insert into BookSold values
(1,2,'06-20-2022',100000,5),
(1,2,'06-20-2022',100000,5),
(2,3,'06-20-2022',120000,2),
(2,3,'06-20-2022',120000,2),
(3,4,'06-20-2022',110000,1),
(3,4,'06-20-2022',110000,1),
(4,5,'06-20-2022',90000,4),
(4,5,'06-20-2022',90000,4),
(5,1,'06-20-2022',150000,3),
(5,1,'06-20-2022',150000,3)
go
create view view_1_2
as
select b.BookCode,b.Title,b.Price,Amount
from BookSold bs inner join
Book b on b.BookCode=bs.BookCode
go
create view view_1_3
as
select C.CustomerID,C.CustomerName,C.Address,bs.Amount
from BookSold bs inner join
Customer C on C.CustomerID=bs.CustomerID
go
create view view_1_4
as
select C.CustomerID,C.CustomerName,C.Address,bs.Amount,B.Title
from BookSold bs 
inner join Customer C on C.CustomerID=bs.CustomerID
inner join Book B on B.BookCode=bs.BookCode and  month(EOMONTH(getdate())) - month(EOMONTH(Date))=1
go
create view view_1_5
as
select C.CustomerName,Sum(Price*Amount) as Total
from Customer C
inner join BookSold bs on C.CustomerID=bs.CustomerID
group by C.CustomerName
go
select * from view_1_5
select * from view_1_4
select * from view_1_3
select * from view_1_2
select * from Book
select * from Customer
go