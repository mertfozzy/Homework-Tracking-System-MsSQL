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
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id) 
);

--document
CREATE TABLE document(
    document_id int NOT NULL,
    lecture_id int NOT NULL,
    type_no int NOT NULL,
    title varchar(50) NOT NULL,
    content text,
    doc_file int NOT NULL,
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

--insert department
INSERT INTO department (department_id, department_name) VALUES (1, 'Computer Engineering')
INSERT INTO department (department_id, department_name) VALUES (2, 'Software Engineering')
INSERT INTO department (department_id, department_name) VALUES (3, 'Computer Science')
INSERT INTO department (department_id, department_name) VALUES (4, 'Architecture')
INSERT INTO department (department_id, department_name) VALUES (5, 'Psychology')
INSERT INTO department (department_id, department_name) VALUES (6, 'Aviation Management')
INSERT INTO department (department_id, department_name) VALUES (7, 'Graphic Design')
INSERT INTO department (department_id, department_name) VALUES (8, 'Digital Game Design')
INSERT INTO department (department_id, department_name) VALUES (9, 'International Trade')

--insert faculty
SELECT member_faculty.department_id FROM member_faculty INNER JOIN department ON department.department_id = member_faculty.department_id
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (1, 1, 'Engineering')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (5, 2, 'Social Science')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (6, 3, 'Civil Aviation')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (7, 4, 'Arts')
INSERT INTO member_faculty (department_id, faculty_id, faculty_name) VALUES (9, 5, 'Administrative')

--insert member level
INSERT INTO member_level (level_id, level_name) VALUES (1, 'Freshman')
INSERT INTO member_level (level_id, level_name) VALUES (2, 'Sophomore')
INSERT INTO member_level (level_id, level_name) VALUES (3, 'Junior')
INSERT INTO member_level (level_id, level_name) VALUES (4, 'Senior')
INSERT INTO member_level (level_id, level_name) VALUES (5, 'Master')

--insert document type
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (1, 'Computer Science', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (2, 'Action and Adventure', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (3, 'Classics', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (4, 'Comic', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (5, 'Mystery', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (6, 'Fantasy', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (7, 'Historical Fiction', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (8, 'Horror', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (9, 'Literary Fiction', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (10, 'Romance', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (11, 'Sci-Fi', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (12, 'Short Stories', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (13, 'Suspense', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (14, 'Womens Fiction', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (15, 'Biographies', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (16, 'Cookbooks', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (17, 'Autobiographies', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (18, 'Essays', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (19, 'History', '2022-01-31 10:00:00', '2022-02-20 10:00:00')
INSERT INTO document_type (type_no, doc_type_name, start_time, finish_time) VALUES (20, 'Memoir', '2022-01-31 10:00:00', '2022-02-20 10:00:00')

--lectures
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

-- insert document
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (1, 100, 3, 'Beowulf', 'It’s the ideal postcolonial novel.', 180)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (2, 105, 3, 'The God of Small Things', 'English literature works, including poems, embody such almost straightforward characters', 395)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (3, 105, 3, 'Beloved', 'Beloved is one of the greatest novels ever written – in any language or culture, any genre or generation, any time or clime.', 269)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (4, 102, 3, 'Calculus', 'Introduction to the Calculus, world of Math!', 173)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (5, 103, 1, 'MS Office Tools', 'Brief explanantions to use ms office word, excel and powerpoint.', 196)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (6, 116, 1, 'DSA with Java 13', 'Great instructions to learn Data Structures.', 578)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (7, 131, 18, 'History of Architecture', 'Historical sides of Architecture and asethetics.', 379)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (8, 128, 1, 'Cyber Security', 'Usage of Kali Linux applications within explanantions.', 591)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (9, 128, 1, 'Adavnced Security', 'Usage of more advanced Kali Linux applications within explanantions.', 595)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (10, 140, 7, 'Architectural Principles in the Age of Humanism', 'Sir Kenneth Clark wrote in the Architectural Review, that the first result of this book was “to dispose, once and for all, of the hedonist, or purely aesthetic, theory of Renaissance architecture,’', 594)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (11, 138, 20, 'Statics and Strength of Materials', 'Fourth Edition, offers students an accessible, visually oriented introduction to structural theory that doesnt rely on calculus.', 256)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (12, 100, 15, 'A Beautiful Mind by Sylvia Nasar', 'This biography of esteemed mathematician John Nash was both a finalist for the 1998 Pulitzer Prize and the basis for the award-winning film of the same name.', 203)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (13, 100, 15, 'Alan Turing: The Enigma', 'Hodges’ 1983 biography of Alan Turing sheds light on the inner workings of this brilliant mathematician, cryptologist, and computer pioneer.', 482)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (14, 100, 15, 'Alexander Hamilton by Ron Chernow', 'Ron Chernow’s Alexander Hamilton is not only the inspiration for a hit Broadway musical, but also a work of creative genius itself. ', 546)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (15, 100, 15, 'Barracoon: The Story of the Last', 'A prolific essayist, short story writer, and novelist, Hurston turned her hand to biographical writing in 1927 ', 338)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (16, 100, 15, 'Churchill: A Life', 'Though many a biography of him has been attempted, Gilbert’s is the final authority on Winston Churchill', 219)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (17, 105, 15, 'Frida: A Biography', 'Herrera’s 1983 biography of renowned painter Frida Kahlo, one of the most recognizable names in modern art, has since become the definitive account on her life.', 137)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (18, 105, 15, 'Henrietta Lacks', 'The Immortal Life of Henrietta Lacks is about a woman whose cells completely changed the trajectory of modern medicine. Rebecca Skloot', 487)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (19, 134, 4, 'Green Arrow: Longbow', 'Longbow Hunters the Dark Knight Returns or Batman: Year One for Green Arrow.', 506)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (20, 134, 4, 'Gods and Mortals', 'Wonder Woman into the midst of the drama of the gods and puts her role as a Daughter of Themyscira at the forefront of her journey into the modern world. ', 265)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (21, 134, 4, 'The New Frontier', 'New Frontier is Darwyn Cooke’s love letter to the Gold and Silver ages of comics, telling a story that interweaves the fictional evolution of the characters post WW2 with the real-world crises from McCarthyism to Jim Crow.', 207)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (22, 134, 4, 'All-Star Superman', 'Grant Morrison’s Superman is possibly the best depiction of the character as Clark Kent faces his own mortality.', 433)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (23, 134, 4, 'Dark Knight Returns', 'If Morrison faced the unenviable task of writing a “last Superman story”, Miller’s task of crafting a “final” Batman story', 305)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (24, 134, 4, 'Kingdom Come', 'Kingdom Come takes that on directly, with a story that poses the question of whether or not there’s still a place in modern comics for characters like Superman or Batman.', 219)
INSERT INTO document (document_id, lecture_id, type_no, title, content, doc_file) VALUES (25, 134, 4, 'Red Son', 'This Superman spin on the nature vs nurture debate looks at how the Man of Steel might have been a different hero with just a slight change in the trajectory of the Krypton escape vessel. Here, Superman grows up in Stalin’s Soviet Union, a fact that changes not just his life but ripples out into other heroes and villains across the DC universe. ', 619)

-- insert member_lecture
INSERT INTO member_lecture (member_id, lecture_id) VALUES (1, 100)
INSERT INTO member_lecture (member_id, lecture_id) VALUES (1, 102)

-- insert member_document
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (500, 1, 90, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (501, 2, 93, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (502, 3, 56, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (503, 4, 48, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (504, 5, 63, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (505, 6, 66, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (506, 7, 12, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (507, 8, 96, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (508, 9, 98, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (509, 10, 99, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (510, 11, 100, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (511, 12, 52, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (512, 13, 55, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (513, 14, 30, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (514, 15, 90, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (515, 16, 91, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (516, 17, 91, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (517, 18, 89, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (518, 19, 88, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (519, 20, 98, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (520, 21, 97, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (521, 22, 22, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (522, 23, 23, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (523, 24, 33, 1)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (524, 25, 44, 1)

-- insert member
INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	1, 'Mert', 'Altuntaş', 'mert2000', 1, 3, 100, 'mertfozzy@gmail.com', 'Ümraniye', '123456789',  '2000-03-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	2, 'Nur Selin', 'İçke', 'sarioje', 2, 4, 101, 'nurselin@gmail.com', 'Edremit', '152236838',  '2000-06-27', 'Turkey', 'Balıkesir')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	3, 'Adem Onur', 'Öztaş', 'rickmorty', 1, 3, 102, 'onuroztas@gmail.com', 'Beşiktaş', '177650469',  '2000-03-06', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4, 'Alperen', 'Demirtürkoğlu', 'password', 1, 3, 103, 'alpdmr@gmail.com', 'Üsküdar', '749874786',  '2000-12-08', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	5, 'Gamze', 'Şen', 'fuzzylogic', 3, 2, 104, 'gamzesn@gmail.com', 'Ümraniye', '140160545',  '2001-04-18', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	6, 'Serra', 'Yıldız', 'serrosko', 1, 1, 105, 'serrrayldz@gmail.com', 'Eyüp', '478079103',  '2002-04-12', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	7, 'Ahmet', 'Kaya', 'benibulanne', 2, 4, 106, 'ahmetkaya@gmail.com', 'Beyoğlu', '624620040',  '1964-03-22', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	8, 'Musa', 'Eroğlu', 'mihriban', 4, 2, 107, 'musaerog@gmail.com', 'Ümraniye', '640236611',  '1997-07-11', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	9, 'Cevdet', 'Bağca', 'asifirat', 2, 2, 108, 'cvdtbagca@gmail.com', 'Kadıköy', '485872711',  '1989-03-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	10, 'İsmail', 'Çakır', 'candanileri', 2, 4, 109, 'ismailckr@gmail.com', 'Enez', '801412222',  '1975-03-19', 'Turkey', 'Edirne')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	11, 'Selda', 'Bağcan', 'sazimcalinir', 1, 3, 110, 'seldaaa@gmail.com', 'Suşehri', '772550737',  '2000-03-19', 'Turkey', 'Sivas')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	12, 'Hilal', 'Özdemir', 'selmknkk', 4, 3, 111, 'hilalozde@gmail.com', 'Üsküdar', '857755258',  '2000-08-14', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	13, 'Tolga', 'İlhan', 'grupabdal', 2, 1, 112, 'haluktolga@gmail.com', 'Turhal', '491192374',  '1977-03-24', 'Turkey', 'Tokat')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	14, 'İsmail', 'Altunsaray', 'kizsenin', 3, 4, 113, 'altunsaray@gmail.com', 'Başakşehir', '411833088',  '1976-12-16', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	15, 'Ed', 'Sheeran', 'makeitrain', 1, 2, 114, 'edsheer@gmail.com', 'Shrine', '455963939',  '1988-11-19', 'England', 'London')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	16, 'Oğuz', 'Koç', 'ogiogiogi', 1, 4, 115, 'ogi3245@gmail.com', 'Beşiktaş', '626611493',  '1998-10-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	17, 'Murat', 'Boz', 'muratbozz', 4, 3, 116, 'mmuratbz@gmail.com', 'Akçay', '318082295',  '2000-09-19', 'Turkey', 'Balıkesir')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	18, 'Murat', 'Dalkılıç', 'edis212', 1, 3, 117, 'dalkilicc@gmail.com', 'Ümraniye', '520856993',  '2002-07-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	19, 'Demet', 'Akalın', 'intikam', 3, 3, 118, 'basicemail@gmail.com', 'Kadıköy', '896349072',  '1968-06-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	20, 'Mustafa', 'Sandal', 'araba', 1, 3, 119, 'musti32@gmail.com', 'Taksim', '485528756',  '2000-03-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	21, 'Sabahattin', 'Altuntaş', 'karasabo', 1, 4, 120, 'sebomert@gmail.com', 'Ümraniye', '189648494',  '1976-11-12', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	22, 'Sevgi', 'Altuntaş', 'lovelife', 2, 2, 121, 'sevgiiy@gmail.com', 'Ümraniye', '105583324',  '1977-03-15', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	23, 'Yıldız', 'Tilbe', 'benseninvarya', 4, 3, 122, 'deliyildiz@gmail.com', 'Çekmeköy', '104475794',  '1986-01-22', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	24, 'Kenan', 'Doğulu', 'bihteeer', 4, 1, 123, 'kenanknk@gmail.com', 'Ümraniye', '557738073',  '1968-05-20', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	25, 'Tarkan', 'Tevetoğlu', 'dedikodu', 4, 1, 124, 'megastar@gmail.com', 'Merkez', '567343047',  '1974-03-13', 'Turkey', 'Erzincan')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	26, 'Mücahit', 'Kaya', 'muco5671', 4, 2, 125, 'mucaitt@gmail.com', 'Esenler', '833677953',  '2000-08-11', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	27, 'Veysel', 'Aksin', 'veyselsql', 2, 1, 126, 'lainnyone@gmail.com', 'Erciş', '767900722',  '1988-09-09', 'Turkey', 'Van')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	28, 'Burcu', 'Kara', 'frontender', 2, 2, 127, 'burcuke@gmail.com', 'Keçiören', '813158308',  '1998-03-20', 'Turkey', 'Ankara')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	29, 'Volkan', 'Konak', 'alenii', 2, 3, 128, 'volkisanki@gmail.com', 'Hopa', '518122168',  '1950-07-21', 'Turkey', 'Trabzon')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	30, 'Emre', 'Aydın', 'emreaydin', 2, 4, 129, 'emreaayd@gmail.com', 'Kemah', '841152053',  '1958-06-01', 'Turkey', 'Erzincan')
