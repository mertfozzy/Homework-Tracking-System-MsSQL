-- Mert Altuntaş 1804010005

/*
CREATE TABLE syntax
CREATE TABLE tablename(
column1 data type [constraint][,
column2 data type [constraint] ] [,
PRIMARY KEY (column1 [, column2]) ] [,
FOREIGN KEY (column1 [, column2]) REFERENCES tablename] [,
CONSTRAINT constraint] );
*/

DROP TABLE Students
DROP TABLE Cities
DROP TABLE Departments
DROP TABLE Faculties


--cities
CREATE TABLE Cities (
	CityID tinyint PRIMARY KEY,
	City nvarchar(20) NOT NULL
);

--faculties
CREATE TABLE Faculties(
	FacultyID tinyint PRIMARY KEY,
	Faculty nvarchar(20) NOT NULL
);

--departments
CREATE TABLE Departments(
	DepartmentID tinyint PRIMARY KEY,
	Department nvarchar(20) NOT NULL,
	FacultyID tinyint,
	FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

CREATE TABLE Students(
	StudentID int,
	S_FirstName nvarchar(20) NOT NULL,
	S_LastName nvarchar(20) NOT NULL,
	S_eMail varchar(50),
	CityID tinyint NOT NULL,
	DepartmentID tinyint NOT NULL,
	PRIMARY KEY (StudentID),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
	FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);