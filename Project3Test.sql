--Selecting the View
select * from Benefits;

--Function Test
select * from CourseEnrollment;
select vzhan100.GetAverageCourseGrade(900815);

--SP with Cursor Test
exec AnnualRaise 0.02;
select * from EmployeeInfo;

--SP with Update
select * from CourseEnrollment;
exec EnterFinalGrade 900805, 1, 93;
select * from CourseEnrollment;
exec EnterFinalGrade 900805, 1, 105;
select * from CourseEnrollment;

--SP with Delete
select count(*) from CourseEnrollment where CRN = 900815;
select * from CourseEnrollment
exec CheckMinCap 900000, 10;
exec CheckMinCap 900815, 10;
exec CheckMinCap 900805, 1;
select count(*) from CourseEnrollment where CRN = 900815;
select * from CourseEnrollment;
select * from EmployeeCourse;
select * from CourseDailySchedule;
select * from CourseSchedule;

--SP Bonus
select count(*) as 'Current Seat Count' from CourseEnrollment where CRN = 900805;
exec EnrollStudent 900805, 1, 2;
exec EnrollStudent 900805, 1, 1;
exec EnrollStudent 900815, 1, 1;
select * from CourseSchedule;
select * from ClassRoom;
select * from CourseEnrollment;



