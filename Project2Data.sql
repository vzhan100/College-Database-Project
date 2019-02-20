USE CSE581projects;

INSERT INTO College VALUES	('eng','Engineering'),
							('arch','Architecture'), 
							('arts','Arts & Science'), 
							('ba','Business'), 
							('new','NewHouse'), 
							('it','iSchool');

INSERT INTO Department VALUES	('adv','Advertising'), 
								('acc','Accounting'), 
								('art','Art'), 
								('its','Information Technology'), 
								('arc','Architecture'), 
								('cs','Computer Science');

INSERT INTO StudentStatus VALUES('active'),
								('suspended'),
								('inactive');

INSERT INTO StudentType VALUES	('New Freshmen'),
								('Continue'),
								('Transfer'),
								('Re-Admitted'),
								('New Graduate'),
								('Continue Graduate');

INSERT INTO States VALUES	('NY','New York'),
							('CA','California'),
							('VT','Vermont'),
							('OH','Ohio'),
							('NJ','New Jersey'),
							('FL','Florida');

INSERT INTO Country VALUES	('USA','United States of America'),
							('CHN','China'),
							('MEX','Mexico'),
							('SKR','South Korea'),
							('CAN','Canada'),
							('GER','Germany');

INSERT INTO CourseLevel VALUES	('Undergraduate'),
								('Graduate'),
								('Doctorate'),
								('Super-Genius');

INSERT INTO Gender VALUES	('Male'),
							('Female'),
							('Transgender'),
							('Pan');

INSERT INTO Race VALUES	('White'),
						('Black'),
						('Hispanic'),
						('Asian'),
						('Native American');

INSERT INTO EnrollmentStatus VALUES	('Full-Time'),
									('Half-Time'),
									('Part-Time');

INSERT INTO SemesterText VALUES	('Fall'),
								('Spring'),
								('SS1'),
								('SS2'),
								('Combined SS');

INSERT INTO ProjectorInfo VALUES('Pojector1'),
								('Projector2'),
								('Projector3'),
								('Projector4'),
								('Projector5');

INSERT INTO Buildings VALUES	('Link Hall'),
								('Carnegie Library'),
								('Bird Library'),
								('Lyman Hall'),
								('Sci-Tech');

INSERT INTO JobTypeDetail VALUES('Lecturer'),
								('Assist. Prof.'),
								('Assoc. Prof.'),
								('Full Prof.'),
								('Staff');

INSERT INTO BenefitType VALUES('Self Only'),
								('With Children'),
								('With Spouse'),
								('With Family');

INSERT INTO BenefitCoverage VALUES	('Health'),
									('Vision'),
									('Dental'),
									('Emergency');

INSERT INTO Addresses VALUES('123 Sesame Street', NULL, 'Barney City','NY', '12345', 'USA' ),
							('456 University Place', '100 Comstock Ave.', 'Syracuse','NY', '13210', 'USA' ),
							('201 Ernie Stree', NULL, 'Columbus','OH', '99999', 'USA' ),
							('12 Gangnam Street', NULL, 'Seoul','NJ', '12345', 'SKR' ),
							('765 Where Ave.', 'Waldo Street', 'Sienna','FL', '12345', 'CHN' ),
							('432 Space Ave.', NULL, 'Los Angeles','CA', '12332', 'USA' );

INSERT INTO MajorMinor VALUES	('eng', 'Computer Science'),
								('ba', 'Accounting'),
								('new', 'Communications'),
								('eng', 'Civil Engineering'),
								('arts', 'Drawing');

INSERT INTO PersonInfo VALUES	('jsy101', 'Jaesuk', 'Yoo', NULL, 'grasshoppa99', 1, 1, '03-28-1965', '123-01-4567', 1, NULL, '1002561111', 'grasshopper123@gmail.com'),
								('kjk102', 'Jong Kook', 'Kim', NULL, 'sparta98', 1, 2, '01-01-1970', '163-56-3278', 2, 4, '1002561112', 'spartakjk123@gmail.com'),
								('sjh103', 'Jihyo', 'Song', NULL, 'blank97', 2, 2, '07-03-1975', '934-23-7654', 3, NULL, '1002561113', 'mongji123@gmail.com'),
								('lks104', 'Kwang Soo', 'Lee', NULL, 'girafe96', 1, 4, '12-12-1978', '163-14-9534', 4, NULL, '1002561114', 'girafe123@gmail.com'),
								('hdh105', 'Dong Hoon', 'Ha', NULL, 'pororo95', 1, 4, '03-11-1970', '146-12-7467', 5, NULL, '1002561115', 'pororo123@gmail.com'),
								('kg106', 'Gary', 'Kang', NULL, 'monday94', 1, 3, '08-21-1973', '568-14-9246', 6, NULL, '1002561116', 'mondaycouple123@gmail.com'),
								('jsj107', 'Suk', 'Ji', 'Jin', 'impala93', 1, 4, '06-02-1960', '193-15-3209', 4, 1, '1002561117', 'impala123@gmail.com'),
								('khn108', 'Hanna', 'Kang', NULL, 'hanna92', 2, 4, '06-12-1969', '133-15-6509', 4, 1, '1002561118', 'hanna123@gmail.com'),
								('khd109', 'Ho', 'Kang', 'Dong', 'piggy91', 1, 4, '04-02-1960', '673-45-3609', 4, 1, '1002561119', 'piggy123@gmail.com');

INSERT INTO StudentInfo VALUES	(1,1,1, 0),
								(2,2,1, 0),
								(3,3,2, 0),
								(4,4,1, 1),
								(5,5,3, 1);

INSERT INTO StudentAreaOfStudy VALUES(1,1,1),
									(2,2,1),
									(3,3,1),
									(4,4,1),
									(5,5,1);

INSERT INTO EmployeeInfo VALUES	(6, 65000),
								(7, 70000),
								(8, 75000),
								(9, 80000);

INSERT INTO EmployeeBenefits VALUES	(6,1,1,1100, 5000),
								(7,2,2,2000, 7500),
								(8,3,3,5340, 11823),
								(9,4,4, 100, 1000);

INSERT INTO JobInfo VALUES	('Dean of Engineering', 'Oversees engineer curriculum and teaches courses', 'PhD in any engineering field and 5+ years of experience',80000, 150000, 1, 4 ),
							('CS Professor', 'Teaches CS courses', 'PhD in any engineering field and 5+ years of experience',60000, 100000, 1, 4 ),
							('Market Analyst', 'Research markets and teach part-time', 'PhD in education or 5+ years of market experience',50000, 90000, 1, 2 ),
							('Career Counselor', 'Guides students in their careers', '5+ years of counseling experience and BA in Education',60000, 110000, 1, 5 );

INSERT INTO EmployeeJobs VALUES	(1,6),
								(2,7),
								(3,8),
								(4,9);

INSERT INTO SemesterInfo VALUES	(1,2018, 'August 28th', 'December 12th'),
								(2,2019, 'January 16th', 'May 9th'),
								(3,2019, 'May 12th', 'June 12th'),
								(4,2019, 'June 16', 'August 16th'),
								(5,2019, 'May 20th', 'August 16th');

INSERT INTO CourseCatalog VALUES('CIS', 102, 'Intro to Programming', 'Basics of coding and oop principles using Java', 'cs', 1, 4),
								('ADV', 488, 'Entrepreneurial Marketing', 'Business management and marketing principles to succeed in starting a business', 'adv', 2, 3),
								('IST', 344, 'Information Reporting', 'Lean how to present data and improve public speaking', 'its', 1, 3),
								('CIS', 544, 'Object Oriented C++', 'Learn C++ syntax and oop principles', 'cs', 1, 3),
								('ADV', 788, 'CEO Training', 'Learn how to sucessfuly advertise and market to consumers and clients', 'adv', 4, 4),
								('ART', 101, 'Intro to Drawing', 'Learn how to do basic sketches and familiarize students with proper terminology', 'art', 1, 4),
								('ARC', 101, 'Architecture 101', 'Basics design and planning of buildings', 'arc', 1, 3),
								('ACC', 110, 'Accounting I', 'Basic spreadsheet calculations and rules of the firm', 'acc', 1, 4),
								('ACC', 210, 'Accounting II', 'Advance accounting principle and strategies', 'acc', 1, 4),
								('ART', 500, 'Become Bob Ross', 'Learn how to become as skillful as Bob Ross', 'art', 3, 4);

INSERT INTO Prerequisites VALUES('CIS', 544, 'CIS', 102),
								('ADV', 788, 'ADV', 488),
								('ART', 500, 'ART', 101),
								('ACC', 210, 'ACC', 110);

INSERT INTO ClassRoom VALUES(1, 1, 100, 1, 3, 50, 'ClassRoom'),
							(2, 2, 214, 2, 2, 46, 'LibraryRoom'),
							(3, 3, 302, 3, 4, 15, 'Tech-Team Room'),
							(4, 4, 410, 4, 2, 48, 'Lecture Hall'),
							(5, 5, 500, 5, 1, 35, 'Computer Lab');

INSERT INTO CourseSchedule VALUES	(900805, 'CIS', 102, 'M100', 1, 1),
									(900815, 'ADV', 488, 'M100', 1, 2),
									(900825, 'IST', 344, 'M100', 5, 5),
									(900835, 'CIS', 544, 'M100', 2, 1),
									(900845, 'ADV', 788, 'M100', 2, 2),
									(900855, 'ART', 101, 'M100', 3, 3),
									(900865, 'ARC', 101, 'M100', 1, 3),
									(900875, 'ACC', 110, 'M100', 1, 4),
									(900885, 'ACC', 210, 'M100', 2, 4),
									(900895, 'ART', 500, 'M100', 4, 5);

INSERT INTO CourseEnrollment VALUES	(1, 900805, 1, 98, 93),
									(2, 900815, 1, 90, 89),
									(3, 900825, 1, 85, 91),
									(1, 900835, 1, 98, 98),
									(2, 900845, 1, 73, 90),
									(4, 900855, 1, 80, 95),
									(3, 900865, 1, 87, 93),
									(5, 900875, 1, 90, 90),
									(5, 900885, 1, 82, 89),
									(4, 900895, 1, 91, 99);

INSERT INTO CourseDailySchedule VALUES	(900805, 'Mon-Wed', 9, 30, 11, 35),
										(900815, 'T-TH', 9, 30, 11, 35),
										(900825, 'Mon-Wed', 11, 45, 1, 05),
										(900835, 'Mon-Wed', 8, 00, 9, 20),
										(900845, 'Wed-Fri', 15, 45, 17, 05),
										(900855, 'Mon-Fri', 15, 45, 17, 05),
										(900865, 'Fri', 9, 30, 12, 15),
										(900875, 'T-TH', 13, 30, 14, 45),
										(900885, 'T-TH', 15, 45, 17, 05),
										(900895, 'Mon', 18, 30, 20, 30);

INSERT INTO EmployeeCourse VALUES	(900805, 6),
									(900815, 6),
									(900825, 8),
									(900835, 7),
									(900845, 8),
									(900855, 8),
									(900865, 6),
									(900875, 8),
									(900885, 8),
									(900895, 6);

