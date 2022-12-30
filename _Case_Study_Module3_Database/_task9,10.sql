/*
9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
*/
select month(ngay_lam_hop_dong) as 'Tháng', count(ma_khach_hang) as 'Số lượng khách hàng'
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong) 
order by month(ngay_lam_hop_dong);

/*
10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
*/
select ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, if( hdct.ma_hop_dong is null , 0, sum(so_luong)) as 'so_luong_dich_vu_di_kem'
from hop_dong
left join hop_dong_chi_tiet hdct using(ma_hop_dong)
left join dich_vu_di_kem using(ma_dich_vu_di_kem)
group by ma_hop_dong;