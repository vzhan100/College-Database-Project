--View
CREATE VIEW Benefits AS SELECT E.EmployeeId, P.FirstName, P.LastName, BT.BenefitTypeId, BC.BenefitCoverageId, E.EmployerPremium, E.EmployeePremium
FROM EmployeeBenefits E JOIN PersonInfo P ON  P.PersonId = E.EmployeeId
JOIN BenefitType BT ON BT.BenefitTypeId = E.BenefitTypeId JOIN BenefitCoverage BC ON BC.BenefitCoverageId = E.BenefitCoverId;

--Function
CREATE FUNCTION GetAverageCourseGrade (@CRN AS INT) RETURNS FLOAT AS
	BEGIN
		DECLARE @result FLOAT, @count INT;
		SELECT @count = COUNT(CRN) FROM CourseEnrollment WHERE CRN = @CRN;
		IF @count = 0
			BEGIN SET @result = 'The requested course id does not exist.' END

		ELSE
			BEGIN
				SELECT @result =  AVG(FinalGrade) FROM CourseEnrollment WHERE CRN = @CRN
			END

		RETURN @result
	END


--SP
CREATE PROCEDURE vzhan100.CheckMinCap(
				@CRN AS INT,
				@MinCap AS INT) AS
	DECLARE @TotalCap INT
	DECLARE @CheckCRN INT
	SELECT @TotalCap = (SELECT COUNT(*) FROM CourseEnrollment WHERE @CRN = CRN)
	SELECT @CheckCRN = (SELECT MAX(CRN) FROM CourseEnrollment WHERE @CRN = CRN )
	
	IF @CheckCRN IS NULL
		BEGIN
		Print 'CRN does not exist'
		END

	ELSE IF @TotalCap >= @MinCap
		BEGIN
		Print 'Minimum course capacity is reached.'
		END;

	ELSE
		BEGIN
		DELETE FROM EmployeeCourse WHERE @CRN = CRN;
		DELETE FROM CourseDailySchedule WHERE @CRN = CRN;
		DELETE FROM CourseEnrollment WHERE @CRN = CRN;
		DELETE FROM CourseSchedule WHERE @CRN = CRN;
		Print 'Minimum capacity not met: Course is removed from the schedule.'
		END;

--SP
CREATE PROCEDURE vzhan100.EnrollStudent(
				@CRN AS INT,
				@EnrollmentStatus INT,
				@StudentId AS VARCHAR(20)) AS
	DECLARE @EnrolledStudent VARCHAR(20)
	DECLARE @Course INT
	DECLARE @MaxSeats INT
	DECLARE @CurrentSeats INT
	SELECT @EnrolledStudent = (SELECT StudentId FROM CourseEnrollment WHERE StudentId = @StudentId AND CRN = @CRN)
	SELECT @Course = (SELECT CRN FROM CourseEnrollment WHERE CRN = @CRN AND StudentId = @StudentId)
	SELECT @MaxSeats = (SELECT MaximumSeating FROM CourseSchedule JOIN ClassRoom ON CourseSchedule.LocationId = ClassRoom.ClassRoomId WHERE CourseSchedule.CRN = @CRN)
	SELECT @CurrentSeats = (SELECT count(*) FROM CourseEnrollment WHERE CRN = @CRN)

	IF @StudentId = @EnrolledStudent AND @CRN = @Course
		BEGIN
		Print 'The student is already enrolled.'
		END;

	ELSE IF @EnrolledStudent IS NULL 
		BEGIN
		IF @CurrentSeats >= @MaxSeats
			BEGIN
			Print 'Maximum Seat Capacity Reached. Cannot Enroll'
			END
		ELSE
			BEGIN
			INSERT INTO CourseEnrollment (StudentId, EnrollmentStatusId ,CRN)
			VALUES (@StudentId, @EnrollmentStatus,@CRN) 
			Print 'Student Enrolled.'
			END
		END;

select count(*) as 'Current Seat Count'from CourseEnrollment where CRN = 900805
select * from CourseSchedule
select * from ClassRoom 
select * from CourseEnrollment
--SP
CREATE PROCEDURE vzhan100.EnterFinalGrade(
				@CRN AS INT,
				@StudentId AS INT,
				@Grade AS INT) AS
	
	IF @Grade > 100
		BEGIN
		UPDATE CourseEnrollment
		SET FinalGrade = 100
		WHERE StudentId = @StudentId AND CRN = @CRN  
		END
	ELSE
		BEGIN
		UPDATE CourseEnrollment
		SET FinalGrade = @Grade
		WHERE StudentId = @StudentId AND CRN = @CRN  
		END;

--SP
CREATE PROCEDURE vzhan100.AnnualRaise(
				@Rate AS FLOAT) AS
		
		DECLARE @total INT
		DECLARE @current INT
		DECLARE @salary INT
		DECLARE PayCursor CURSOR FOR
		SELECT EmployeeId from EmployeeInfo
		OPEN PayCursor;
		FETCH NEXT FROM PayCursor INTO @current
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @salary = (SELECT AnnualSalary FROM EmployeeInfo WHERE EmployeeId = @current)
			SET @total = @salary + ROUND(@salary * @Rate, 0)
			UPDATE EmployeeInfo
			SET AnnualSalary = @total
			WHERE EmployeeId = @current
			FETCH NEXT FROM PayCursor INTO @current
		END
		CLOSE PayCursor
		DEALLOCATE PayCursor