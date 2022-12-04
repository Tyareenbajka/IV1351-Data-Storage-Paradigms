INSERT INTO person (person_number,name,address,zip,city,phone,email)
VALUES
  ("46155431-8","Cara Mckinney","355-5241 Sed St.","33478","Dublin","054-466-3481","non.sapien.molestie@aol.edu"),
  ("13858611-1","Curran Hahn","P.O. Box 779, 3664 Neque St.","58123","Frederick","002-656-2687","scelerisque.scelerisque.dui@yahoo.edu"),
  ("34728817-9","Benedict Irwin","Ap #268-9402 Integer Ave","11118","Marchihue","084-381-6518","aliquam@icloud.org"),
  ("44932444-7","Charles Roth","7419 Vulputate, St.","42706-883","Ciudad Madero","039-973-6830","amet.diam.eu@aol.net"),
  ("35958958-1","Shea Wynn","P.O. Box 112, 6499 Non, St.","375536","Oslo","022-387-1411","mattis@icloud.edu"),
  ("41600602-4","Lars Nash","Ap #518-5999 Duis Avenue","46-397","Villingen-Schwenningen","017-163-9173","vel.quam@protonmail.com"),
  ("20779129-6","Paula Goodman","Ap #663-9834 Nisl Rd.","527154","Salihli","082-775-1402","purus.accumsan@outlook.net"),
  ("35293358-9","Lacey Avery","978 Mauris Street","336932","Millport","052-910-2231","euismod.enim@hotmail.ca"),
  ("38823929-8","Marshall Holman","293-6419 Ante. Rd.","42-644","Belfast","021-734-6860","felis.donec@icloud.org"),
  ("24788856-K","Sebastian Preston","Ap #140-1453 Aliquam Street","797781","Odessa","043-885-6455","dapibus.ligula.aliquam@aol.ca"),
  ("21982603-6","Eugenia Rowland","Ap #992-3776 Sem. Avenue","119474","Whitewater Region Township","1-829-855-1221","ligula@google.com"),
  ("1658310-3","Amaya Jackson","P.O. Box 211, 8175 Consequat Av.","16153","Belfast","(873) 454-7759","fermentum@outlook.net"),
  ("8456371-4","Kelsie Montgomery","256-884 Commodo Ave","3973138","Saalfelden am Steinernen Meer","(132) 876-6861","condimentum.donec@yahoo.couk"),
  ("43552545-8","Omar Reese","454-3291 Dui Av.","37617","Bergen op Zoom","(528) 346-6122","non.dui@protonmail.org"),
  ("42428758-K","Gemma Schroeder","P.O. Box 828, 6738 Dolor. Road","85517","Otegem","1-464-531-0562","molestie@yahoo.org"),
  ("11657839-5","Graiden Mcclain","Ap #671-9570 Feugiat St.","48487","Maicao","(924) 854-6310","mauris.blandit@hotmail.org"),
  ("23733851-0","Stewart Gallegos","Ap #127-3156 Netus Road","8331","Vichy","(248) 248-2134","sed.congue@protonmail.com"),
  ("13456183-1","Anthony Riggs","P.O. Box 837, 8289 Aliquam Avenue","72574","Porvenir","1-703-672-5136","commodo.hendrerit.donec@icloud.couk"),
  ("23764755-6","Prescott Willis","276-4481 A St.","94251","Sint-Denijs","(825) 958-8431","odio@icloud.net"),
  ("50448682-6","Azalia Bennett","P.O. Box 183, 9853 Mus. Av.","593164","Mahikeng","1-861-241-4694","egestas.ligula.nullam@outlook.edu"),
  ("42377842-3","Noble Daniels","1817 Orci. Street","241863","Thames","1-966-847-9561","ornare@aol.net"),
  ("46134829-7","Lacey Terrell","P.O. Box 433, 7762 Blandit Av.","396275","Farsund","(768) 278-2246","ac@hotmail.couk"),
  ("20798615-1","Ina Leonard","Ap #175-5463 Gravida Rd.","799674","Mukachevo","(314) 821-3917","eu.tellus.eu@protonmail.couk"),
  ("31482969-7","Yoshi Bender","Ap #590-9174 Etiam Av.","3618","Dhule","(143) 768-5680","ornare.elit.elit@google.org");
  
INSERT INTO skill_level (skill_level) VALUES
	('beginner'),
	('intermediate'),
	('advanced');

INSERT INTO instrument (instrument_type) VALUES
	("Trumpet"),
	("Drums"),
	("French Horn"),
	("Triangle"),
	("Bass Guitar"),
	("Keyboard");
	
INSERT INTO genre (genre) VALUES
	("pop"),
	("rock"),
	("reggae"),
	("country");	
	
INSERT INTO rental_price_list (price, quantity, instrument_type) VALUES
	(500, 5, 1),
	(600, 9, 2),
	(350, 12, 3),
	(180, 18, 4),
	(800, 4, 5),
	(750, 9, 6);
	
INSERT INTO lesson_price_list (skill_level_price, skill_level)
VALUES
	(200, 1),
	(300, 2),
	(400, 3);
	
INSERT INTO contact_person (relation, person_id) VALUES
	("parent", 1),
	("brother", 2),
	("mother", 3),
	("father", 4),
	("grandmother", 21),
	("grandfather", 22),
	("cousin", 23),
	("wife", 24),
	("sister", 5);
	
INSERT INTO instructor (employee_number, person_id) VALUES
	(32467487, 6),
	(62790639, 7),
	(67347142, 8),
	(21899886, 9),
	(39276762, 10);
	
INSERT INTO instructor_instrument (instrument_id, instructor_id) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(1, 2),
	(3, 1),
	(5, 1),
	(3, 2),
	(4, 5),
	(4, 3);
	
INSERT INTO instructor_skill_level (skill_level_id, instructor_id) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 4),
	(2, 5),
	(3, 1),
	(3, 5),
	(3, 2),
	(2, 1);
	
INSERT INTO sibling (person_number, student_id) VALUES
	("23764755-6", 10),
    ("13456183-1", 10),
    ("13456183-1", 9),
	("50448682-6", 9),
    ("50448682-6", 8),
    ("23764755-6", 8),
    ("11657839-5", 7),
    ("23733851-0", 6);
    
insert into lesson_type (lesson_type) VALUES
	("individual"),
    ("group"),
    ("ensemble");
	
INSERT INTO lesson (class_room, lesson_type, instructor_id, lesson_price_list_id) VALUES
	("B512", 3, 1, 1),
	("A724", 3, 2, 2),
	("A665", 2, 3, 3),
	("B512", 2, 4, 1),
	("B471", 2, 5, 2),
	("A724", 3, 1, 3),
	("B512", 3, 2, 1),
	("B512", 1, 3, 2),
	("A724", 1, 4, 3),
    ("B112", 3, 3, 1),
    ("B212", 3, 3, 2);
	
INSERT INTO individual_lesson (appointment_number, lesson_id, instrument_id) VALUES
	("a802c9", 8, 1),
	("ccfffe", 9, 2);
	
INSERT INTO group_lesson (min_places, max_places, lesson_id, instrument_id) VALUES
	(5, 12, 3, 1),
	(5, 25, 4, 2),
	(2, 10, 5, 3);
	
INSERT INTO ensemble_lesson (min_places, max_places, lesson_id, genre_id) VALUES
	(4, 20, 6, 1),
	(5, 18, 7, 2),
	(3, 8, 1, 3),
    (3, 8, 10, 2),
	(4, 6, 2, 4),
    
    (2, 7, 11, 3);
	
INSERT INTO discount (discount_percentage) VALUES
	(5),
	(8);
	
INSERT INTO student (person_id, contact_person_id, skill_level_id, discount_id) VALUES
	(11, 1, 1, null),
	(12, 2, 2, null),
	(13, 4, 3, null),
	(14, 5, 1, null),
	(15, 6, 1, null),
	(16, 7, 3, null),
	(17, 8, 3, null),
	(18, 9, 2, null),
	(19, 3, 3, null),
	(20, 3, 1, null);
	
INSERT INTO lesson_student (lesson_id, student_id) VALUES
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(2, 11),
	(2, 12),
	(2, 17),
	(2, 18),
	(2, 19),
	(3, 11),
	(3, 12),
	(3, 13),
	(4, 11),
	(4, 12),
	(4, 13),
	(4, 14),
	(5, 15),
	(5, 16),
	(5, 11),
	(5, 12),
	(5, 17),
	(6, 18),
	(6, 19),
	(6, 11),
	(6, 12),
	(6, 13),
	(7, 18),
	(7, 19),
	(7, 11),
	(7, 12),
	(7, 13),
    (10, 13),
    (10, 12),
    (10, 11),
    (10, 14),
    (10, 15),
    (10, 16),
    (10, 17),
    (10, 18),
    
    (11, 18),
    (11, 19),
    (11, 11);
	
INSERT INTO instrument_rental
(brand, available, start_date, rental_price_list_id, instrument_id, student_id) 
VALUES
	("Gibson", TRUE, '2022-10-10', 1, 1, 15),
	("Harman Professional", TRUE, null, 4, 2, null),
	("Shure", TRUE, null, 5, 3, null),
	("Fender Musical Instruments", TRUE, null, 6, 3, null),
	("Yamaha", TRUE, null, 7, 4, null),
	("Steinway Musical Instruments", TRUE, '2022-05-18', 2, 4, 18),
	("Roland", TRUE, '2022-08-21', 3, 5, 17);

INSERT INTO schedule (schedule_date, time_start, time_end, lesson_id) VALUES
	('2022-10-01', "08:45", "09:45", 1),
	('2022-12-13', "08:00", "09:00", 1),
	('2022-11-12', "12:00", "14:00", 1),
	('2022-09-14', "10:00", "11:00", 3),
	('2022-08-01', "09:00", "10:00", 2),
	('2022-08-11', "19:00", "10:00", 2),
	('2022-07-03', "08:00", "09:00", 2),
	('2022-12-12', "10:00", "11:00", 2),
	('2022-11-11', "08:00", "09:00", 4),
	('2022-09-18', "08:45", "09:45", 5),
	('2022-10-01', "10:00", "11:00", 6),
	('2022-09-06', "08:00", "09:00", 7),
	('2022-08-19', "10:30", "11:30", 1),
    ('2022-08-20', "10:30", "11:30", 8),
	('2022-11-11', "10:00", "11:00", 9),
    ('2022-12-15', "11:00", "12:00", 10),
    ('2021-11-11', "15:15", "16:00", 2),
    
    ('2022-12-16', "08:15", "09:00", 11);
