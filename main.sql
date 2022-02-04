-- Mert Altuntaş 1804010005

--faculty
CREATE TABLE member_faculty(
    faculty_id int UNIQUE NOT NULL,
    faculty_name varchar(50),
    PRIMARY KEY (faculty_id)
);

--department
CREATE TABLE department(
	faculty_id int,
    department_id int UNIQUE NOT NULL,
    department_name varchar(50),
    PRIMARY KEY (department_id),
	FOREIGN KEY (faculty_id) REFERENCES member_faculty(faculty_id)
);

--level
CREATE TABLE member_level(
    level_id int NOT NULL,
    level_name varchar(20),
    PRIMARY KEY (level_id)
);

--main
CREATE TABLE member(
	member_id int UNIQUE NOT NULL,
	username nvarchar(30),
	lastname nvarchar(30),
	member_password varchar(20),
	faculty_id int,
	level_id int,
    phone int,
    mail nvarchar(255),
    adress text,
    tc_identity_num bigint UNIQUE,
    date_of_birth date,
    country varchar(50),
    city varchar(50),
	PRIMARY KEY (member_id),
	FOREIGN KEY (faculty_id) REFERENCES member_faculty(faculty_id),
	FOREIGN KEY (level_id) REFERENCES member_level(level_id)
);

--lectures
CREATE TABLE lectures(
    lecture_id int UNIQUE,
    lecture_name varchar(60),
    credit int,
    lecture_hour int,
    PRIMARY KEY (lecture_id)
);

--document_type
CREATE TABLE document_type(
    type_no int,
    doc_type_name varchar(50),
    start_time datetime2,
    finish_time datetime2,
    PRIMARY KEY (type_no)
);

--member lecture
CREATE TABLE member_lecture(
    member_id int,
    lecture_id int,
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id) 
);

--document
CREATE TABLE document(
    document_id int NOT NULL,
    lecture_id int ,
    type_no int ,
    title varchar(100),
    content text,
    doc_file int,
    PRIMARY KEY (document_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id),
    FOREIGN KEY (type_no) REFERENCES document_type(type_no)
);

--member document
CREATE TABLE member_document(
    member_doc_id int NOT NULL,
    document_id int,
    score int,
    member_id int,
    PRIMARY KEY (member_doc_id),
    FOREIGN KEY (document_id) REFERENCES document(document_id)
);

--message
CREATE TABLE member_messages(
    message_id bigint NOT NULL,
    sender_id int ,
    receiver_id int ,
    title varchar(50),
    content text,
    message_date datetime2 ,
    message_ip int,
    PRIMARY KEY (message_id)
);

/*
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (1, 'Engineering')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (2, 'Logistics')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (3, 'Art & Culture')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (4, 'Social Sciences')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (5, 'Aviation')
*/

/*
INSERT INTO department (department_id, department_name, faculty_id) VALUES (124862, 'Computer Engineering', 1)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (145578, 'Software Engineering', 1)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (122932, 'Industrial Engineering', 1)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (137485, 'Architecture', 1)

INSERT INTO department (department_id, department_name, faculty_id) VALUES (179493, 'Management', 2)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (167972, 'Logistics', 2)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (172196, 'Finance', 2)

INSERT INTO department (department_id, department_name, faculty_id) VALUES (127234, 'Animation', 3)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (104225, 'Game Design', 3)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (173519, 'Graphic Design', 3)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (185264, 'Advertising', 3)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (185265, 'Radio & Television', 3)

INSERT INTO department (department_id, department_name, faculty_id) VALUES (120076, 'Psychology', 4)
INSERT INTO department (department_id, department_name, faculty_id) VALUES (181544, 'Politics', 4)

INSERT INTO department (department_id, department_name, faculty_id) VALUES (187888, 'Aviation Management', 5)
*/

/*
INSERT INTO member_level (level_id, level_name) VALUES (1, 'Freshman')
INSERT INTO member_level (level_id, level_name) VALUES (2, 'Sophomore')
INSERT INTO member_level (level_id, level_name) VALUES (3, 'Junior')
INSERT INTO member_level (level_id, level_name) VALUES (4, 'Senior')
INSERT INTO member_level (level_id, level_name) VALUES (5, 'Master')
*/
