/*
15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
*/
select ma_nhan_vien, ho_ten,ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
from nhan_vien
join trinh_do using(ma_trinh_do)
join bo_phan using(ma_bo_phan)
where ma_nhan_vien in 
(
	select ma_nhan_vien
	from hop_dong 
	where year(ngay_lam_hop_dong) between 2020 and 2021
	group by ma_nhan_vien
	having count(ma_hop_dong) <= 3
);