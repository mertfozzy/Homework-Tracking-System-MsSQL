-- Mert Altuntaş 1804010005
DROP TABLE Students

--main
CREATE TABLE member(
	member_id int,
	username nvarchar(20) NOT NULL,
	lastname nvarchar(20) NOT NULL,
	member_password varchar(20),
	faculty_id int NOT NULL,
	level_id int NOT NULL,
    phone int,
    mail nvarchar(255),
    adress text,
    tc_identity_num int NOT NULL,
    date_of_birth date NOT NULL,
    country varchar(50),
    city varchar(50),
	PRIMARY KEY (member_id),
	FOREIGN KEY (faculty_id) REFERENCES member_faculty(faculty_id),
	FOREIGN KEY (level_id) REFERENCES member_level(level_id)
);

--message
CREATE TABLE member_messages(
    message_id bigint NOT NULL,
    sender_id int NOT NULL,
    receiver_id int NOT NULL,
    title varchar(50),
    content text,
    message_date datetime2 NOT NULL,
    ip int,
    PRIMARY KEY (message_id)
);

--level
CREATE TABLE member_level(
    level_id int NOT NULL,
    level_name varchar(10),
    PRIMARY KEY (level_id)
);

--faculty
CREATE TABLE member_faculty(

    faculty_id int NOT NULL,
    faculty_name varchar(20),
    department_id int NOT NULL,
    PRIMARY KEY (faculty_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id) 
);

--department
CREATE TABLE department(
    department_id int NOT NULL,
    department_name varchar(20),
    PRIMARY KEY (department_id)
);