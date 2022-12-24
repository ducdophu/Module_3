use `QuanLySinhVien`;

-- 1.Hiển thị danh sách tất cả các học viên
select *
from `Student`;

-- 2.Hiển thị danh sách các học viên đang theo học
select *
from `Student`
where `status` = true;
/*
select *
from `Student`
where `status` = 1;
*/

-- 3.Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ
select *
from `Subject`
where `Credit` < 10;

-- 4.Hiển thị danh sách học viên lớp A1
select StudentID, StudentName, ClassName, c.ClassID
from Student s join Class c
on s.ClassID = c.ClassID
where c.ClassName ='A1';

-- Hiển thị điểm môn CF của các học viên
select S.StudentID, StudentName, ClassID, SubName, Mark
from Student S
join Mark M
on S.StudentID = M.StudentID
join `Subject` Sb
on M.SubID = Sb.SubID
where SubName = 'CF';
