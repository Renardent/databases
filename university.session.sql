CREATE TABLE students (
    id serial PRIMARY KEY,
    first_name varchar(160) NOT NULL CHECK (first_name != ''),
    last_name varchar(160) NOT NULL CHECK (last_name != ''),
    group_id int REFERENCES groups(id),
    entry date NOT NULL DEFAULT current_date
);

-- ALTER TABLE students
-- ADD COLUMN entry date NOT NULL DEFAULT current_date;


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
    isPassed boolean GENERATED ALWAYS AS (grade >= 60) STORED
);


INSERT INTO faculty (name) VALUES 
('mechanical'),
('filology'),
('biology'),
('alchemistry'),
('Griffindor');


INSERT INTO groups (faculty_id) VALUES
(1), (2), (2), (5), (5);


INSERT INTO students (first_name, last_name, group_id) VALUES
('Harry', 'Potter', 4),
('Ron', 'Weasley', 4),
('Draco', 'Malfoy', 1),
('Dobby', 'Elf', 2);


INSERT INTO disciplines(name, professor) VALUES 
('flying', 'Md. Truck'),
('potions', 'Severus Snape'),
('math', 'Kluchnick');

INSERT INTO exams (student_id, discipline_id, grade) VALUES
(1, 1, 90),
(2, 1, 50),
(3, 3, 20),
(4, 3, 100);

------

UPDATE exams SET grade = 67 WHERE student_id = 2;

CREATE TABLE products (
    id serial PRIMARY KEY,
    brand varchar(200) NOT NULL,
    model varchar(300) NOT NULL,
    description text,
    category varchar(200) NOT NULL,
    price numeric(10,2) NOT NULL CHECK (price > 0),
    discounted_price numeric(10,2) CHECK (discounted_price <= price)
);


INSERT INTO products (brand, model, category, price) VALUES 
('Samsung', 'S10', 'smartphones', 200),
('iPhone', '5', 'smartphones', 500),
('Realme', '6', 'smartphones', 100),
('LG', '5', 'tv', 300),
('Sony', '45', 'tv', 1000);

ALTER TABLE products
ADD COLUMN quantity int CHECK (quantity > 0);

ALTER TABLE products
ADD CONSTRAINT "unique_brand_model_pair" UNIQUE(brand, model);


ALTER TABLE products 
DROP CONSTRAINT "products_quantity_check";

ALTER TABLE products
ADD CONSTRAINT "products_quantity_check" CHECK (quantity >= 0);