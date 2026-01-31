# Halis Lutfu Baycol - Online Library Management System (PostgreSQL)

Bu proje, PostgreSQL kullanılarak geliştirilmiş **Online Kütüphane Yönetim Sistemi** veritabanı uygulamasıdır.  

---

##  Projenin Amacı

Bu proje ile aşağıdaki SQL yetkinliklerinin gösterilmesi amaçlanmıştır:

- İlişkisel veritabanı tasarımı
- PRIMARY KEY / FOREIGN KEY kullanımı
- Gerçekçi tablo ilişkileri
- Raporlama ve analiz sorguları
- Tek dosya üzerinden temiz kurulum

---

##  Veritabanı Yapısı

Projede aşağıdaki tablolar bulunmaktadır:

- **authors** → Yazar bilgileri
- **books** → Kitap bilgileri
- **members** → Kütüphane üyeleri
- **borrowings** → Ödünç alma işlemleri

Ayrıca aktif ödünç alma işlemlerini gösteren bir adet **VIEW** bulunmaktadır:

- **active_borrowings**

---

##  Kullanılan SQL Konuları

- `CREATE TABLE`, `DROP TABLE IF EXISTS`
- `PRIMARY KEY`, `FOREIGN KEY`
- `NOT NULL`, `UNIQUE`, `CHECK`
- `INSERT INTO`
- `JOIN` (INNER JOIN, LEFT JOIN)
- `GROUP BY`, `COUNT`, `AVG`
- `Subquery`
- `CREATE VIEW`

---

##  İçerik

- Tablo oluşturma (DDL)
- Örnek veri ekleme (Dummy Data)
- Raporlama sorguları
- Aktif ödünç işlemleri için View

---