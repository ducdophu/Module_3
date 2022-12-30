/*
12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
(được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng 
cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
*/
select ma_hop_dong, nv.ho_ten as 'ho_ten (nhân viên)', kh.ho_ten as 'ho_ten (khách hàng)', kh.so_dien_thoai as 'so_dien_thoai (khách hàng)', 
ten_dich_vu, if( hdct.ma_hop_dong is null , 0, sum(so_luong)) as 'so_luong_dich_vu_di_kem', tien_dat_coc
from hop_dong
join nhan_vien nv using(ma_nhan_vien)
join khach_hang kh using(ma_khach_hang)
join dich_vu using(ma_dich_vu)
left join hop_dong_chi_tiet hdct using(ma_hop_dong)
left join dich_vu_di_kem using(ma_dich_vu_di_kem)
group by ma_hop_dong
order by ma_hop_dong;