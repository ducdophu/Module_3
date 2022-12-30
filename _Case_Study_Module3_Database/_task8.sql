/*
8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
Sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
*/
-- Cách 1
select distinct ho_ten
from khach_hang;
-- Cách 2
select ho_ten
from khach_hang
group by ho_ten;
-- Cách 3
select ho_ten
from khach_hang
union
select ho_ten
from khach_hang