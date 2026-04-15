-- 1a. Thêm sản phẩm mới
INSERT INTO products (name, category, price, stock, manufacturer)
VALUES ('Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

-- 2a. Tăng giá tất cả sản phẩm của Apple thêm 10%
UPDATE products
SET price = price * 1.10
WHERE manufacturer = 'Apple';

-- 3a. Xóa sản phẩm có stock = 0
DELETE FROM products
WHERE stock = 0;

-- 4a. Hiển thị sản phẩm có price BETWEEN 1000000 AND 30000000
SELECT * FROM products
WHERE price BETWEEN 1000000 AND 30000000;

-- 5a. Hiển thị sản phẩm có stock IS NULL
SELECT * FROM products
WHERE stock IS NULL;

-- 6a. Liệt kê danh sách hãng sản xuất duy nhất
SELECT DISTINCT manufacturer
FROM products;

-- 7a. Hiển thị toàn bộ sản phẩm, sắp xếp giảm dần theo giá, sau đó tăng dần theo tên
SELECT * FROM products
ORDER BY price DESC, name ASC;

-- 8a. Tìm sản phẩm có tên chứa từ “laptop” (không phân biệt hoa thường)
SELECT * FROM products
WHERE name ILIKE '%laptop%';

-- 9a. Lấy về 2 sản phẩm đầu tiên sau khi sắp xếp theo giá giảm dần
SELECT * FROM products
ORDER BY price DESC
LIMIT 2;