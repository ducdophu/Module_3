use QuanLyBanHang;

-- Thêm dữ liệu vào trong 4 bảng 
insert into Customer
value(1, 'Minh Quan' ,10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into `Order` 
values (1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 1, '2006-03-16', null);

insert into Product (pID, pName, pPrice)
values (1,'May giat', 3),
	   (2,'Tu lanh', 5),
       (3,'Dieu hoa', 7),
       (4,'Quat', 1),
       (5,'Bep dien', 2);
       
insert into OrderDetail 
values (1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

/*
1.Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order.
2.Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách hàng.
3.Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào.
4.Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng
 tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
*/

-- 1.Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order.
select O.oID, oDate, P.pName, (P.pPrice*OD.odQTY) as oPrice
from `Order` O
join OrderDetail OD
on O.oID = OD.oID
join Product P
on OD.pID = P.pID;

-- 2.Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách hàng.
select distinct C.cID, C.cName, P.pName
from Customer C
join `Order` O
on C.cID = O.cID
join OrderDetail OD
on O.oID = OD.oID
join Product P
on OD.pID = P.pID;

-- 3.Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào.
select C.cID, C.cName
from Customer C
left join `Order` O
on C.cID = O.cID
where O.oID is null;

-- 4.Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng
-- tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice).
select O.oID, oDate, sum(P.pPrice*OD.odQTY) as oTotalPrice
from `Order` O
join OrderDetail OD
on O.oID = OD.oID
join Product P
on OD.pID = P.pID
group by OD.oID;
