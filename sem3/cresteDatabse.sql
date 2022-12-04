drop DATABASE IF EXISTS SoundgoodMusicSchool;
CREATE DATABASE SoundgoodMusicSchool;
USE SoundgoodMusicSchool;

CREATE TABLE skill_level
(id int NOT NULL PRIMARY KEY auto_increment,
skill_level VARCHAR(25) NOT NULL UNIQUE	);

CREATE TABLE person
(id int NOT NULL PRIMARY KEY auto_increment,
person_number  VARCHAR(12) NOT NULL UNIQUE,
name VARCHAR(100) NOT NULL,
address VARCHAR(100) NOT NULL,
zip VARCHAR(100) not null,
city VARCHAR(100) not null,
phone VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL);

CREATE TABLE contact_person
(id int NOT NULL PRIMARY KEY auto_increment,
relation VARCHAR(100) NOT NULL,
person_id int  not null UNIQUE REFERENCES person(id) ON DELETE CASCADE);

CREATE TABLE instructor
(id int NOT NULL PRIMARY KEY auto_increment,
employee_number int NOT NULL UNIQUE,
person_id int NOT NULL REFERENCES person(id));

CREATE TABLE student
(id int NOT NULL PRIMARY KEY auto_increment,
person_id int not null REFERENCES person(id),
contact_person_id int not null REFERENCES contact_person(id),
skill_level_id int not null REFERENCES skill_level(id),
discount_id int REFERENCES discount(id));

CREATE TABLE discount
(id int not null PRIMARY KEY auto_increment,
discount_percentage int not NULL);

CREATE TABLE sibling
(person_number VARCHAR(12) not null,
student_id int not null REFERENCES student(id) ON DELETE CASCADE,
CONSTRAINT PK_Sibling PRIMARY KEY (person_number, student_id));

CREATE TABLE instrument
(id int not null PRIMARY KEY auto_increment,
instrument_type VARCHAR(50) not null UNIQUE);

CREATE TABLE instructor_instrument
(instrument_id int not null REFERENCES instrument(id) ON DELETE CASCADE,
instructor_id int not null REFERENCES instructor(id) ON DELETE CASCADE,
CONSTRAINT PK PRIMARY KEY (instrument_id, instructor_id));

CREATE TABLE instructor_skill_level
(skill_level_id int not null REFERENCES skill_level(id) ON DELETE CASCADE,
instructor_id int not null REFERENCES instructor(id) ON DELETE CASCADE,
CONSTRAINT PK PRIMARY KEY (skill_level_id, instructor_id));

CREATE TABLE rental_price_list
(id int not null PRIMARY KEY auto_increment,
price int not null,
quantity int not null,
instrument_type int not null REFERENCES instrument(id));

CREATE TABLE instrument_rental
(id int not null PRIMARY KEY auto_increment,
instrument_id int not null REFERENCES instrument(id) ON DELETE CASCADE,
brand VARCHAR(50) not null,
available BOOLEAN not null,
start_date DATE,
rental_price_list_id int not null REFERENCES rental_price_list(id),
student_id int REFERENCES student(id) ON DELETE SET NULL);

CREATE TABLE lesson_price_list
(id int not null PRIMARY KEY auto_increment,
skill_level_price int not null,
skill_level int not null REFERENCES skill_level(id));

create table lesson_type
(id int not null primary key auto_increment,
lesson_type varchar(50));

CREATE TABLE lesson 
(id int not null PRIMARY KEY auto_increment,
class_room VARCHAR(10) not null,
lesson_type varchar(10) not null references lesson_type(id),
instructor_id int not null REFERENCES instructor(id),
lesson_price_list_id int not null REFERENCES lesson_price_list(id));

CREATE TABLE individual_lesson
(id int not null PRIMARY KEY auto_increment,
appointment_number VARCHAR(10) not null UNIQUE,
lesson_id int not null REFERENCES lesson(id),
instrument_id int not null REFERENCES instrument(id));

CREATE TABLE group_lesson
(id int not null PRIMARY KEY auto_increment,
min_places int not null,
max_places int not NULL,
lesson_id int not null REFERENCES lesson(id),
instrument_id int not null REFERENCES instrument(id));

CREATE TABLE genre
(id int not null PRIMARY KEY auto_increment,
genre VARCHAR(50) not null UNIQUE);

CREATE TABLE ensemble_lesson
(id int not null PRIMARY KEY auto_increment,
min_places int not NULL,
max_places int not null,
lesson_id int not null REFERENCES lesson(id),
genre_id int not null REFERENCES genre(id));

CREATE TABLE lesson_student
(lesson_id int not null REFERENCES lesson(id),
student_id int not null REFERENCES student(id),
CONSTRAINT PK PRIMARY KEY (lesson_id, student_id));

CREATE TABLE schedule
(id int not null PRIMARY KEY auto_increment,
schedule_date DATE not NULL,
time_start TIME not null,
time_end TIME not null,
lesson_id int not null REFERENCES lesson(id));