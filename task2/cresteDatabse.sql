drop DATABASE IF EXISTS SoundgoodMusicSchool;
CREATE DATABASE SoundgoodMusicSchool;
USE SoundgoodMusicSchool;

CREATE TABLE skill_level
(id int NOT NULL PRIMARY KEY auto_increment,
skillLevel VARCHAR(25) NOT NULL UNIQUE	);

CREATE TABLE person
(id int NOT NULL PRIMARY KEY auto_increment,
personNumber  VARCHAR(12) NOT NULL UNIQUE,
name VARCHAR(100) NOT NULL,
address VARCHAR(100) NOT NULL,
zip VARCHAR(100) not null,
city VARCHAR(100) not null,
phone VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL);

CREATE TABLE contact_person
(id int NOT NULL PRIMARY KEY auto_increment,
relation VARCHAR(100) NOT NULL,
personId int  not null UNIQUE REFERENCES person(id) ON DELETE CASCADE);

CREATE TABLE instructor
(id int NOT NULL PRIMARY KEY auto_increment,
employeeNumber int NOT NULL UNIQUE,
personId int NOT NULL REFERENCES person(id));

CREATE TABLE student
(id int NOT NULL PRIMARY KEY auto_increment,
personId int not null REFERENCES person(id),
contactPersonId int not null REFERENCES contact_person(id),
skillLevelId int not null REFERENCES skill_level(id),
discount int REFERENCES discount(id));

CREATE TABLE discount
(id int not null PRIMARY KEY auto_increment,
discountPercentage int not NULL);

CREATE TABLE sibling
(personNumber VARCHAR(12) not null,
studentId int not null REFERENCES student(id) ON DELETE CASCADE,
CONSTRAINT PK_Sibling PRIMARY KEY (personNumber, studentId));

CREATE TABLE instrument
(id int not null PRIMARY KEY auto_increment,
instrumentType VARCHAR(50) not null UNIQUE);

CREATE TABLE instructor_instrument
(instrumentId int not null REFERENCES instrument(id) ON DELETE CASCADE,
instructorId int not null REFERENCES instructor(id) ON DELETE CASCADE,
CONSTRAINT PK PRIMARY KEY (instrumentId, instructorId));

CREATE TABLE instructor_skill_level
(skillLevelId int not null REFERENCES skill_level(id) ON DELETE CASCADE,
instructorId int not null REFERENCES instructor(id) ON DELETE CASCADE,
CONSTRAINT PK PRIMARY KEY (skillLevelId, instructorId));

CREATE TABLE rental_price_list
(id int not null PRIMARY KEY auto_increment,
price int not null,
quantity int not null);

CREATE TABLE instrument_rental
(id int not null PRIMARY KEY auto_increment,
instrumentId int not null REFERENCES instrument(id) ON DELETE CASCADE,
brand VARCHAR(50) not null,
available BOOLEAN not null,
startDate DATE,
endDate DATE,
rentalPriceListId int not null REFERENCES rental_price_list(id),
studentId int REFERENCES student(id) ON DELETE SET NULL);

CREATE TABLE lesson_price_list
(id int not null PRIMARY KEY auto_increment,
skillLevelPrice int not null);

CREATE TABLE lesson 
(id int not null PRIMARY KEY auto_increment,
classRoom VARCHAR(10) not null,
instructorId int not null REFERENCES instructor(id),
lessonPriceListId int not null REFERENCES lesson_price_list(id));

CREATE TABLE individual_lesson
(id int not null PRIMARY KEY auto_increment,
appointmentNumber VARCHAR(10) not null UNIQUE,
lessonId int not null REFERENCES lesson(id),
instrumentId int not null REFERENCES instrument(id));

CREATE TABLE group_lesson
(id int not null PRIMARY KEY auto_increment,
minPlaces int not null,
maxPlaces int not NULL,
lessonId int not null REFERENCES lesson(id),
instrumentId int not null REFERENCES instrument(id));

CREATE TABLE genre
(id int not null PRIMARY KEY auto_increment,
genre VARCHAR(50) not null UNIQUE);

CREATE TABLE ensemble_lesson
(id int not null PRIMARY KEY auto_increment,
minPlaces int not NULL,
maxPlaces int not null,
lessonId int not null REFERENCES lesson(id),
genreId int not null REFERENCES genre(id));

CREATE TABLE lesson_student
(lessonId int not null REFERENCES lesson(id),
studentId int not null REFERENCES student(id),
CONSTRAINT PK PRIMARY KEY (lessonId, studentId));