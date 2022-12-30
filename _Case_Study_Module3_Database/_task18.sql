/*
18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
*/
select ma_khach_hang, ho_ten
from hop_dong
join khach_hang using(ma_khach_hang)
where year(ngay_lam_hop_dong) < 2021;