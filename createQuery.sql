-- Mert Altuntaş 1804010005

--department
CREATE TABLE department(
    department_id int NOT NULL,
    department_name varchar(20) NOT NULL,
    PRIMARY KEY (department_id)
);

--faculty
CREATE TABLE member_faculty(

    faculty_id int NOT NULL,
    faculty_name varchar(20) NOT NULL,
    department_id int,
    PRIMARY KEY (faculty_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id) 
);

--level
CREATE TABLE member_level(
    level_id int NOT NULL,
    level_name varchar(10) NOT NULL,
    PRIMARY KEY (level_id)
);

--main
CREATE TABLE member(
	member_id int NOT NULL,
	username nvarchar(20) NOT NULL,
	lastname nvarchar(20) NOT NULL,
	member_password varchar(20) NOT NULL,
	faculty_id int NOT NULL,
	level_id int NOT NULL,
    phone int NOT NULL,
    mail nvarchar(255) NOT NULL,
    adress text NOT NULL,
    tc_identity_num int NOT NULL,
    date_of_birth date NOT NULL,
    country varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
	PRIMARY KEY (member_id),
	FOREIGN KEY (faculty_id) REFERENCES member_faculty(faculty_id),
	FOREIGN KEY (level_id) REFERENCES member_level(level_id)
);

--lectures
CREATE TABLE lectures(
    lecture_id int NOT NULL,
    lecture_name varchar(30) NOT NULL,
    credit int NOT NULL,
    lecture_hour int NOT NULL,
    PRIMARY KEY (lecture_id)
);

--document_type
CREATE TABLE document_type(
    type_no int NOT NULL,
    doc_type_name varchar(20) NOT NULL,
    start_time datetime2 NOT NULL,
    finish_time datetime2 NOT NULL,
    PRIMARY KEY (type_no)
);

--member lecture
CREATE TABLE member_lecture(
    member_id int NOT NULL,
    lecture_id int NOT NULL,
    PRIMARY KEY (member_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id) 
);

--document
CREATE TABLE document(
    document_id int NOT NULL,
    lecture_id int NOT NULL,
    type_no int NOT NULL,
    title varchar NOT NULL,
    content text,
    doc_file bigint NOT NULL,
    PRIMARY KEY (document_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id),
    FOREIGN KEY (type_no) REFERENCES document_type(type_no)
);

--member document
CREATE TABLE member_document(
    member_doc_id int NOT NULL,
    document_id int NOT NULL,
    score int NOT NULL,
    member_id int NOT NULL,
    PRIMARY KEY (member_doc_id),
    FOREIGN KEY (document_id) REFERENCES document(document_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

--message
CREATE TABLE member_messages(
    message_id bigint NOT NULL,
    sender_id int NOT NULL,
    receiver_id int NOT NULL,
    title varchar(50),
    content text,
    message_date datetime2 NOT NULL,
    message_ip int,
    PRIMARY KEY (message_id)
);


/*INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	1, 'Mert', 'Altuntaş', 'mert2000', 8, 3, 100, 'mertfozzy@gmail.com', 'Ümraniye', '123456789',  '2000-03-19', 'Turkey', 'İstanbul'
)*/

INSERT INTO department (department_id, department_name) VALUES (1, 'Computer Engineering')
INSERT INTO department (department_id, department_name) VALUES (2, 'Software Engineering')
INSERT INTO department (department_id, department_name) VALUES (3, 'Computer Science')
INSERT INTO department (department_id, department_name) VALUES (4, 'Architecture')
INSERT INTO department (department_id, department_name) VALUES (5, 'Psychology')
INSERT INTO department (department_id, department_name) VALUES (6, 'Aviation Management')
INSERT INTO department (department_id, department_name) VALUES (7, 'Graphic Design')
INSERT INTO department (department_id, department_name) VALUES (8, 'Digital Game Design')
INSERT INTO department (department_id, department_name) VALUES (9, 'International Trade and Finance')

SELECT member_faculty.department_id FROM member_faculty INNER JOIN department ON department.department_id = member_faculty.department_id
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (1, 1, 'Engineering')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (5, 2, 'Social Science')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (6, 3, 'Civil Aviation')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (7, 4, 'Arts')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (9, 5, 'Business and Administrative')

INSERT INTO member_level (level_id, level_name) VALUES (1, 'Freshman')
INSERT INTO member_level (level_id, level_name) VALUES (2, 'Sophomore')
INSERT INTO member_level (level_id, level_name) VALUES (3, 'Junior')
INSERT INTO member_level (level_id, level_name) VALUES (4, 'Senior')
INSERT INTO member_level (level_id, level_name) VALUES (5, 'Master')
