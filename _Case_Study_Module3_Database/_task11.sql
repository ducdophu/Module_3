/*
11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
*/
select ma_dich_vu_di_kem, ten_dich_vu_di_kem
from dich_vu_di_kem 
join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
join hop_dong using(ma_hop_dong)
join khach_hang using(ma_khach_hang)
join loai_khach using(ma_loai_khach)
where ten_loai_khach = 'Diamond' and (dia_chi like '%Vinh' or dia_chi like '%Quảng Ngãi');