/* 
7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
 đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
*/
select ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu using(ma_loai_dich_vu)
inner join hop_dong using(ma_dich_vu)
where year(ngay_lam_hop_dong) = 2020 and ma_dich_vu not in
(
	select ma_dich_vu
	from dich_vu
	inner join loai_dich_vu using(ma_loai_dich_vu)
	inner join hop_dong using(ma_dich_vu)
	where year(ngay_lam_hop_dong) = 2021
)
group by ma_dich_vu;