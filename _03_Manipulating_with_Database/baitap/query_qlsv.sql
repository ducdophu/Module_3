use `QuanLySinhVien`;

-- 1.Hiển thị tất cả các sinh viên có tên bắt đầu bằng ký tự ‘h’.
select *
from `Student`
where StudentName like 'h%';

-- 2.Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from `Class`
where month(StartDate) = 12;

-- 3.Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from `Subject`
where Credit between 3 and 5;

-- 4.Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student
set ClassID = 2
where StudentName = 'Hung';

-- 5.Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select StudentName, SubName, Mark
from `Student` S
join Mark M
on S.StudentID = M.StudentID 
join `Subject` Sb
on M.SubID = Sb.SubID
order by Mark desc, StudentName asc;
