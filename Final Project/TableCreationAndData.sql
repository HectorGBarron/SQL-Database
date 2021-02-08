
CREATE TABLE Gender (
    GenderID int IDENTITY(1,1) PRIMARY KEY,
	Gender varchar(20) NOT NULL
);





CREATE TABLE Employee (
    EmployeeID int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
	GenderID int NOT NULL FOREIGN KEY REFERENCES Gender(GenderID)
);




CREATE TABLE EmployeeStatusHR (
    StatusID int IDENTITY(1,1) PRIMARY KEY,
	Status varchar(20) NOT NULL
);


CREATE TABLE EmployeeLogHR(
	EmpLog int IDENTITY(1,1) PRIMARY KEY,
	EmployeID int FOREIGN KEY REFERENCES Employee(EmployeeID) NOT NULL,
	Status int FOREIGN KEY REFERENCES EmployeeStatusHR(StatusID) NOT NULL,
	RecordDate Date NOT NULL
);


CREATE TABLE ManufacturingStage(
	MfgStgID int IDENTITY (1,1) PRIMARY KEY,
	MfgStg varchar(255) NOT NULL
);


CREATE TABLE MfgStgRole (
	MfgStgRoleId int IDENTITY (1,1) PRIMARY KEY,
	MfgStgID int FOREIGN KEY REFERENCES ManufacturingStage (MfgStgID) NOT NULL,
	MfgStgRole varchar(255) NOT NULL
);




CREATE TABLE MfgStgActivity(
	MfgRoleActID int IDENTITY (1,1) PRIMARY KEY,
	MfgStgID int FOREIGN KEY REFERENCES ManufacturingStage (MfgStgID) NOT NULL,
	MfgRoleActivity varchar(255) NOT NULL
);



CREATE TABLE EmployeeRole (
	EmpRoleID int IDENTITY (1,1) PRIMARY KEY,
	EmployeeID int FOREIGN KEY REFERENCES Employee(EmployeeId) NOT NULL,
	MfgStgRoleID int FOREIGN KEY REFERENCES MfgStgRole(MfgStgRoleID) NOT NULL,
	RecordDate Date NOT NULL
);




CREATE TABLE ActivityTracker (
	ActID int IDENTITY (1,1) PRIMARY KEY,
	EmpRoleID int FOREIGN KEY REFERENCES EmployeeRole NOT NULL,
	MfgRoleActID int FOREIGN KEY references MfgStgActivity (MfgRoleActID) NOT NULL,
	Initial  DateTime NOT NULL,
	Finish DateTime NOT NULL
);



insert into Gender (Gender) values ('Female');
insert into Gender (Gender) values ('Male');


insert into EmployeeStatusHR(Status) values('Active');
insert into EmployeeStatusHR(Status) values('Inactive');

insert into Employee(LastName,FirstName,GenderID) values('Spears', 'Roberto', 2);
insert into Employee(LastName,FirstName,GenderID) values('Gutierrez', 'Davon', 2);
insert into Employee(LastName,FirstName,GenderID) values('Pruitt', 'Harry', 2);
insert into Employee(LastName,FirstName,GenderID) values('Mcintosh', 'Waylon', 2);
insert into Employee(LastName,FirstName,GenderID) values('Marks', 'Tommy', 2);
insert into Employee(LastName,FirstName,GenderID) values('Dudley', 'Willow', 2);
insert into Employee(LastName,FirstName,GenderID) values('Hampton', 'Laila', 1);
insert into Employee(LastName,FirstName,GenderID) values('Stark', 'Lana', 1);
insert into Employee(LastName,FirstName,GenderID) values('Keith', 'Rowan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Anthony', 'Heaven', 1);
insert into Employee(LastName,FirstName,GenderID) values('Farley', 'Henry', 2);
insert into Employee(LastName,FirstName,GenderID) values('Reese', 'Reynaldo', 2);
insert into Employee(LastName,FirstName,GenderID) values('Gilbert', 'Tyshawn', 2);
insert into Employee(LastName,FirstName,GenderID) values('Santos', 'Kolten', 2);
insert into Employee(LastName,FirstName,GenderID) values('Mckee', 'Paisley', 1);
insert into Employee(LastName,FirstName,GenderID) values('Rosales', 'Gage', 1);
insert into Employee(LastName,FirstName,GenderID) values('Foley', 'Madelyn', 1);
insert into Employee(LastName,FirstName,GenderID) values('Sosa', 'Ashleigh', 1);
insert into Employee(LastName,FirstName,GenderID) values('Cain', 'Colton', 2);
insert into Employee(LastName,FirstName,GenderID) values('Valentine', 'Laylah', 1);
insert into Employee(LastName,FirstName,GenderID) values('Fletcher', 'Tyler', 2);
insert into Employee(LastName,FirstName,GenderID) values('Ford', 'Nancy', 1);
insert into Employee(LastName,FirstName,GenderID) values('Lopez', 'Trace', 1);
insert into Employee(LastName,FirstName,GenderID) values('Peck', 'Chloe', 1);
insert into Employee(LastName,FirstName,GenderID) values('Rojas', 'Lillianna', 1);
insert into Employee(LastName,FirstName,GenderID) values('Townsend', 'Jordan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Aguilar', 'Branden', 2);
insert into Employee(LastName,FirstName,GenderID) values('Buckley', 'Milton', 2);
insert into Employee(LastName,FirstName,GenderID) values('Rich', 'Annabella', 1);
insert into Employee(LastName,FirstName,GenderID) values('Coffey', 'Callum', 2);
insert into Employee(LastName,FirstName,GenderID) values('Fox', 'Alejandro', 2);
insert into Employee(LastName,FirstName,GenderID) values('Whitney', 'Jamiya', 1);
insert into Employee(LastName,FirstName,GenderID) values('Joyce', 'Kamari', 1);
insert into Employee(LastName,FirstName,GenderID) values('Townsend', 'Brooklyn', 1);
insert into Employee(LastName,FirstName,GenderID) values('Pitts', 'Taniyah', 1);
insert into Employee(LastName,FirstName,GenderID) values('Watkins', 'Jaquan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Norris', 'Heath', 2);
insert into Employee(LastName,FirstName,GenderID) values('Griffith', 'Melody', 1);
insert into Employee(LastName,FirstName,GenderID) values('Bass', 'Yael', 2);
insert into Employee(LastName,FirstName,GenderID) values('Riddle', 'Mason', 2);
insert into Employee(LastName,FirstName,GenderID) values('Monroe', 'Amari', 1);
insert into Employee(LastName,FirstName,GenderID) values('Bryan', 'Alena', 1);
insert into Employee(LastName,FirstName,GenderID) values('Sexton', 'Dulce', 1);
insert into Employee(LastName,FirstName,GenderID) values('Levine', 'Oswaldo', 2);
insert into Employee(LastName,FirstName,GenderID) values('Ibarra', 'Reagan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Santos', 'Callum', 2);
insert into Employee(LastName,FirstName,GenderID) values('Barber', 'Jaydin', 1);
insert into Employee(LastName,FirstName,GenderID) values('Black', 'Cortez', 2);
insert into Employee(LastName,FirstName,GenderID) values('Cline', 'Maggie', 1);
insert into Employee(LastName,FirstName,GenderID) values('Washington', 'Ronan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Briggs', 'Giovani', 2);
insert into Employee(LastName,FirstName,GenderID) values('Hayden', 'Layla', 1);
insert into Employee(LastName,FirstName,GenderID) values('Park', 'Isabella', 1);
insert into Employee(LastName,FirstName,GenderID) values('Werner', 'Teagan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Flores', 'Noemi', 1);
insert into Employee(LastName,FirstName,GenderID) values('Church', 'Augustus', 2);
insert into Employee(LastName,FirstName,GenderID) values('Greer', 'Isabel', 1);
insert into Employee(LastName,FirstName,GenderID) values('Arias', 'Damian', 2);
insert into Employee(LastName,FirstName,GenderID) values('Walsh', 'Elias', 2);
insert into Employee(LastName,FirstName,GenderID) values('Cordova', 'Litzy', 1);
insert into Employee(LastName,FirstName,GenderID) values('Odom', 'Mariyah', 1);
insert into Employee(LastName,FirstName,GenderID) values('Mora', 'Marlon', 2);
insert into Employee(LastName,FirstName,GenderID) values('Horne', 'Logan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Carr', 'Helena', 1);
insert into Employee(LastName,FirstName,GenderID) values('Donovan', 'Daphne', 1);
insert into Employee(LastName,FirstName,GenderID) values('Hansen', 'Yusuf', 2);
insert into Employee(LastName,FirstName,GenderID) values('Madden', 'Waylon', 2);
insert into Employee(LastName,FirstName,GenderID) values('Vazquez', 'Isabell', 1);
insert into Employee(LastName,FirstName,GenderID) values('Baxter', 'Landin', 2);
insert into Employee(LastName,FirstName,GenderID) values('Cooper', 'Weston', 2);
insert into Employee(LastName,FirstName,GenderID) values('Crawford', 'Teagan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Bryant', 'Nathanial', 2);
insert into Employee(LastName,FirstName,GenderID) values('Benjamin', 'Finley', 2);
insert into Employee(LastName,FirstName,GenderID) values('Clayton', 'Kash', 2);
insert into Employee(LastName,FirstName,GenderID) values('Strong', 'Chance', 2);
insert into Employee(LastName,FirstName,GenderID) values('Lawrence', 'Aaliyah', 1);
insert into Employee(LastName,FirstName,GenderID) values('Martinez', 'Amare', 1);
insert into Employee(LastName,FirstName,GenderID) values('Mcgrath', 'Troy', 2);
insert into Employee(LastName,FirstName,GenderID) values('Blevins', 'Kevin', 2);
insert into Employee(LastName,FirstName,GenderID) values('Irwin', 'Braylon', 2);
insert into Employee(LastName,FirstName,GenderID) values('Shields', 'Gianna', 1);
insert into Employee(LastName,FirstName,GenderID) values('Cabrera', 'Nadia', 1);
insert into Employee(LastName,FirstName,GenderID) values('Mcintyre', 'Julian', 2);
insert into Employee(LastName,FirstName,GenderID) values('Greer', 'Jaida', 1);
insert into Employee(LastName,FirstName,GenderID) values('English', 'Dawson', 1);
insert into Employee(LastName,FirstName,GenderID) values('Casey', 'Kaleigh', 1);
insert into Employee(LastName,FirstName,GenderID) values('Cantu', 'Amber', 1);
insert into Employee(LastName,FirstName,GenderID) values('Preston', 'Kadyn', 1);
insert into Employee(LastName,FirstName,GenderID) values('Clayton', 'Ezra', 2);
insert into Employee(LastName,FirstName,GenderID) values('Skinner', 'Scarlett', 1);
insert into Employee(LastName,FirstName,GenderID) values('Holmes', 'Alexia', 1);
insert into Employee(LastName,FirstName,GenderID) values('Collier', 'Roderick', 2);
insert into Employee(LastName,FirstName,GenderID) values('Kent', 'Uriel', 2);
insert into Employee(LastName,FirstName,GenderID) values('Skinner', 'Iris', 1);
insert into Employee(LastName,FirstName,GenderID) values('Osborne', 'Connor', 2);
insert into Employee(LastName,FirstName,GenderID) values('Henderson', 'Elianna', 1);
insert into Employee(LastName,FirstName,GenderID) values('Mcdaniel', 'Beckham', 2);
insert into Employee(LastName,FirstName,GenderID) values('Fischer', 'Evan', 2);
insert into Employee(LastName,FirstName,GenderID) values('Perez', 'Nevaeh', 2);
insert into Employee(LastName,FirstName,GenderID) values('Burns', 'Keon', 2);




insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(1, 1, '2019-6-27');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(2, 1, '2017-5-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(3, 1, '2011-7-3');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(4, 1, '2011-12-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(5, 1, '2019-12-6');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(6, 1, '2019-7-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(7, 1, '2014-7-9');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(8, 1, '2013-12-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(9, 1, '2013-5-1');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(10, 1, '2017-2-16');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(11, 1, '2010-12-25');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(12, 1, '2020-3-4');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(13, 1, '2012-8-23');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(14, 1, '2015-3-30');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(15, 1, '2019-7-22');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(16, 1, '2017-1-5');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(17, 1, '2013-4-5');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(18, 1, '2011-5-11');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(19, 1, '2012-6-16');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(20, 1, '2017-11-19');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(21, 1, '2012-2-23');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(22, 1, '2017-7-7');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(23, 1, '2013-9-26');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(24, 1, '2013-2-16');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(25, 1, '2019-8-2');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(26, 1, '2010-3-31');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(27, 1, '2016-12-24');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(28, 1, '2015-2-8');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(29, 1, '2011-5-10');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(30, 1, '2013-7-27');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(31, 1, '2013-8-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(32, 1, '2014-8-8');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(33, 1, '2014-11-30');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(34, 1, '2012-4-1');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(35, 1, '2011-8-19');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(36, 1, '2012-12-8');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(37, 1, '2010-9-26');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(38, 1, '2010-12-3');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(39, 1, '2019-5-30');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(40, 1, '2019-6-26');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(41, 1, '2017-3-31');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(42, 1, '2014-8-8');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(43, 1, '2012-9-12');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(44, 1, '2012-7-26');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(45, 1, '2020-6-9');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(46, 1, '2015-6-23');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(47, 1, '2015-2-16');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(48, 1, '2015-9-2');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(49, 1, '2019-9-20');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(50, 1, '2016-2-12');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(51, 1, '2014-5-3');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(52, 1, '2019-12-22');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(53, 1, '2010-7-29');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(54, 1, '2017-9-16');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(55, 1, '2010-7-18');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(56, 1, '2014-12-18');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(57, 1, '2017-10-29');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(58, 1, '2017-6-15');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(59, 1, '2020-6-24');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(60, 1, '2014-1-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(61, 1, '2014-12-10');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(62, 1, '2019-3-18');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(63, 1, '2019-12-25');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(64, 1, '2010-8-14');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(65, 1, '2014-12-20');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(66, 1, '2012-6-14');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(67, 1, '2010-4-3');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(68, 1, '2016-11-14');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(69, 1, '2018-4-11');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(70, 1, '2019-11-4');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(71, 1, '2012-3-30');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(72, 1, '2014-6-22');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(73, 1, '2015-5-8');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(74, 1, '2011-6-2');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(75, 1, '2015-2-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(76, 1, '2010-11-21');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(77, 1, '2020-4-8');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(78, 1, '2013-2-9');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(79, 1, '2016-11-19');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(80, 1, '2018-12-7');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(81, 1, '2014-6-26');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(82, 1, '2020-1-15');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(83, 1, '2014-9-18');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(84, 1, '2016-6-3');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(85, 1, '2015-6-7');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(86, 1, '2010-9-3');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(87, 1, '2011-11-5');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(88, 1, '2015-5-23');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(89, 1, '2010-10-17');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(90, 1, '2010-6-20');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(91, 1, '2010-5-23');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(92, 1, '2011-4-14');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(93, 1, '2013-2-27');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(94, 1, '2019-12-1');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(95, 1, '2016-7-2');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(96, 1, '2017-9-6');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(97, 1, '2014-5-23');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(98, 1, '2020-3-11');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(99, 1, '2020-2-2');
insert into EmployeeLogHR (EmployeID,Status,RecordDate) values(100, 1, '2017-4-17');


Insert into ManufacturingStage (MfgStg) values('Winding');
Insert into ManufacturingStage (MfgStg) values('Sizing');
Insert into ManufacturingStage (MfgStg) values('Core and Coil Assembly');
Insert into ManufacturingStage (MfgStg) values('Drying');
Insert into ManufacturingStage (MfgStg) values('Tanking');
Insert into ManufacturingStage (MfgStg) values('Test');
Insert into ManufacturingStage (MfgStg) values('Shipping');



insert into MfgStgRole (MfgStgID, MfgStgRole) values(1, 'General Labor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(1, 'Supervisor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(1, 'Team Lead');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(1, 'Winder 1');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(1, 'Winder 2');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(1, 'Winder 3');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(2, 'Assembler 1');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(2, 'Assembler 2');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(2, 'Assembler 3');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(2, 'General Labor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(2, 'Supervisor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(2, 'Team Lead');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(3, 'Brazing');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(3, 'General Labor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(3, 'Lamination');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(3, 'Supervisor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(3, 'Team Lead');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(3, 'Wiring');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(4, 'General Labor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(4, 'General Log');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(4, 'Supervisor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(4, 'Team Lead');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(4, 'Vaporphase Controller');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(5, 'Accessories Assembler');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(5, 'General Labor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(5, 'Internal Connections 1');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(5, 'Internal Connections 2');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(5, 'Supervisor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(5, 'Team Lead');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(6, 'Dielectric Tester');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(6, 'General Labor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(6, 'Losses Tester');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(6, 'Preeliminary Tester');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(6, 'Supervisor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(6, 'Team Lead');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(7, 'Dismantler I');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(7, 'Dismantler II');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(7, 'General Labor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(7, 'Packing');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(7, 'Supervisor');
insert into MfgStgRole (MfgStgID, MfgStgRole) values(7, 'Team Lead');



insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Lead  wrapping');
insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Lead crimping');
insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Lead brazing');
insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Core Lamination');
insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Core Clamp');
insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Coil Landing');
insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Lead routing');
insert into MfgStgActivity(MfgStgID,MfgRoleActivity) values(3 ,'Top Yoke Lamination');



insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(40, 13,'2018-8-12');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(84, 13,'2018-12-11');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(25, 13,'2020-1-16');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(75, 13,'2018-2-16');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(48, 13,'2018-10-6');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(83, 13,'2019-10-29');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(49, 13,'2017-4-1');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(55, 13,'2019-1-12');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(24, 13,'2019-9-17');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(25, 13,'2018-6-1');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(17, 13,'2018-7-16');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(92, 13,'2017-4-30');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(28, 15,'2018-1-17');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(13, 15,'2020-4-13');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(17, 15,'2018-6-15');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(62, 15,'2020-4-16');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(91, 15,'2019-10-18');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(97, 15,'2020-5-19');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(6, 15,'2020-6-28');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(56, 15,'2019-3-2');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(65, 15,'2019-4-4');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(5, 15,'2018-3-29');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(78, 15,'2018-11-14');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(94, 15,'2018-4-23');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(54, 15,'2019-8-14');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(12, 15,'2019-9-7');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(52, 15,'2017-6-5');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(35, 15,'2019-5-13');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(76, 15,'2019-8-29');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(81, 15,'2018-6-9');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(81, 15,'2017-11-24');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(78, 15,'2019-4-22');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(66, 14,'2020-2-20');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(18, 14,'2019-5-18');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(86, 14,'2019-11-4');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(47, 14,'2019-3-1');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(26, 14,'2017-7-30');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(28, 14,'2020-6-28');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(55, 14,'2018-5-30');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(48, 14,'2018-3-19');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(47, 14,'2019-10-18');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(60, 14,'2017-2-11');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(26, 14,'2017-12-26');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(93, 14,'2019-9-20');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(69, 14,'2020-4-9');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(19, 14,'2019-12-12');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(63, 14,'2017-2-8');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(82, 14,'2019-12-13');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(69, 14,'2018-1-27');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(69, 14,'2018-3-11');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(56, 14,'2019-11-28');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(19, 14,'2017-11-28');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(59, 18,'2017-1-14');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(91, 18,'2018-5-12');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(92, 18,'2018-7-5');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(5, 18,'2019-12-17');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(38, 18,'2018-5-10');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(82, 18,'2020-2-2');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(84, 18,'2018-3-13');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(47, 18,'2018-10-29');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(43, 18,'2018-1-15');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(92, 18,'2020-5-16');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(16, 18,'2018-3-2');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(46, 18,'2018-3-7');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(15, 18,'2018-10-17');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(40, 18,'2017-5-18');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(86, 18,'2020-4-24');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(86, 18,'2017-12-26');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(25, 17,'2019-9-5');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(80, 17,'2017-4-22');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(47, 17,'2018-8-31');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(22, 17,'2020-3-6');
insert into EmployeeRole(EmployeeID,MfgStgRoleID,RecordDate) values(37, 16,'2020-2-11');



insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(13, 4, '20200104 13:11:00', '20200104 14:16:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(14, 4, '20200106 16:22:00', '20200106 17:27:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(11, 4, '20200106 21:44:00', '20200106 22:31:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(16, 4, '20200107 17:42:00', '20200107 18:29:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(17, 4, '20200109 21:30:00', '20200109 22:21:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(18, 4, '20200109 14:04:00', '20200109 14:58:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(19, 4, '20200110 13:09:00', '20200110 14:10:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(20, 4, '20200111 06:16:00', '20200111 07:19:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(21, 4, '20200111 17:13:00', '20200111 18:01:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(22, 4, '20200111 15:10:00', '20200111 15:56:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200116 15:11:00', '20200116 16:14:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(24, 4, '20200119 09:28:00', '20200119 10:22:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(25, 4, '20200120 17:31:00', '20200120 18:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(26, 4, '20200120 15:29:00', '20200120 16:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(27, 4, '20200121 16:15:00', '20200121 17:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(28, 4, '20200126 12:39:00', '20200126 13:24:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(29, 4, '20200128 06:18:00', '20200128 07:08:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200130 13:43:00', '20200130 14:37:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200201 17:25:00', '20200201 18:14:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200203 15:21:00', '20200203 16:19:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(33, 4, '20200205 20:10:00', '20200205 21:04:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(34, 4, '20200209 10:26:00', '20200209 11:30:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(35, 4, '20200211 18:12:00', '20200211 19:01:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(36, 4, '20200212 06:23:00', '20200212 07:28:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(37, 4, '20200218 11:42:00', '20200218 12:39:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(13, 4, '20200218 06:13:00', '20200218 07:16:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(14, 4, '20200222 20:25:00', '20200222 21:21:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(11, 4, '20200222 18:42:00', '20200222 19:29:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(16, 4, '20200225 20:17:00', '20200225 21:22:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(17, 4, '20200225 16:15:00', '20200225 17:06:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(18, 4, '20200228 21:05:00', '20200228 22:03:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(19, 4, '20200228 13:27:00', '20200228 14:24:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(20, 4, '20200301 13:22:00', '20200301 14:24:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(21, 4, '20200301 19:37:00', '20200301 20:41:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(22, 4, '20200303 19:19:00', '20200303 20:12:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200303 17:37:00', '20200303 18:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(24, 4, '20200304 13:18:00', '20200304 14:19:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(25, 4, '20200305 11:29:00', '20200305 12:23:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(26, 4, '20200309 14:04:00', '20200309 15:04:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(27, 4, '20200309 15:36:00', '20200309 16:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(28, 4, '20200310 08:29:00', '20200310 09:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(29, 4, '20200316 06:43:00', '20200316 07:45:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200318 18:40:00', '20200318 19:44:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200324 18:26:00', '20200324 19:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200325 12:24:00', '20200325 13:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(33, 4, '20200328 16:02:00', '20200328 17:04:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(34, 4, '20200330 15:18:00', '20200330 16:20:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(35, 4, '20200330 14:47:00', '20200330 15:40:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(36, 4, '20200413 10:49:00', '20200413 11:45:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(37, 4, '20200417 18:28:00', '20200417 19:23:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(13, 4, '20200418 17:25:00', '20200418 18:17:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(14, 4, '20200419 17:13:00', '20200419 18:16:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(11, 4, '20200421 17:46:00', '20200421 18:44:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(16, 4, '20200422 20:24:00', '20200422 21:10:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(17, 4, '20200422 09:19:00', '20200422 10:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(18, 4, '20200422 06:12:00', '20200422 06:57:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(19, 4, '20200430 20:11:00', '20200430 21:07:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(20, 4, '20200430 06:30:00', '20200430 07:31:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(21, 4, '20200502 19:32:00', '20200502 20:29:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(22, 4, '20200503 18:31:00', '20200503 19:17:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200507 21:13:00', '20200507 22:02:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(24, 4, '20200508 12:39:00', '20200508 13:38:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(25, 4, '20200511 19:05:00', '20200511 19:52:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(26, 4, '20200512 21:09:00', '20200512 22:09:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(27, 4, '20200514 16:09:00', '20200514 16:59:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(28, 4, '20200523 13:07:00', '20200523 14:06:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(29, 4, '20200530 09:30:00', '20200530 10:34:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200603 13:29:00', '20200603 14:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200604 18:23:00', '20200604 19:22:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200605 09:35:00', '20200605 10:38:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(33, 4, '20200609 10:46:00', '20200609 11:43:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(34, 4, '20200609 15:12:00', '20200609 15:57:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(35, 4, '20200619 17:23:00', '20200619 18:10:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(36, 4, '20200619 07:17:00', '20200619 08:04:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(37, 4, '20200619 06:39:00', '20200619 07:30:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(13, 4, '20200620 20:17:00', '20200620 21:22:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(14, 4, '20200621 14:21:00', '20200621 15:13:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(11, 4, '20200622 20:13:00', '20200622 21:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(16, 4, '20200629 17:02:00', '20200629 18:00:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(17, 4, '20200629 07:18:00', '20200629 08:17:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(18, 4, '20200630 21:47:00', '20200630 22:37:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(19, 4, '20200701 08:27:00', '20200701 09:16:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(20, 4, '20200704 08:14:00', '20200704 09:09:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(21, 4, '20200708 21:04:00', '20200708 21:52:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(22, 4, '20200708 18:36:00', '20200708 19:27:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200712 19:29:00', '20200712 20:22:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(24, 4, '20200716 17:05:00', '20200716 17:58:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(25, 4, '20200716 15:05:00', '20200716 16:01:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(26, 4, '20200718 09:28:00', '20200718 10:33:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(27, 4, '20200719 20:16:00', '20200719 21:17:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(28, 4, '20200719 11:11:00', '20200719 12:14:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(29, 4, '20200719 16:39:00', '20200719 17:41:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200723 20:07:00', '20200723 21:00:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200724 20:06:00', '20200724 20:54:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200728 12:45:00', '20200728 13:40:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(33, 4, '20200730 20:24:00', '20200730 21:10:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(34, 4, '20200730 10:22:00', '20200730 11:08:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(35, 4, '20200731 11:07:00', '20200731 12:01:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(36, 4, '20200802 11:05:00', '20200802 11:52:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(37, 4, '20200802 16:30:00', '20200802 17:17:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(13, 4, '20200804 21:43:00', '20200804 22:33:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(14, 4, '20200805 16:10:00', '20200805 17:15:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(11, 4, '20200806 16:39:00', '20200806 17:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(16, 4, '20200808 11:18:00', '20200808 12:04:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(17, 4, '20200811 08:20:00', '20200811 09:05:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(18, 4, '20200811 18:39:00', '20200811 19:38:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(19, 4, '20200814 13:38:00', '20200814 14:24:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(20, 4, '20200818 15:16:00', '20200818 16:09:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(21, 4, '20200818 21:32:00', '20200818 22:28:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(22, 4, '20200818 06:40:00', '20200818 07:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200821 12:05:00', '20200821 12:57:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(24, 4, '20200822 11:20:00', '20200822 12:05:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(25, 4, '20200822 18:22:00', '20200822 19:20:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(26, 4, '20200824 17:07:00', '20200824 18:08:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(27, 4, '20200825 07:48:00', '20200825 08:50:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(28, 4, '20200826 16:29:00', '20200826 17:22:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(29, 4, '20200827 17:12:00', '20200827 17:59:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200831 06:50:00', '20200831 07:37:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20200831 21:50:00', '20200831 22:50:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20200907 15:34:00', '20200907 16:25:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(33, 4, '20200908 09:06:00', '20200908 10:00:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(34, 4, '20200908 17:09:00', '20200908 18:00:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(35, 4, '20200911 19:32:00', '20200911 20:20:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(36, 4, '20200911 16:04:00', '20200911 17:02:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(37, 4, '20200920 14:31:00', '20200920 15:31:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(13, 4, '20200925 06:29:00', '20200925 07:17:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(14, 4, '20200929 17:24:00', '20200929 18:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(11, 4, '20200929 12:24:00', '20200929 13:16:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(16, 4, '20200930 14:07:00', '20200930 14:57:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(17, 4, '20201003 11:43:00', '20201003 12:41:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(18, 4, '20201006 16:15:00', '20201006 17:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(19, 4, '20201008 14:20:00', '20201008 15:16:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(20, 4, '20201008 07:48:00', '20201008 08:37:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(21, 4, '20201009 16:43:00', '20201009 17:46:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(22, 4, '20201010 10:38:00', '20201010 11:24:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20201012 10:33:00', '20201012 11:37:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(24, 4, '20201014 08:26:00', '20201014 09:27:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(25, 4, '20201017 13:27:00', '20201017 14:32:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(26, 4, '20201018 08:13:00', '20201018 09:00:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(27, 4, '20201019 21:36:00', '20201019 22:25:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(28, 4, '20201023 06:32:00', '20201023 07:26:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(29, 4, '20201024 17:03:00', '20201024 17:58:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20201026 13:33:00', '20201026 14:37:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(30, 4, '20201026 16:47:00', '20201026 17:32:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(23, 4, '20201102 09:07:00', '20201102 10:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(33, 4, '20201102 13:23:00', '20201102 14:23:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(34, 4, '20201103 14:08:00', '20201103 15:07:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(35, 4, '20201109 15:24:00', '20201109 16:09:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(36, 4, '20201110 12:45:00', '20201110 13:31:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(37, 4, '20201112 12:12:00', '20201112 12:58:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(13, 4, '20201113 09:22:00', '20201113 10:11:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(14, 4, '20201115 16:15:00', '20201115 17:01:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(11, 4, '20201117 08:44:00', '20201117 09:45:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(16, 4, '20201118 13:04:00', '20201118 13:59:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(17, 4, '20201118 08:02:00', '20201118 08:54:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(18, 4, '20201127 13:03:00', '20201127 13:55:00');
insert into ActivityTracker (EmpRoleID,MfgRoleActID,Initial,Finish) values(19, 4, '20201130 09:27:00', '20201130 10:32:00');


create table BiasCorrectionControlChart (
	n INT PRIMARY KEY,
	d2 float,
	c4 float,
	d3 float,
	d4 float

);

insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(2, 1.1284 ,0.7979, 0.8525, 0.9539);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(3, 1.6926 ,0.8862, 0.8884, 1.5878);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(4, 2.0588 ,0.9213, 0.8798, 1.9783);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(5, 2.3259 ,0.94, 0.8641, 2.2569);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(6, 2.5344 ,0.9515, 0.848, 2.4717);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(7, 2.7044 ,0.9594, 0.8332, 2.6455);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(8, 2.8472 ,0.965, 0.8198, 2.7908);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(9, 2.97 ,0.9693, 0.8078, 2.9154);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(10, 3.0775 ,0.9727, 0.7971, 3.0242);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(11, 3.1729 ,0.9754, 0.7873, 3.1205);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(12, 3.2585 ,0.9776, 0.7785, 3.2069);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(13, 3.336 ,0.9794, 0.7704, 3.2849);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(14, 3.4068 ,0.981, 0.763, 3.3562);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(15, 3.4718 ,0.9823, 0.7562, 3.4217);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(16, 3.532 ,0.9835, 0.7499, 3.4821);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(17, 3.5879 ,0.9845, 0.7441, 3.5383);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(18, 3.6401 ,0.9854, 0.7386, 3.5907);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(19, 3.689 ,0.9862, 0.7335, 3.6398);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(20, 3.7349 ,0.9869, 0.7287, 3.6859);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(21, 3.7783 ,0.9876, 0.7242, 3.7294);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(22, 3.8194 ,0.9882, 0.7199, 3.7706);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(23, 3.8583 ,0.9887, 0.7159, 3.8096);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(24, 3.8953 ,0.9892, 0.7121, 3.8468);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(25, 3.9306 ,0.9896, 0.7084, 3.8822);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(26, 3.9643 ,0.9901, 0.705, 3.9159);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(27, 3.9965 ,0.9904, 0.7017, 3.9482);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(28, 4.0274 ,0.9908, 0.6986, 3.9791);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(29, 4.057 ,0.9911, 0.6955, 4.0088);
insert into BiasCorrectionControlChart (n,d2,c4,d3,d4) values(30, 4.0855 ,0.9914, 0.6927, 4.0374);


select * from BiasCorrectionControlChart