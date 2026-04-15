-- Tạo bảng students
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    major VARCHAR(50),
    gpa DECIMAL(3,2)
);

-- Thêm dữ liệu mẫu
INSERT INTO students (name, age, major, gpa) VALUES
('An', 20, 'CNTT', 3.5),
('Bình', 21, 'Toán', 3.2),
('Cường', 22, 'CNTT', 3.8),
('Dương', 20, 'Vật lý', 3.0),
('Em', 21, 'CNTT', 2.9);

-- Thêm sinh viên mới
INSERT INTO students (name, age, major, gpa)
VALUES ('Hùng', 23, 'Hóa học', 3.4);

-- Cập nhật GPA của Bình thành 3.6
UPDATE students
SET gpa = 3.6
WHERE name = 'Bình';

-- Xóa sinh viên có GPA thấp hơn 3.0
DELETE FROM students
WHERE gpa < 3.0;

-- Liệt kê tất cả sinh viên, chỉ hiển thị tên và chuyên ngành, sắp xếp GPA giảm dần
SELECT name, major FROM students
ORDER BY gpa DESC;

-- Liệt kê sinh viên duy nhất có chuyên ngành CNTT
SELECT DISTINCT name FROM students
WHERE major = 'CNTT';

-- Liệt kê sinh viên có GPA từ 3.0 đến 3.6
SELECT * FROM students
WHERE gpa BETWEEN 3.0 AND 3.6;

-- Liệt kê sinh viên có tên bắt đầu bằng chữ C
SELECT * FROM students
WHERE name LIKE 'C%';

-- Hiển thị 3 sinh viên đầu tiên theo thứ tự tên tăng dần
SELECT * FROM students
ORDER BY name ASC
LIMIT 3;

-- Lấy từ sinh viên thứ 2 đến thứ 4
SELECT * FROM students
ORDER BY name ASC
LIMIT 3 OFFSET 1;