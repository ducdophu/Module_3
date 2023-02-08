/* 
5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
(Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
cho tất cả các khách hàng đã từng đặt phòng (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
*/
select ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
if (hdct.ma_hop_dong is null, chi_phi_thue, chi_phi_thue + sum(so_luong*gia)) as tong_tien
from khach_hang kh
inner join loai_khach using(ma_loai_khach) 
left join hop_dong using(ma_khach_hang) left join hop_dong_chi_tiet hdct using(ma_hop_dong) left join dich_vu_di_kem using(ma_dich_vu_di_kem) 
left join dich_vu using(ma_dich_vu)
group by ma_khach_hang, ma_hop_dong
order by ma_khach_hang;
-- hoặc 
select ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, sum(so_luong*gia),
if (sum(so_luong*gia) is null, chi_phi_thue, chi_phi_thue + sum(so_luong*gia)) as tong_tien
from khach_hang kh
inner join loai_khach using(ma_loai_khach) 
left join hop_dong using(ma_khach_hang) left join hop_dong_chi_tiet hdct using(ma_hop_dong) left join dich_vu_di_kem using(ma_dich_vu_di_kem) 
left join dich_vu using(ma_dich_vu)
group by ma_khach_hang, ma_hop_dong
order by ma_khach_hang;