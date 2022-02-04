﻿-- Mert Altuntaş 1804010005

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
	register_id int,
    member_id int,
    lecture_id int,
	PRIMARY KEY (register_id),
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

/*
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (10709, 100, 118, 'Beowulf', 'It’s the ideal postcolonial novel.', 180)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (18431, 106, 118, 'The God of Small Things', 'English literature works, including poems, embody such almost straightforward characters', 395)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (17993, 105, 118, 'Beloved', 'Beloved is one of the greatest novels ever written – in any language or culture, any genre or generation, any time or clime.', 269)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (12062, 107, 182, 'Calculus', 'Introduction to the Calculus, world of Math!', 173)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (18867, 104, 134, 'MS Office Tools', 'Brief explanantions to use ms office word, excel and powerpoint.', 196)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (15686, 116, 134, 'DSA with Java 13', 'Great instructions to learn Data Structures.', 578)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (18534, 134, 140, 'History of Architecture', 'Historical sides of Architecture and asethetics.', 379)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (10127, 112, 134, 'Cyber Security', 'Usage of Kali Linux applications within explanantions.', 591)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (18328, 112, 134, 'Advanced Security', 'Usage of more advanced Kali Linux applications within explanantions.', 595)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (15501, 134, 140, 'Architectural Principles in the Age of Humanism', 'Sir Kenneth Clark wrote in the Architectural Review, that the first result of this book was “to dispose, once and for all, of the hedonist, or purely aesthetic, theory of Renaissance architecture,’', 594)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (17176, 114, 140, 'Statics and Strength of Materials', 'Fourth Edition, offers students an accessible, visually oriented introduction to structural theory that doesnt rely on calculus.', 256)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (15322, 106, 118, 'A Beautiful Mind by Sylvia Nasar', 'This biography of esteemed mathematician John Nash was both a finalist for the 1998 Pulitzer Prize and the basis for the award-winning film of the same name.', 203)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (14713, 135, 118, 'Alan Turing: The Enigma', 'Hodges’ 1983 biography of Alan Turing sheds light on the inner workings of this brilliant mathematician, cryptologist, and computer pioneer.', 482)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (15063, 135, 118, 'Alexander Hamilton by Ron Chernow', 'Ron Chernow’s Alexander Hamilton is not only the inspiration for a hit Broadway musical, but also a work of creative genius itself. ', 546)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (14981, 135, 118, 'Barracoon: The Story of the Last', 'A prolific essayist, short story writer, and novelist, Hurston turned her hand to biographical writing in 1927 ', 338)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (14017, 135, 118, 'Churchill: A Life', 'Though many a biography of him has been attempted, Gilbert’s is the final authority on Winston Churchill', 219)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (12456, 135, 140, 'Frida: A Biography', 'Herrera’s 1983 biography of renowned painter Frida Kahlo, one of the most recognizable names in modern art, has since become the definitive account on her life.', 137)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (15007, 140, 140, 'Henrietta Lacks', 'The Immortal Life of Henrietta Lacks is about a woman whose cells completely changed the trajectory of modern medicine. Rebecca Skloot', 487)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (14043, 105, 189, 'Green Arrow: Longbow', 'Longbow Hunters the Dark Knight Returns or Batman: Year One for Green Arrow.', 506)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (16108, 105, 189, 'Gods and Mortals', 'Wonder Woman into the midst of the drama of the gods and puts her role as a Daughter of Themyscira at the forefront of her journey into the modern world. ', 265)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (18870, 105, 189, 'The New Frontier', 'New Frontier is Darwyn Cooke’s love letter to the Gold and Silver ages of comics, telling a story that interweaves the fictional evolution of the characters post WW2 with the real-world crises from McCarthyism to Jim Crow.', 207)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (12369, 105, 189, 'All-Star Superman', 'Grant Morrison’s Superman is possibly the best depiction of the character as Clark Kent faces his own mortality.', 433)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (11597, 105, 189, 'Dark Knight Returns', 'If Morrison faced the unenviable task of writing a “last Superman story”, Miller’s task of crafting a “final” Batman story', 305)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (14842, 105, 189, 'Kingdom Come', 'Kingdom Come takes that on directly, with a story that poses the question of whether or not there’s still a place in modern comics for characters like Superman or Batman.', 219)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (12222, 105, 189, 'Red Son', 'This Superman spin on the nature vs nurture debate looks at how the Man of Steel might have been a different hero with just a slight change in the trajectory of the Krypton escape vessel. Here, Superman grows up in Stalin’s Soviet Union, a fact that changes not just his life but ripples out into other heroes and villains across the DC universe. ', 619)
*/

