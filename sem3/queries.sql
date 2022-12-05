DROP VIEW IF EXISTS couting_lessons_view;
DROP VIEW IF EXISTS instructor_lessons_current_month_view;
DROP VIEW IF EXISTS student_siblings_view;
DROP VIEW IF EXISTS ensembles_next_week_schedule_view;

-- counting lessons
CREATE VIEW couting_lessons_view
AS
SELECT 
	DATE_FORMAT(schedule_date, '%Y-%m') AS 'year_month', 
	COUNT(schedule.id) AS 'total lessons', 
	SUM(lesson_type = 1) AS 'individual lessons', 
	SUM(lesson_type = 2) AS 'group lessons', 
	SUM(lesson_type = 3) AS 'ensemble lessons' 
FROM schedule JOIN lesson ON lesson.id = schedule.lesson_id 
	WHERE YEAR(schedule_date) IN (2022) 
	GROUP BY MONTH(schedule_date) 
    ORDER BY schedule_date DESC;
        
-- List all instructors who has given more than a specific number of lessons during the current month
CREATE VIEW instructor_lessons_current_month_view
AS
SELECT 
	person.name AS 'instructor', 
	COUNT(instructor_id) AS 'Lessons', schedule_date 
FROM 
	schedule JOIN lesson ON lesson_id = lesson.id JOIN instructor ON instructor_id = instructor.id JOIN person ON person_id = person.id
	WHERE MONTH(schedule_date) = MONTH(current_date()) 
    GROUP BY person.name
    HAVING lessons >= 1 
    ORDER BY lessons DESC;
    
-- Show how many students there are with no sibling, with one sibling, with two siblings, etc. 
CREATE VIEW student_siblings_view
AS
SELECT 
	DISTINCT COUNT(sibling.student_id) AS 'siblings',
	CASE 
		WHEN COUNT(sibling.student_id) = 0 THEN COUNT(person.id)
		WHEN COUNT(sibling.student_id) = COUNT(sibling.student_id) THEN COUNT(sibling.student_id) + 1
	END AS 'students'
FROM sibling RIGHT JOIN student ON student_id = student.id JOIN person ON person_id = person.id 
	GROUP BY sibling.student_id 
	ORDER BY sibling.student_id;
    
    
-- List all ensembles held during the next week, sorted by music genre and weekday
CREATE VIEW ensembles_next_week_schedule_view
AS
SELECT 
	schedule_date, time_start, time_end, genre, ensemble_lesson.max_places AS 'max seats', 
	CASE 
		WHEN COUNT(lesson_student.lesson_id) = ensemble_lesson.max_places THEN 'Full booked' 
		WHEN COUNT(lesson_student.lesson_id) = (ensemble_lesson.max_places - 1)  THEN 'One seat left'
        WHEN COUNT(lesson_student.lesson_id) = (ensemble_lesson.max_places - 2)  THEN 'Two seats left'
        WHEN COUNT(lesson_student.lesson_id + 3) < (ensemble_lesson.max_places)  THEN 'Many seats left'
    END AS 'seats  left'
FROM schedule JOIN lesson ON lesson_id = lesson.id 
	JOIN lesson_type ON lesson_type.id = lesson.lesson_type 
	JOIN ensemble_lesson ON ensemble_lesson.lesson_id = lesson.id 
	JOIN genre ON genre_id = genre.id 
	JOIN lesson_student ON lesson_student.lesson_id = lesson.id
WHERE WEEK(schedule_date, 7) =  WEEK(current_date(), 7) + 1
GROUP BY lesson_student.lesson_id
ORDER BY genre, schedule_date;

-- Queries
SELECT * FROM couting_lessons_view;
SELECT * FROM instructor_lessons_current_month_view;
SELECT * FROM student_siblings_view;
SELECT * FROM ensembles_next_week_schedule_view;