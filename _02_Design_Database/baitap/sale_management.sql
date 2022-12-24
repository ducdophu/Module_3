create database `QuanLyBanHang`;
use `QuanLyBanHang`;

create table `Customer`
(
cID int primary key,
cName varchar(20),
cAge int
);

create table `Order`
(
oID int primary key,
cID int,
oDate date,
oTotalPrice double,
foreign key(cID) references `Customer`(cID)
);

create table `Product`
(
pID int primary key,
pName varchar(20),
pPrice double
);

create table `OrderDetail`
(
oID int,
pID int,
odQTY int,
primary key(oID, pID),
foreign key(oID) references `Order`(oID),
foreign key(pID) references `Product`(pID)
);