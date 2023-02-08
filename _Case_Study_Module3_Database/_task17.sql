/*
17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với
Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
*/
select ma_khach_hang, ho_ten, ma_loai_khach, ten_loai_khach, year(ngay_lam_hop_dong)
from khach_hang
inner join loai_khach using(ma_loai_khach)
inner join hop_dong using(ma_khach_hang)
where ten_loai_khach = 'Platinium' and year(ngay_lam_hop_dong) = 2021
and ma_khach_hang in 
(
	select tong_tien_thanh_toan.ma_khach_hang
	from 
	(
		select ma_khach_hang,
		if (hdct.ma_hop_dong is null, chi_phi_thue, chi_phi_thue + sum(so_luong*gia)) as tong_tien
		from khach_hang kh
		inner join loai_khach using(ma_loai_khach) 
		left join hop_dong using(ma_khach_hang) left join hop_dong_chi_tiet hdct using(ma_hop_dong) left join dich_vu_di_kem using(ma_dich_vu_di_kem) 
		left join dich_vu using(ma_dich_vu)
		group by ma_khach_hang, ma_hop_dong
		order by ma_khach_hang
	) as tong_tien_thanh_toan
	group by tong_tien_thanh_toan.ma_khach_hang
	having sum(tong_tien_thanh_toan.tong_tien) > 10000000
);