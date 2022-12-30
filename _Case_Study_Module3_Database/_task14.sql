/* 
14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, 
ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
*/
-- select ma_dich_vu_di_kem, count(ma_hop_dong_chi_tiet)
-- from hop_dong_chi_tiet
-- group by ma_dich_vu_di_kem;
--
select ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(ma_hop_dong_chi_tiet) as 'so_lan_su_dung'
from hop_dong
inner join dich_vu using(ma_dich_vu) inner join loai_dich_vu using(ma_loai_dich_vu) 
inner join hop_dong_chi_tiet hdct using(ma_hop_dong) inner join dich_vu_di_kem using(ma_dich_vu_di_kem)
group by ma_hop_dong, ma_dich_vu_di_kem
having ma_dich_vu_di_kem in
(
	select ma_dich_vu_di_kem
	from hop_dong_chi_tiet
	group by ma_dich_vu_di_kem
	having count(ma_hop_dong_chi_tiet) = 1
)
order by ma_hop_dong;
-- hoặc
select ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, ma_dich_vu_di_kem, count(ma_hop_dong_chi_tiet) as 'so_lan_su_dung'
from hop_dong
inner join dich_vu using(ma_dich_vu) inner join loai_dich_vu using(ma_loai_dich_vu) 
inner join hop_dong_chi_tiet hdct using(ma_hop_dong) inner join dich_vu_di_kem using(ma_dich_vu_di_kem)
group by ma_hop_dong, ma_dich_vu_di_kem
having ma_dich_vu_di_kem != 2
order by ma_hop_dong;