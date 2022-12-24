use QuanLySinhVien;

-- 1.Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
-- select *
-- from `Subject` sb
-- order by sb.Credit desc
-- limit 2;
select *
from `Subject` sb
where Sb.Credit = (select max(sb.Credit) from `Subject` sb);

-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất
select SubID, SubName, Mark
from `Subject` sb
join Mark M
using (SubID)
where M.Mark = (select max(Mark) from Mark);

-- 3.Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select StudentID, StudentName, Address, avg(M.Mark) as 'Điểm trung bình các môn'
from Student S
inner join Mark M
using (StudentID)
group by StudentID
order by avg(M.Mark) desc;










