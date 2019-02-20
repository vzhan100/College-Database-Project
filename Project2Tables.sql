USE CSE581projects;

CREATE TABLE College (
		CollegeId		VARCHAR(20)	PRIMARY KEY,
		CollegeName		VARCHAR(100)	NOT NULL
	);

CREATE TABLE Department (
		DepartmentId	VARCHAR(20)	PRIMARY KEY,
		DepartmentName	VARCHAR(100)	NOT NULL
	);

CREATE TABLE StudentStatus (
		StudentStatusId	INT		PRIMARY KEY IDENTITY(1,1),
		StudentStatus	VARCHAR(50)	NOT NULL
	);

CREATE TABLE StudentType (
		StudentTypeId	INT		PRIMARY KEY IDENTITY(1,1),
		StudentType		VARCHAR(20)
	);

CREATE TABLE States (
		StateId			VARCHAR(20)	PRIMARY KEY,
		StateName		VARCHAR(100)	NOT NULL
	);

CREATE TABLE Country (
		CountryId			VARCHAR(20)	PRIMARY KEY,
		CountryName			VARCHAR(100)	NOT NULL
	);

CREATE TABLE CourseLevel (
		LevelId			INT		PRIMARY KEY IDENTITY(1,1),
		LevelNum		VARCHAR(20)		NOT NULL
	);

CREATE TABLE Gender (
		GenderId		INT		PRIMARY KEY IDENTITY(1,1),
		GenderType		VARCHAR(20)	NOT NULL
	);

CREATE TABLE Race (
		RaceId			INT		PRIMARY KEY IDENTITY(1,1),
		RaceType		VARCHAR(20)	NOT NULL
	);

CREATE TABLE EnrollmentStatus (
		EnrollmentStatusId		INT		PRIMARY KEY IDENTITY(1,1),
		StatusType				VARCHAR(20)	NOT NULL
	);

CREATE TABLE SemesterText (
		SemesterTextId			INT		PRIMARY KEY IDENTITY(1,1),
		SemesterType			VARCHAR(20)	NOT NULL
	);

CREATE TABLE ProjectorInfo (
		ProjectorId			INT		PRIMARY KEY IDENTITY(1,1),
		ProjectorText		VARCHAR(20)	NOT NULL
	);

CREATE TABLE Buildings (
		BuildingId			INT		PRIMARY KEY IDENTITY(1,1),
		BuildingName		VARCHAR(20)	NOT NULL
	);


CREATE TABLE JobTypeDetail (
		JobTypeDetailId		INT		PRIMARY KEY IDENTITY(1,1),
		JobDetail			VARCHAR(100)
	);

CREATE TABLE BenefitType (
		BenefitTypeId	INT		PRIMARY KEY IDENTITY(1,1),
		Benefit			VARCHAR(20)
	);

CREATE TABLE BenefitCoverage (
		BenefitCoverageId	INT		PRIMARY KEY IDENTITY(1,1),
		Coverage			VARCHAR(70)
	);

CREATE TABLE Addresses (
		AddressId	INT	PRIMARY KEY IDENTITY(1,1),
		Street1		VARCHAR(100) NOT NULL,
		Street2		VARCHAR(100),
		City		VARCHAR(50) NOT NULL,
		StateName	VARCHAR(20) FOREIGN KEY REFERENCES States(StateId) NOT NULL,
		ZIP			VARCHAR(20) NOT NULL,
		Country     VARCHAR(20) FOREIGN KEY REFERENCES Country(CountryId)
);

CREATE TABLE MajorMinor (
		MajorMinorId	INT	PRIMARY KEY IDENTITY(1,1),
		CollegeId		VARCHAR(20) FOREIGN KEY REFERENCES College(CollegeId) NOT NULL,
		StudyTitle		VARCHAR(50)
);

CREATE TABLE PersonInfo (
		PersonId		INT	PRIMARY KEY IDENTITY(1,1),
		NTID			VARCHAR(20),
		FirstName		VARCHAR(50) NOT NULL,
		LastName		VARCHAR(50) NOT NULL,
		MiddleName		VARCHAR(50),
		PasswordText	VARCHAR(50),
		GenderId		INT FOREIGN KEY REFERENCES Gender(GenderId) NOT NULL,
		RaceId			INT FOREIGN KEY REFERENCES Race(RaceId) NOT NULL,
		DOB				VARCHAR(20) NOT NULL,
		SSN				VARCHAR(20),
		HomeAddressId	INT FOREIGN KEY REFERENCES Addresses(AddressId) NOT NULL,
		MailingAddressId	INT FOREIGN KEY REFERENCES Addresses(AddressId),
		CellPhone		VARCHAR(20),
		Email			VARCHAR(100) NOT NULL
);

CREATE TABLE StudentInfo (
		StudentId		INT	PRIMARY KEY NOT NULL,
		StudentTypeId	INT FOREIGN KEY REFERENCES StudentType(StudentTypeId) NOT NULL,
		StudentStatusId	INT FOREIGN KEY REFERENCES StudentStatus(StudentStatusId) NOT NULL,
		IsGraduate		BIT NOT NULL, --Note: 0 is false and 1 is true
		FOREIGN KEY(StudentId) REFERENCES PersonInfo(PersonId)
);

CREATE TABLE StudentAreaOfStudy (
		StudentId		INT	NOT NULL,
		AreaId			INT NOT NULL,
		IsMajor			BIT NOT NULL, --Note: 0 is false and 1 is true
		PRIMARY KEY (StudentId, AreaId),
		FOREIGN KEY(StudentId) REFERENCES StudentInfo(StudentId),
		FOREIGN KEY(AreaId) REFERENCES MajorMinor(MajorMinorId)
);

CREATE TABLE EmployeeInfo (
		EmployeeId		INT	PRIMARY KEY NOT NULL,
		AnnualSalary	INT NOT NULL,
		FOREIGN KEY(EmployeeId) REFERENCES PersonInfo(PersonId)
);

CREATE TABLE EmployeeBenefits (
		EmployeeId		INT NOT NULL,
		BenefitTypeId	INT NOT NULL,
		BenefitCoverId	INT NOT NULL,
		EmployeePremium INT NOT NULL,
		EmployerPremium INT NOT NULL,
		PRIMARY KEY (EmployeeId, BenefitTypeId, BenefitCoverId),
		FOREIGN KEY(EmployeeId) REFERENCES EmployeeInfo(EmployeeId),
		FOREIGN KEY(BenefitTypeId) REFERENCES BenefitType(BenefitTypeId),
		FOREIGN KEY(BenefitCoverId) REFERENCES BenefitCoverage(BenefitCoverageId)
);

CREATE TABLE JobInfo (
		JobId		INT PRIMARY KEY IDENTITY(1,1),
		JobTitle	VARCHAR(50) NOT NULL,
		JobDescription VARCHAR(100), 
		JobRequirements VARCHAR(100) NOT NULL,
		MinPay		INT NOT NULL,
		MaxPay		INT NOT NULL,
		IsFaculty	BIT NOT NULL, --Note: 1 is false and 0 is true
		JobTypeDetailId INT FOREIGN KEY REFERENCES JobTypeDetail(JobTypeDetailId) NOT NULL
);

CREATE TABLE EmployeeJobs (
		JobId		INT NOT NULL,
		EmployeeId	INT NOT NULL,
		PRIMARY KEY (JobId, EmployeeId),
		FOREIGN KEY (JobId) REFERENCES JobInfo(JobId),
		FOREIGN KEY (EmployeeId) REFERENCES EmployeeInfo(EmployeeId)
);

CREATE TABLE SemesterInfo (
		SemesterId	INT PRIMARY KEY IDENTITY(1,1),
		SemesterTextId	INT FOREIGN KEY REFERENCES SemesterText(SemesterTextId) NOT NULL,
		YearInfo	INT NOT NULL,
		FirstDay	VARCHAR(20) NOT NULL,
		LastDay		VARCHAR(20) NOT NULL
);

CREATE TABLE CourseCatalog (
		CourseCode		VARCHAR(5) NOT NULL,
		CourseNumber	INT NOT NULL,
		CourseTitle		VARCHAR(50) NOT NULL,
		CourseDesc		VARCHAR(100),
		DepartmentId	VARCHAR(20) FOREIGN KEY REFERENCES Department(DepartmentId) NOT NULL,
		CourseLevelId	INT FOREIGN KEY REFERENCES CourseLevel(LevelId) NOT NULL,
		CreditHours		INT NOT NULL,
		PRIMARY KEY (CourseCode, CourseNumber)
);

CREATE TABLE Prerequisites (
		PrereqId		INT PRIMARY KEY IDENTITY(1,1),
		ParentCode		VARCHAR(5) NOT NULL,
		ParentNumber	INT NOT NULL,
		ChildCode		VARCHAR(5) NOT NULL,
		ChildNumber		INT NOT NULL,
		FOREIGN KEY (ParentCode, ParentNumber) REFERENCES CourseCatalog(CourseCode, CourseNumber),
		FOREIGN KEY (ChildCode, ChildNumber) REFERENCES CourseCatalog(CourseCode, CourseNumber)
);

CREATE TABLE ClassRoom (
		ClassRoomId		INT PRIMARY KEY IDENTITY(1,1),
		BuildingId		INT FOREIGN KEY REFERENCES Buildings(BuildingId) NOT NULL,
		LevelNumber		INT NOT NULL,
		RoomNumber		INT NOT NULL,
		ProjectorId		INT FOREIGN KEY REFERENCES ProjectorInfo(ProjectorId),
		WhiteBoardCount	INT NOT NULL,
		MaximumSeating	INT NOT NULL,
		TypeIndicator	VARCHAR(20)
);

CREATE TABLE CourseSchedule (
		CRN				INT PRIMARY KEY,
		CourseCode		VARCHAR(5) NOT NULL,
		CourseNumber	INT NOT NULL,
		Section			VARCHAR(10) NOT NULL,
		SemesterId		INT FOREIGN KEY REFERENCES SemesterInfo(SemesterId) NOT NULL,
		LocationId		INT FOREIGN KEY REFERENCES ClassRoom(ClassRoomId),
		FOREIGN KEY (CourseCode, CourseNumber) REFERENCES CourseCatalog(CourseCode, CourseNumber)
);

CREATE TABLE CourseEnrollment (
		StudentId		INT NOT NULL,
		CRN				INT NOT NULL,
		EnrollmentStatusId	INT FOREIGN KEY REFERENCES EnrollmentStatus(EnrollmentStatusId) NOT NULL,
		MidtermGrade	INT,
		FinalGrade		INT,
		PRIMARY KEY (StudentId, CRN),
		FOREIGN KEY (StudentId) REFERENCES StudentInfo(StudentId),
		FOREIGN KEY (CRN) REFERENCES CourseSchedule(CRN),
);

CREATE TABLE CourseDailySchedule (
		DailyId		INT PRIMARY KEY IDENTITY(1,1),
		CRN			INT FOREIGN KEY REFERENCES CourseSchedule(CRN) NOT NULL,
		DayOfTheWeek	VARCHAR(10),
		StartHour		INT, --Chose INT to express time in military time(24 hour clock)
		StartMinute		INT,
		EndHour			INT,
		EndMinute		INT
);

CREATE TABLE EmployeeCourse (
		CRN			INT NOT NULL,
		EmployeeId	INT NOT NULL,
		PRIMARY KEY (CRN, EmployeeId),
		FOREIGN KEY (CRN) REFERENCES CourseSchedule(CRN),
		FOREIGN KEY (EmployeeId) REFERENCES EmployeeInfo(EmployeeId)
);