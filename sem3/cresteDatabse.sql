DROP DATABASE

IF EXISTS SoundgoodMusicSchool;
	CREATE DATABASE SoundgoodMusicSchool;

USE SoundgoodMusicSchool;

CREATE TABLE skill_level (
	id INT NOT NULL PRIMARY KEY auto_increment
	,skill_level VARCHAR(25) NOT NULL UNIQUE
	);

CREATE TABLE person (
	id INT NOT NULL PRIMARY KEY auto_increment
	,person_number VARCHAR(12) NOT NULL UNIQUE
	,name VARCHAR(100) NOT NULL
	,address VARCHAR(100) NOT NULL
	,zip VARCHAR(100) NOT NULL
	,city VARCHAR(100) NOT NULL
	,phone VARCHAR(100) NOT NULL
	,email VARCHAR(100) NOT NULL
	);

CREATE TABLE contact_person (
	id INT NOT NULL PRIMARY KEY auto_increment
	,relation VARCHAR(100) NOT NULL
	,person_id INT NOT NULL UNIQUE REFERENCES person(id) ON DELETE CASCADE
	);

CREATE TABLE instructor (
	id INT NOT NULL PRIMARY KEY auto_increment
	,employee_number INT NOT NULL UNIQUE
	,person_id INT NOT NULL REFERENCES person(id)
	);

CREATE TABLE student (
	id INT NOT NULL PRIMARY KEY auto_increment
	,person_id INT NOT NULL REFERENCES person(id)
	,contact_person_id INT NOT NULL REFERENCES contact_person(id)
	,skill_level_id INT NOT NULL REFERENCES skill_level(id)
	,discount_id INT REFERENCES discount(id)
	);

CREATE TABLE discount (
	id INT NOT NULL PRIMARY KEY auto_increment
	,discount_percentage INT NOT NULL
	);

CREATE TABLE sibling (
	person_number VARCHAR(12) NOT NULL
	,student_id INT NOT NULL REFERENCES student(id) ON DELETE CASCADE
	,CONSTRAINT PK_Sibling PRIMARY KEY (
		person_number
		,student_id
		)
	);

CREATE TABLE instrument (
	id INT NOT NULL PRIMARY KEY auto_increment
	,instrument_type VARCHAR(50) NOT NULL UNIQUE
	);

CREATE TABLE instructor_instrument (
	instrument_id INT NOT NULL REFERENCES instrument(id) ON DELETE CASCADE
	,instructor_id INT NOT NULL REFERENCES instructor(id) ON DELETE CASCADE
	,CONSTRAINT PK PRIMARY KEY (
		instrument_id
		,instructor_id
		)
	);

CREATE TABLE instructor_skill_level (
	skill_level_id INT NOT NULL REFERENCES skill_level(id) ON DELETE CASCADE
	,instructor_id INT NOT NULL REFERENCES instructor(id) ON DELETE CASCADE
	,CONSTRAINT PK PRIMARY KEY (
		skill_level_id
		,instructor_id
		)
	);

CREATE TABLE rental_price_list (
	id INT NOT NULL PRIMARY KEY auto_increment
	,price INT NOT NULL
	,quantity INT NOT NULL
	,instrument_type INT NOT NULL REFERENCES instrument(id)
	);

CREATE TABLE instrument_rental (
	id INT NOT NULL PRIMARY KEY auto_increment
	,instrument_id INT NOT NULL REFERENCES instrument(id) ON DELETE CASCADE
	,brand VARCHAR(50) NOT NULL
	,available BOOLEAN NOT NULL
	,start_date DATE
	,rental_price_list_id INT NOT NULL REFERENCES rental_price_list(id)
	,student_id INT REFERENCES student(id) ON DELETE SET NULL
	);

CREATE TABLE lesson_price_list (
	id INT NOT NULL PRIMARY KEY auto_increment
	,skill_level_price INT NOT NULL
	,skill_level INT NOT NULL REFERENCES skill_level(id)
	);

CREATE TABLE lesson_type (
	id INT NOT NULL PRIMARY KEY auto_increment
	,lesson_type VARCHAR(50)
	);

CREATE TABLE lesson (
	id INT NOT NULL PRIMARY KEY auto_increment
	,class_room VARCHAR(10) NOT NULL
	,lesson_type VARCHAR(10) NOT NULL REFERENCES lesson_type(id)
	,instructor_id INT NOT NULL REFERENCES instructor(id)
	,lesson_price_list_id INT NOT NULL REFERENCES lesson_price_list(id)
	);

CREATE TABLE individual_lesson (
	id INT NOT NULL PRIMARY KEY auto_increment
	,appointment_number VARCHAR(10) NOT NULL UNIQUE
	,lesson_id INT NOT NULL REFERENCES lesson(id)
	,instrument_id INT NOT NULL REFERENCES instrument(id)
	);

CREATE TABLE group_lesson (
	id INT NOT NULL PRIMARY KEY auto_increment
	,min_places INT NOT NULL
	,max_places INT NOT NULL
	,lesson_id INT NOT NULL REFERENCES lesson(id)
	,instrument_id INT NOT NULL REFERENCES instrument(id)
	);

CREATE TABLE genre (
	id INT NOT NULL PRIMARY KEY auto_increment
	,genre VARCHAR(50) NOT NULL UNIQUE
	);

CREATE TABLE ensemble_lesson (
	id INT NOT NULL PRIMARY KEY auto_increment
	,min_places INT NOT NULL
	,max_places INT NOT NULL
	,lesson_id INT NOT NULL REFERENCES lesson(id)
	,genre_id INT NOT NULL REFERENCES genre(id)
	);

CREATE TABLE lesson_student (
	lesson_id INT NOT NULL REFERENCES lesson(id)
	,student_id INT NOT NULL REFERENCES student(id)
	,CONSTRAINT PK PRIMARY KEY (
		lesson_id
		,student_id
		)
	);

CREATE TABLE schedule (
	id INT NOT NULL PRIMARY KEY auto_increment
	,schedule_date DATE NOT NULL
	,time_start TIME NOT NULL
	,time_end TIME NOT NULL
	,lesson_id INT NOT NULL REFERENCES lesson(id)
	);
