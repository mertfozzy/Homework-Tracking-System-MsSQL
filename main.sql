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
	member_id bigint UNIQUE NOT NULL,
	username nvarchar(30),
	lastname nvarchar(30),
	member_password varchar(20),
	faculty_id int,
	level_id int,
    phone bigint,
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
    member_id bigint,
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
    member_id bigint,
    PRIMARY KEY (member_doc_id),
    FOREIGN KEY (document_id) REFERENCES document(document_id)
);

--message
CREATE TABLE member_messages(
    message_id bigint NOT NULL,
    member_id bigint,
    message_date datetime2 ,
    message_ip int,
    PRIMARY KEY (message_id),
	FOREIGN KEY (member_id) REFERENCES member(member_id)
);

/*
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (1, 'Engineering')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (2, 'Logistics')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (3, 'Art & Culture')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (4, 'Social Sciences')
INSERT INTO member_faculty (faculty_id, faculty_name) VALUES (5, 'Aviation')



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



INSERT INTO member_level (level_id, level_name) VALUES (1, 'Freshman')
INSERT INTO member_level (level_id, level_name) VALUES (2, 'Sophomore')
INSERT INTO member_level (level_id, level_name) VALUES (3, 'Junior')
INSERT INTO member_level (level_id, level_name) VALUES (4, 'Senior')
INSERT INTO member_level (level_id, level_name) VALUES (5, 'Master')



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


INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	3226312503, 'Mert', 'Altuntaş', 'mert2000', 1, 3, 5908775906, 'mertfozzy@gmail.com', 'Ümraniye', '59395324628',  '2000-03-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	8735078753, 'Nur Selin', 'İçke', 'selin32', 2, 4, 5109335144, 'nurselin@gmail.com', 'Edremit', '76548161480',  '2000-06-27', 'Turkey', 'Balıkesir')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	8460231045, 'Adem Onur', 'Öztaş', 'rickmorty', 1, 3, 5450041830, 'onuroztas@gmail.com', 'Beşiktaş', '26081626090',  '2000-03-06', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	5194120039, 'Alperen', 'Demirtürkoğlu', 'password', 1, 3, 5974179454, 'alpdmr@gmail.com', 'Üsküdar', '27546036294',  '2000-12-08', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	8331146995, 'Gamze', 'Şen', 'fuzzylogic', 3, 2, 5323212128, 'gamzesn@gmail.com', 'Ümraniye', '64784384688',  '2001-04-18', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	9597819056, 'Serra', 'Yıldız', 'serrosko', 1, 1, 5741520772, 'serrrayldz@gmail.com', 'Eyüp', '92935276834',  '2002-04-12', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	6565707190, 'Ahmet', 'Kaya', 'randomgen', 2, 4, 5104261035, 'ahmetkaya@gmail.com', 'Beyoğlu', '83212220640',  '1964-03-22', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4699969065, 'Musa', 'Kadir', 'mihriban', 5, 2, 5222952558, 'musaerog@gmail.com', 'Ümraniye', '29902754132',  '1997-07-11', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	9329508482, 'Cevdet', 'Çelik', 'asifirat', 2, 2, 5360328972, 'cvdtbagca@gmail.com', 'Kadıköy', '31003259430',  '1989-03-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	6334470199, 'İsmail', 'Çakır', 'iso4353', 2, 4, 5568345422, 'ismailckr@gmail.com', 'Enez', '35954452568',  '1975-03-19', 'Turkey', 'Edirne')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	3480210889, 'Selda', 'Güzel', 'gfhfdgs', 5, 3, 5576631470, 'seldaaa@gmail.com', 'Suşehri', '80724761296',  '2000-03-19', 'Turkey', 'Sivas')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4399357258, 'Hilal', 'Özdemir', '32423', 4, 3, 5017897132, 'hilalozde@gmail.com', 'Üsküdar', '75139993028',  '2000-08-14', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	7428141664, 'Tolga', 'İlhan', 'sifresiz', 2, 1, 5723368070, 'haluktolga@gmail.com', 'Turhal', '12420842474',  '1977-03-24', 'Turkey', 'Tokat')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	8489076193, 'İsmail', 'Altunsaray', '453462', 3, 4, 5281091091, 'altunsaray@gmail.com', 'Başakşehir', '70476116406',  '1976-12-16', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	3850108294, 'Ed', 'Sheeran', 'makeitrain', 1, 2, 5270974484, 'edsheer@gmail.com', 'Shrine', '21664649176',  '1988-11-19', 'England', 'London')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	9208636932, 'Oğuz', 'Koç', 'ogiogiogi', 1, 4, 5142486471, 'ogi3245@gmail.com', 'Beşiktaş', '18992705988',  '1998-10-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	3256254161, 'Murat', 'Karahanlı', 'murti232', 5, 3, 5261709825, 'mmuratbz@gmail.com', 'Akçay', '83362806466',  '2000-09-19', 'Turkey', 'Balıkesir')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4103382027, 'Murat', 'Şahin', 'edis212', 1, 3, 5404690862, 'mrtt45@gmail.com', 'Ümraniye', '71023250314',  '2002-07-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	6141278778, 'Demet', 'Salih', 'intikam121', 3, 3, 5794428817, 'basicemail@gmail.com', 'Kadıköy', '25067748290',  '1968-06-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4854997479, 'Mustafa', 'Sandal', 'araba', 1, 3, 5325615763, 'musti32@gmail.com', 'Taksim', '40586586956',  '2000-03-19', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	7379626747, 'Sabahattin', 'Altuntaş', 'karasabo', 5, 4, 5288230040, 'sebomert@gmail.com', 'Ümraniye', '12212301530',  '1976-11-12', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	9878711422, 'Sevgi', 'Altuntaş', 'lovelife', 2, 2, 5520639851, 'sevgiiy@gmail.com', 'Ümraniye', '61167951376',  '1977-03-15', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	7085078317, 'Yıldız', 'Sinan', 'sinan554', 5, 3, 5633404902, 'deliyildiz@gmail.com', 'Çekmeköy', '46105669018',  '1986-01-22', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4599028862, 'Kenan', 'Birkan', 'poghsy', 5, 1, 5564393486, 'kenanknk@gmail.com', 'Ümraniye', '63674012076',  '1968-05-20', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	8847080154, 'Tarkan', 'Uçar', 'tartar67', 5, 1, 5762174837, 'megastar@gmail.com', 'Merkez', '98550710678',  '1974-03-13', 'Turkey', 'Erzincan')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4834768023, 'Mücahit', 'Kaya', 'muco5671', 4, 2, 5369574314, 'mucaitt@gmail.com', 'Esenler', '64746330890',  '2000-08-11', 'Turkey', 'İstanbul')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4088147978, 'Veysel', 'Aksin', 'veyselsql', 2, 1, 5166069592, 'lainnyone@gmail.com', 'Erciş', '77264014326',  '1988-09-09', 'Turkey', 'Van')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	4770230054, 'Burcu', 'Kara', 'frontender', 2, 2, 5902676293, 'burcuke@gmail.com', 'Keçiören', '87625877842',  '1998-03-20', 'Turkey', 'Ankara')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	7507020515, 'Volkan', 'Dalga', 'cezjsıda', 2, 3, 5442126242, 'volkisanki@gmail.com', 'Hopa', '93997322712',  '1950-07-21', 'Turkey', 'Trabzon')

INSERT INTO member (member_id, username, lastname, member_password, faculty_id, level_id, phone, mail, adress, tc_identity_num, date_of_birth, country, city) VALUES (
	5786286814, 'Emre', 'Aydın', 'emreaydin', 2, 4, 5794239206, 'emreaayd@gmail.com', 'Kemah', '17892270084',  '1958-06-01', 'Turkey', 'Erzincan')


INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (9570, 15686, 90, 3226312503)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (8321, 15686, 93, 8735078753)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (7622, 15686, 56, 8460231045)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (8905, 10127, 48, 5194120039)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (4204, 10127, 63, 8331146995)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (3841, 14981, 66, 9597819056)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (7206, 15501, 12, 6565707190)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (5117, 16108, 96, 4699969065)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (7524, 16108, 98, 9329508482)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (6873, 16108, 99, 6334470199)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (3849, 11597, 100, 3480210889)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (3084, 11597, 52, 4399357258)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (2927, 15501, 55, 7428141664)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (7231, 15501, 30, 8489076193)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (1492, 12456, 90, 3850108294)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (2162, 12456, 91, 9208636932)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (5420, 11597, 91, 3256254161)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (1279, 18870, 89, 4103382027)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (1623, 17176, 88, 6141278778)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (9656, 17176, 98, 4854997479)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (3442, 11597, 97, 7379626747)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (3331, 17176, 22, 9878711422)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (6240, 17176, 23, 7085078317)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (9616, 15501, 33, 4599028862)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (9851, 15501, 44, 8847080154)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (7343, 18870, 44, 4834768023)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (9040, 18870, 44, 4770230054)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (3237, 12222, 44, 7507020515)
INSERT INTO member_document (member_doc_id, document_id, score, member_id) VALUES (8248, 12222, 44, 5786286814)


INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (3053, 127, 3226312503)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (3091, 117, 8735078753)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5164, 137, 8460231045)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6530, 118, 5194120039)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6982, 125, 8331146995)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (3420, 107, 9597819056)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5223, 122, 6565707190)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (8248, 122, 4699969065)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (4756, 125, 9329508482)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6901, 117, 6334470199)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (4746, 101, 3480210889)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5366, 101, 4399357258)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5543, 136, 7428141664)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (3743, 101, 8489076193)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (4483, 110, 3850108294)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (3329, 115, 9208636932)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6587, 132, 3256254161)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6330, 117, 4103382027)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (4845, 125, 6141278778)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5567, 125, 4854997479)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (3158, 132, 7379626747)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (4828, 130, 9878711422)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6619, 117, 7085078317)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5130, 136, 4599028862)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6708, 122, 8847080154)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5754, 140, 4834768023)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (6342, 140, 4770230054)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5557, 140, 7507020515)
INSERT INTO member_lecture (register_id, lecture_id, member_id) VALUES (5526, 136, 5786286814)

 

INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (6404, 12129, 3226312503, '2022-03-04 01:54:43')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (7076, 16380, 8735078753, '2022-10-06 05:58:14')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (3322, 17917, 8460231045, '2022-07-19 01:21:01')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (8017, 17617, 5194120039, '2021-11-20 16:22:28')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (6682, 18699, 8331146995, '2022-06-15 01:00:39')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (5644, 14917, 9597819056, '2021-12-10 00:57:38')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (2004, 12696, 6565707190, '2022-05-12 19:44:03')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (1406, 13201, 4699969065, '2021-12-19 11:58:47')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (4345, 19700, 9329508482, '2022-08-14 18:20:15')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (8145, 14096, 6334470199, '2022-08-03 16:09:28')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (2762, 18784, 3480210889, '2022-11-03 03:36:05')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (6514, 13420, 4399357258, '2022-03-04 01:54:43')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (8029, 14321, 7428141664, '2022-09-12 09:37:14')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (5760, 14259, 8489076193, '2022-08-03 16:09:28')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (9717, 18490, 3850108294, '2022-08-14 18:20:15')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (5583, 17266, 9208636932, '2022-11-03 03:36:05')
INSERT INTO member_messages (message_id, message_ip, member_id, message_date) VALUES (1898, 10109, 3256254161, '2022-09-12 09:37:14')
*/

--1- ordering according to names
SELECT member_id, username, lastname FROM member ORDER BY username ASC

--2- left join from member lecture table (member id values)
SELECT member.member_id, member.username, member.lastname FROM member LEFT JOIN member_lecture ON member_lecture.member_id = member.member_id

--3- full join to see member's messaging status. NULLs are not using message (nothing send or receive)
SELECT * FROM member FULL OUTER JOIN member_messages ON member_messages.member_id = member.member_id

--4- full join to see which lecture have no students
SELECT * FROM lectures FULL OUTER JOIN member_lecture ON member_lecture.lecture_id = lectures.lecture_id 

--5- full join to see which lecture have no documents (-or resources)
SELECT * FROM document RIGHT JOIN lectures ON lectures.lecture_id = document.lecture_id

--6- ordering the student names which are going to 3th or 4th level Engineering classess. (level + faculty filter)
SELECT * FROM member WHERE level_id>2 AND faculty_id=1 ORDER BY lastname, username

--7- ordering students according to their birthdays
SELECT member_id, username, lastname, date_of_birth FROM member ORDER BY date_of_birth desc

--8- grouping currently students according to their faculties (how many students continues in which faculty?)
SELECT faculty_id, COUNT(*) AS 'Number of Currently Students' FROM member WHERE level_id<5 GROUP BY faculty_id

--9- full join to see which types of documents are not available
SELECT * FROM document FULL OUTER JOIN document_type ON document_type.type_no = document.type_no

--10 right join to see the list of departments with the faculty names together
SELECT * FROM department RIGHT JOIN member_faculty ON member_faculty.faculty_id = department.faculty_id

--11 grouping faculties, according to students who come from İstanbul
SELECT faculty_id, COUNT(*) AS 'Number of Students who from İstanbul' FROM member WHERE city like 'İ%' GROUP BY faculty_id

--12 join to see student's scores (id and score come from different tables) 
SELECT member.member_id, score FROM member_document JOIN member ON member.member_id = member_document.member_id

--13 intersect 2 different tables (member_document & member_lecture)
SELECT member_id FROM member_document INTERSECT select member_id from member_lecture ORDER BY member_id

--14 grouping and ordering students according to their city
SELECT COUNT(member_id), city FROM member GROUP BY city ORDER BY COUNT(member_id) DESC
