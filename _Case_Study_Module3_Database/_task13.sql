/* 
13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
(Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
*/
select ma_dich_vu_di_kem, ten_dich_vu_di_kem, sum(so_luong) as 'so_luong_dich_vu_di_kem'
from dich_vu_di_kem
join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
group by ma_dich_vu_di_kem
having sum(so_luong) >= all(select sum(so_luong) from hop_dong_chi_tiet group by ma_dich_vu_di_kem);