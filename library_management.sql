-- ===================================================================

-- Halis Lutfu Baycol - Online Library Management System (PostgreSQL)

-- ===================================================================

-- =========================
-- VIEW TEMİZLE
-- =========================
DROP VIEW IF EXISTS active_borrowings;
-- =========================
-- TABLOLARI TEMİZLE
-- =========================
DROP TABLE IF EXISTS borrowings;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS authors;
-- =========================
-- TABLOLAR
-- =========================

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year INTEGER
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    page_count INTEGER NOT NULL CHECK (page_count > 0),
    author_id INTEGER REFERENCES authors(author_id)
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    register_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id),
    book_id INTEGER NOT NULL REFERENCES books(book_id),
    borrow_date DATE NOT NULL,
    return_date DATE
);

-- =========================
-- YAZARLAR
-- =========================

INSERT INTO authors (full_name, birth_year) VALUES
('George Orwell', 1903),
('Fyodor Dostoyevski', 1821),
('Sabahattin Ali', 1907),
('Franz Kafka', 1883),
('Victor Hugo', 1802),
('Albert Camus', 1913),
('Lutfu Baycol', 1994)
('Natalia Vdovina', 1992);

-- =========================
-- KİTAPLAR
-- =========================

INSERT INTO books (title, page_count, author_id) VALUES
('1984', 328, 1),
('Animal Farm', 112, 1),
('Suç ve Ceza', 671, 8),
('Karamazov Kardeşler', 824, 2),
('Kürk Mantolu Madonna', 160, 3),
('İçimizdeki Şeytan', 208, 3),
('Dava', 256, 4),
('Dönüşüm', 96, 4),
('Sefiller', 1463, 5),
('Notre Dame''ın Kamburu', 940, 5),
('Yabancı', 123, 7),
('Veba', 308, 6);

-- =========================
-- ÜYELER
-- =========================

INSERT INTO members (full_name, email, register_date) VALUES
('Ahmet Yılmaz', 'ahmet@gmail.com', '2023-01-10'),
('Elif Demir', 'elif@gmail.com', '2023-03-15'),
('Mehmet Kaya', 'mehmet@gmail.com', '2023-05-20'),
('Zeynep Arslan', 'zeynep@gmail.com', '2024-01-05'),
('Can Özkan', 'can@gmail.com', '2024-02-12');

-- =========================
-- ÖDÜNÇ ALMA İŞLEMLERİ
-- =========================

INSERT INTO borrowings (member_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2024-01-01', '2024-01-10'),
(1, 3, '2024-02-01', NULL),
(2, 5, '2024-01-15', '2024-01-30'),
(2, 7, '2024-03-01', NULL),
(3, 2, '2024-02-10', '2024-02-20'),
(3, 6, '2024-03-05', NULL),
(4, 9, '2024-01-25', '2024-02-20'),
(4, 10, '2024-03-10', NULL),
(5, 11, '2024-02-18', '2024-03-01'),
(5, 12, '2024-03-15', NULL);

-- =====================================================
-- RAPORLAMA SORGULARI
-- =====================================================

-- 1. En çok ödünç alınan kitaplar

SELECT b.title, COUNT(br.borrowing_id) AS borrow_count FROM books b
JOIN borrowings br ON b.book_id = br.book_id
GROUP BY b.title
ORDER BY borrow_count DESC;

-- 2. Üyelerin aldığı toplam kitap sayısı

SELECT m.full_name, COUNT(br.borrowing_id) AS total_borrowed FROM members m
LEFT JOIN borrowings br ON m.member_id = br.member_id
GROUP BY m.full_name
ORDER BY total_borrowed DESC;

-- 3. Teslim edilmemiş kitaplar

SELECT m.full_name, b.title, br.borrow_date FROM borrowings br
JOIN members m ON br.member_id = m.member_id
JOIN books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;

-- 4. Yazar başına kitap sayısı

SELECT a.full_name, COUNT(b.book_id) AS book_count FROM authors a
LEFT JOIN books b ON a.author_id = b.author_id
GROUP BY a.full_name
ORDER BY book_count DESC;

-- 5. Ortalama sayfa sayısından uzun kitaplar

SELECT title, page_count FROM books
WHERE page_count > (SELECT AVG(page_count) FROM books) ;

-- =====================================================
-- VIEW
-- =====================================================

CREATE VIEW active_borrowings AS
SELECT
    m.full_name AS member_name,
    b.title AS book_title,
    br.borrow_date
FROM borrowings br
JOIN members m ON br.member_id = m.member_id
JOIN books b ON br.book_id = b.book_id
WHERE br.return_da_
