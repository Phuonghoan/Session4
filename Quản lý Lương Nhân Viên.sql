-- 1a. Xóa các bản ghi trùng nhau hoàn toàn về tên, phòng ban và vị trí
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY full_name, department, position
);

-- 2a. Tăng 10% lương cho nhân viên phòng IT có lương dưới 18,000,000
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT'
  AND salary < 18000000;

-- 2b. Nếu bonus IS NULL thì đặt bonus = 500000
UPDATE employees
SET bonus = 500000
WHERE bonus IS NULL;

-- 3a. Danh sách nhân viên thuộc IT hoặc HR, gia nhập sau năm 2020,
-- và tổng thu nhập > 15,000,000
SELECT * FROM employees
WHERE department IN ('IT', 'HR')
  AND join_year > 2020
  AND (salary + bonus) > 15000000;

-- 3b. Chỉ lấy 3 nhân viên đầu tiên sau khi sắp xếp giảm dần theo tổng thu nhập
SELECT *,
       (salary + bonus) AS total_income
FROM employees
ORDER BY total_income DESC
LIMIT 3;

-- 4a. Tìm nhân viên có tên bắt đầu bằng "Nguyễn" hoặc kết thúc bằng "Hân"
SELECT * FROM employees
WHERE full_name LIKE 'Nguyễn%'
   OR full_name LIKE '%Hân';

-- 5a. Liệt kê các phòng ban duy nhất có ít nhất một nhân viên bonus IS NOT NULL
SELECT DISTINCT department FROM employees
WHERE bonus IS NOT NULL;

-- 6a. Hiển thị nhân viên gia nhập trong khoảng từ 2019 đến 2022
SELECT * FROM employees
WHERE join_year BETWEEN 2019 AND 2022;