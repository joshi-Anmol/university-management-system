create database sankalp_university ;
use sankalp_university ;
-- ========= building table ==========
create table building (
bd_id int primary key  , 
bd_name varchar (60) ); 

-- ========= department =============
create table department (
dep_id int primary key , 
dep_name varchar(50) , 
bd_id int , foreign key (bd_id) references building (bd_id ) 
);

-- =========== course =============
create table course (
cou_id int primary key ,
cou_name varchar(50) ,
credits int ,
dep_id int , foreign key (dep_id) references department(dep_id) 
);

-- ============== faculty =================
create table faculty (
fac_id int primary key ,
fac_name varchar(50) ,
email varchar(50) check (email  like '%.com')  ,
phone_no bigint ,
dep_id int , foreign key (dep_id)  references department (dep_id)
);
--  ============== teachers ===============
create table teachers(
teac_id int primary key ,
fac_id int  ,
cou_id int ,
FOREIGN KEY (cou_id) REFERENCES course(cou_id),
FOREIGN KEY (fac_id) REFERENCES faculty(fac_id)
);

-- ================ student ======================
 create table student(
stud_id int primary key ,
stud_name varchar(50)  ,
phone_no bigint ,
cou_id int , 
dep_id int ,
foreign key (cou_id) references course(cou_id),
foreign key (dep_id) references department (dep_id ) 
);

-- =============== enrollment =====================
CREATE TABLE enrollment (
    enroll_id INT PRIMARY KEY,
    stud_id INT,
    cou_id INT,
    semester VARCHAR(10),
    FOREIGN KEY (stud_id) REFERENCES student(stud_id),
    FOREIGN KEY (cou_id) REFERENCES course(cou_id)
);

-- ========== BUILDING TABLE ==========
INSERT INTO building (bd_id, bd_name) VALUES
(1, 'Main Block'),
(2, 'Science Tower'),
(3, 'Engineering Annex'),
(4, 'Humanities Hub'),
(5, 'Library Complex');

-- ========== DEPARTMENT TABLE ==========
INSERT INTO department (dep_id, dep_name, bd_id) VALUES
(101, 'Computer Science', 1),
(102, 'Mechanical Engineering', 3),
(103, 'Electrical Engineering', 3),
(104, 'Civil Engineering', 3),
(105, 'Physics', 2),
(106, 'Mathematics', 2),
(107, 'English Literature', 4),
(108, 'History', 4),
(109, 'Library Sciences', 5),
(110, 'Artificial Intelligence', 1);

-- ========== COURSE TABLE ==========
INSERT INTO course (cou_id, cou_name, credits, dep_id) VALUES
(201, 'Data Structures', 4, 101),
(202, 'Thermodynamics', 4, 102),
(203, 'Circuit Theory', 4, 103),
(204, 'Structural Design', 4, 104),
(205, 'Quantum Physics', 3, 105),
(206, 'Linear Algebra', 3, 106),
(207, 'Poetry Analysis', 2, 107),
(208, 'Modern History', 2, 108),
(209, 'Library Management', 2, 109),
(210, 'Machine Learning', 4, 110),
(211, 'Database Systems', 3, 101),
(212, 'Fluid Mechanics', 4, 102),
(213, 'Electromagnetism', 3, 103),
(214, 'Surveying', 3, 104),
(215, 'Optics', 3, 105),
(216, 'Calculus', 3, 106),
(217, 'Drama Studies', 2, 107),
(218, 'World War II', 3, 108),
(219, 'Cataloguing', 2, 109),
(220, 'Neural Networks', 4, 110);

-- ========== FACULTY TABLE ==========
INSERT INTO faculty (fac_id, fac_name, email, phone_no, dep_id) VALUES
(301, 'Dr. Nisha Rao', 'nisha@cs.com', 9876543210, 101),
(302, 'Dr. Arvind Mehta', 'arvind@mech.com', 9876543211, 102),
(303, 'Dr. Sunil Patil', 'sunil@ee.com', 9876543212, 103),
(304, 'Dr. Kiran Desai', 'kiran@civil.com', 9876543213, 104),
(305, 'Dr. Neeta Shah', 'neeta@phy.com', 9876543214, 105),
(306, 'Dr. Meenal Joshi', 'meenal@math.com', 9876543215, 106),
(307, 'Prof. Aarti Iyer', 'aarti@eng.com', 9876543216, 107),
(308, 'Prof. Ramesh Roy', 'ramesh@hist.com', 9876543217, 108),
(309, 'Dr. Sneha Nair', 'sneha@lib.com', 9876543218, 109),
(310, 'Dr. Aman Khan', 'aman@ai.com', 9876543219, 110);

-- ========== TEACHERS TABLE ==========
INSERT INTO teachers (teac_id, fac_id, cou_id) VALUES
(401, 301, 201),
(402, 301, 211),
(403, 302, 202),
(404, 303, 203),
(405, 304, 204),
(406, 305, 205),
(407, 306, 206),
(408, 307, 207),
(409, 308, 208),
(410, 310, 210);

-- ========== STUDENT TABLE ==========
INSERT INTO student (stud_id, stud_name, phone_no, cou_id, dep_id) VALUES
(501, 'Rohit Sharma', 9876000001, 201, 101),
(502, 'Anjali Mehta', 9876000002, 202, 102),
(503, 'Kunal Verma', 9876000003, 203, 103),
(504, 'Sneha Singh', 9876000004, 204, 104),
(505, 'Arjun Reddy', 9876000005, 205, 105),
(506, 'Kriti Rao', 9876000006, 206, 106),
(507, 'Aman Joshi', 9876000007, 207, 107),
(508, 'Priya Sen', 9876000008, 208, 108),
(509, 'Nikhil Roy', 9876000009, 209, 109),
(510, 'Reena Kapoor', 9876000010, 210, 110),
(511, 'Yash Thakur', 9876000011, 201, 101),
(512, 'Ishita Das', 9876000012, 202, 102),
(513, 'Manav Bansal', 9876000013, 203, 103),
(514, 'Zara Ali', 9876000014, 204, 104),
(515, 'Rajeev Nair', 9876000015, 205, 105),
(516, 'Nisha Singh', 9876000016, 206, 106),
(517, 'Ritesh Mehta', 9876000017, 207, 107),
(518, 'Sanya Kapoor', 9876000018, 208, 108),
(519, 'Dev Sharma', 9876000019, 209, 109),
(520, 'Farhan Khan', 9876000020, 210, 110),
(521, 'Lakshmi Iyer', 9876000021, 211, 101),
(522, 'Ravi Varma', 9876000022, 212, 102),
(523, 'Ayesha Kaur', 9876000023, 213, 103),
(524, 'Vikram Das', 9876000024, 214, 104),
(525, 'Simran Ahuja', 9876000025, 215, 105),
(526, 'Kavita Rathi', 9876000026, 216, 106),
(527, 'Tanmay Shah', 9876000027, 217, 107),
(528, 'Megha Patil', 9876000028, 218, 108),
(529, 'Raj Malhotra', 9876000029, 219, 109),
(530, 'Alisha Jain', 9876000030, 220, 110);

-- ========== ENROLLMENT TABLE ==========
INSERT INTO enrollment (enroll_id, stud_id, cou_id, semester) VALUES
(601, 501, 201, 'Sem1'),
(602, 502, 202, 'Sem1'),
(603, 503, 203, 'Sem1'),
(604, 504, 204, 'Sem1'),
(605, 505, 205, 'Sem2'),
(606, 506, 206, 'Sem2'),
(607, 507, 207, 'Sem2'),
(608, 508, 208, 'Sem2'),
(609, 509, 209, 'Sem3'),
(610, 510, 210, 'Sem3'),
(611, 511, 201, 'Sem1'),
(612, 512, 202, 'Sem1'),
(613, 513, 203, 'Sem1'),
(614, 514, 204, 'Sem1'),
(615, 515, 205, 'Sem2'),
(616, 516, 206, 'Sem2'),
(617, 517, 207, 'Sem2'),
(618, 518, 208, 'Sem2'),
(619, 519, 209, 'Sem3'),
(620, 520, 210, 'Sem3'),
(621, 521, 211, 'Sem1'),
(622, 522, 212, 'Sem1'),
(623, 523, 213, 'Sem1'),
(624, 524, 214, 'Sem1'),
(625, 525, 215, 'Sem2'),
(626, 526, 216, 'Sem2'),
(627, 527, 217, 'Sem2'),
(628, 528, 218, 'Sem2'),
(629, 529, 219, 'Sem3'),
(630, 530, 220, 'Sem3');


-- ++++++++++++++++  SQL QUERY ++++++++++++++++++++
-- 1. Retrieve all students enrolled in a particular course (e.g., 'Machine Learning')
SELECT s.* 
FROM student s
JOIN enrollment e ON s.stud_id = e.stud_id
JOIN course c ON e.cou_id = c.cou_id
WHERE c.cou_name = 'Machine Learning';

-- 2. Retrieve all courses taught by faculty with fac_id = 2
SELECT c.*
FROM course c
JOIN teachers t ON c.cou_id = t.cou_id
WHERE t.fac_id = 2;

-- 3. List all departments located in a specific building (e.g., bd_id = 1)
SELECT *
FROM department
WHERE bd_id = 1;

-- ++++++++++++++++ JOINS  SQL QUERY ++++++++++++++++++++

-- 1. Students enrolled in 'Machine Learning' taught by 'Dr. Marie Curie'
SELECT s.stud_name
FROM student s
JOIN enrollment e ON s.stud_id = e.stud_id
JOIN course c ON e.cou_id = c.cou_id
JOIN teachers t ON c.cou_id = t.cou_id
JOIN faculty f ON t.fac_id = f.fac_id
WHERE c.cou_name = 'Electrical Engineering'
  AND f.fac_name = 'Dr. Marie Curie';

-- 2. Students enrolled in 'Data Structures' taught by 'Dr. Alan Turing'
SELECT s.*
FROM student s
JOIN enrollment e ON s.stud_id = e.stud_id
JOIN course c ON e.cou_id = c.cou_id
JOIN teachers t ON c.cou_id = t.cou_id
JOIN faculty f ON t.fac_id = f.fac_id
WHERE c.cou_name = 'Data Structures'
  AND f.fac_name = 'Dr. Neeta Shah' ;

-- 3. All departments and their buildings (bd_id = 1)
SELECT d.*
FROM department d
JOIN building b ON d.bd_id = b.bd_id
WHERE b.bd_id = 1;

-- 4. All faculty with their courses and departments
SELECT f.fac_name, c.cou_name, d.dep_name
FROM faculty f
JOIN teachers t ON f.fac_id = t.fac_id
JOIN course c ON t.cou_id = c.cou_id
JOIN department d ON c.dep_id = d.dep_id
ORDER BY d.dep_name, f.fac_name;

-- ++++++++++++++++ AGGREAGATE SQL QUERY ++++++++++++++++++++
-- 2. Count of distinct students (across all departments)
SELECT COUNT(DISTINCT s.stud_id) AS total_students
FROM student s;



-- total no of courses offered by each department 
SELECT d.dep_id, COUNT(c.cou_id) AS total_courses
FROM department d
JOIN course c ON d.dep_id = c.dep_id
GROUP BY d.dep_id;

-- to select the avg grade of a student in each department 

SELECT d.dep_name, AVG(c.credits) AS avg_credits
FROM course c
JOIN department d ON c.dep_id = d.dep_id
GROUP BY d.dep_id, d.dep_name;

