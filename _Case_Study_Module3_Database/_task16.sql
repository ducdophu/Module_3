/*
16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
*/
select ma_nhan_vien, ho_ten
from nhan_vien
where ma_nhan_vien not in 
(
select ma_nhan_vien 
from hop_dong 
where year(ngay_lam_hop_dong) between 2019 and 2021 
group by ma_nhan_vien
);
-- hoặc
/*
select ma_nhan_vien, ho_ten
from nhan_vien
where ma_nhan_vien <> all(select ma_nhan_vien from hop_dong where year(ngay_lam_hop_dong) between 2019 and 2021 group by ma_nhan_vien);
*/