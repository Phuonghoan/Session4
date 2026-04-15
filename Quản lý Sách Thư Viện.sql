-- 1a. Xóa các bản ghi trùng lặp hoàn toàn về title, author, publish_year
DELETE FROM books
WHERE id NOT IN (
    SELECT MIN(id)
    FROM books
    GROUP BY title, author, publish_year
);

-- 2a. Tăng giá 10% cho sách xuất bản từ năm 2021 trở đi và có price < 200000
UPDATE books
SET price = price * 1.10
WHERE publish_year >= 2021
  AND price < 200000;

-- 3a. Với những sách có stock IS NULL, cập nhật stock = 0
UPDATE books
SET stock = 0
WHERE stock IS NULL;

-- 4a. Liệt kê sách thuộc chủ đề CNTT hoặc AI có giá trong khoảng 100000 - 250000
SELECT *
FROM books
WHERE category IN ('CNTT', 'AI')
  AND price BETWEEN 100000 AND 250000;

-- 4b. Sắp xếp giảm dần theo price, rồi tăng dần theo title
SELECT *
FROM books
WHERE category IN ('CNTT', 'AI')
  AND price BETWEEN 100000 AND 250000
ORDER BY price DESC, title ASC;

-- 5a. Tìm các sách có tiêu đề chứa từ “học” (không phân biệt hoa thường)
SELECT *
FROM books
WHERE title ILIKE '%học%';

-- 6a. Liệt kê các thể loại duy nhất có ít nhất một cuốn sách xuất bản sau năm 2020
SELECT DISTINCT category
FROM books
WHERE publish_year > 2020;

-- 7a. Chỉ hiển thị 2 kết quả đầu tiên, bỏ qua 1 kết quả đầu tiên
SELECT *
FROM books
LIMIT 2 OFFSET 1;