/*
19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
*/
select ma_dich_vu_di_kem, ten_dich_vu_di_kem
from hop_dong_chi_tiet
join dich_vu_di_kem using(ma_dich_vu_di_kem)
where ma_hop_dong in 
(
	select ma_hop_dong
	from hop_dong
	where year(ngay_lam_hop_dong) = 2020
)
and so_luong > 10;