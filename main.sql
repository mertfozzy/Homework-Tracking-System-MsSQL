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

/*
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (100, 'English I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (101, 'Physics I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (102, 'Calculus I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (103, 'Information I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (104, 'Scratch Programming', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (105, 'English II', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (106, 'Physics II', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (107, 'Calculus II', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (108, 'Project I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (109, 'OOP Programming', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (110, 'Differential Equations', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (111, 'Electronics I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (112, 'Software I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (113, 'Linear Algebra', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (114, 'Statistics', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (115, 'Digital Systems', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (116, 'Data Structures', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (117, 'Project II', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (118, 'Economics', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (119, 'Database Systems', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (120, 'Systems Programming', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (121, 'Artificial Intelligence', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (122, 'Computer Organisation', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (123, 'Internship I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (124, 'Project III', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (125, 'Computer Networks', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (126, 'Algorithms', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (127, 'Operating Systems', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (128, 'Security', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (129, 'Computing', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (130, 'Internship II', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (131, 'Architecture I', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (132, 'Basic Design', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (133, 'Architectural Design', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (134, 'Digital Media', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (135, 'History', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (136, 'Building', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (137, 'Sustainability', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (138, 'Building Statics', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (139, 'Construction', 4, 30)
INSERT INTO lectures (lecture_id, lecture_name, credit, lecture_hour) VALUES (140, 'Historial Sites', 4, 30)
*/

/*
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (134, 'Computer Science', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (186, 'Action and Adventure', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (118, 'Classics', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (140, 'Architecture', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (182, 'Math', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (179, 'Psyhics', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (173, 'Medical', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (115, 'Flight', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (113, 'Literary Fiction', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (159, 'Romance', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (189, 'Sci-Fi', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (174, 'Logistics', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (100, 'Finance', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (148, 'Calculation', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (185, 'Biographies', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (155, 'Cookbooks', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (148, 'Autobiographies', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (136, 'Essays', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (183, 'History', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (171, 'Memoir', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
*/