use QuanLySinhVien;

-- Hiển thị Hiển thị số lượng sinh viên ở từng nơi ở từng nơi
select Address, count(StudentID) as 'Số lượng sinh viên'
from Student
group by Address;

-- Tính điểm trung bình các môn học của mỗi học viên
select M.StudentID, StudentName, avg(Mark) as 'Điểm trung bình các môn học'
from Mark M
join Student S
using(StudentID)
group by M.StudentID;

-- Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 15
select M.StudentID, S.StudentName, avg(Mark) as 'Điểm trung bình các môn học'
from Mark M
join Student S
using(StudentID)
group by M.StudentID
having avg(Mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất
select M.StudentID, S.StudentName, avg(Mark) as 'Điểm trung bình các môn học'
from Mark M
join Student S
using(StudentID)
group by M.StudentID
having avg(Mark) >= all (SELECT AVG(Mark) FROM Mark M GROUP BY M.StudentId);




