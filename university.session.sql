CREATE TABLE students (
    id serial PRIMARY KEY,
    first_name varchar(160) NOT NULL CHECK (first_name != ''),
    last_name varchar(160) NOT NULL CHECK (last_name != ''),
    group_id int REFERENCES groups(id)
);


CREATE TABLE groups(
    id serial PRIMARY KEY,
    faculty_id int REFERENCES faculty(id)
);

CREATE TABLE faculty (
    id serial PRIMARY KEY,
    name varchar(60) NOT NULL CHECK (name != '')
);

CREATE TABLE disciplines(
    id serial PRIMARY KEY,
    name varchar(60) NOT NULL CHECK (name != ''),
    professor varchar(60) NOT NULL CHECK (professor != '')
);

CREATE TABLE exams(
    student_id int REFERENCES students(id),
    discipline_id int REFERENCES disciplines(id),
    grade int,
    isPassed boolean
);