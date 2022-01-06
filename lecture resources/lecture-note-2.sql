DROP TABLE Students
DROP TABLE Cities
DROP TABLE Departments
DROP TABLE Faculties
CREATE TABLE Cities(
CityID tinyint PRIMARY KEY,
City nvarchar(20) NOT NULL
);
CREATE TABLE Faculties(
FacultyID tinyint PRIMARY KEY,
Faculty nvarchar(20) NOT NULL
);
CREATE TABLE Departments(
DepartmentID tinyint PRIMARY KEY,
Department nvarchar(20) NOT NULL,
FacultyID tinyint,
CHECK (FacultyID IN (1,2,3)),
FOREIGN KEY (FacultyID)
REFERENCES Faculties(FacultyID)
);
CREATE TABLE Students(
StudentID int,
S_FirstName nvarchar(20) NOT NULL,
S_LastName nvarchar(20) NOT NULL,
S_eMail varchar(50),
CityID tinyint DEFAULT 34,
DepartmentID tinyint NOT NULL,
TCID char(11) UNIQUE,
PRIMARY KEY (StudentID),
FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID),
FOREIGN KEY (CityID)
REFERENCES Cities(CityID)
);
CREATE INDEX ix_fname_lname ON students (S_FirstName,S_LastName);

INSERT INTO Cities (CityID, City) VALUES (1,'Adana')
INSERT INTO Cities (CityID, City) VALUES (34,'İstanbul')
INSERT INTO Cities (CityID, City) VALUES (60,'Tokat')
INSERT INTO Cities (CityID, City) VALUES (35,'İzmirrr')

UPDATE Cities SET City = 'İzmir' WHERE CityID = 35
/*UPDATE Cities SET City = 'İzmir' WHERE City = 'İzmirrr'   less performance and not healthy*/
/*UPDATE Cities SET City = 'Adıyaman', CityID = 2 WHERE CityID = 35   DESTORY İZMİR PUT ADIYAMAN*/