use `QuanLySinhVien`;

insert into `Class`(`ClassID`,`ClassName`,`StartDate`,`Status`)
value(1,'A1','2008-12-20',1);
insert into `Class`(`ClassID`,`ClassName`,`StartDate`,`Status`)
value(2, 'A2', '2008-12-22', 1);
insert into `Class`(`ClassID`,`ClassName`,`StartDate`,`Status`)
value(3, 'B3', current_date, 0);

INSERT INTO `Student` (StudentName, Address, Phone, `Status`, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO `Student` (StudentName, Address, `Status`, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO `Student` (StudentName, Address, Phone, `Status`, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

insert into `Subject`
value(1, 'CF', 5, 1),
	(2, 'C', 6, 1),
	(3, 'HDJ', 5, 1),
	(4, 'RDBMS', 10, 1);
    
insert into `Mark` (SubId, StudentId, Mark, ExamTimes)
value (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);






