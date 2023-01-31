----- KISILTLAMALAR-----

-- 1.Data Query Language (Veri Sorgulama Dili - DQL)
SELECT: veritabanındaki verileri alır.

-- 2.Data Manipulation Language (Veri Kullanma Dili - DML)
INSERT:Veritabanına yeni veri ekler.
DELETE:Veritabanındaki verileri siler
UPDATE:Veritabanındaki verileri günceller.

  -3.Data Definition Language (Veri Tanimlama Dili - DDL)
DROP: Bir veritabanını veya veritabanı içindeki tabloyu siler.
ALTER: Bir veritabanı veya veritabanı içindeki tabloyu günceller.
CREATE:Bir veritabanı veya veritabanı içinde tablo oluşturur.
------------------------------------------------------------
--1. parent tabloda olmayan PRIMARY KEY child tabloya verilemez boyle bir giris yapilamaz
--2. child tablodaki veri silinmeden parent tablodaki veri silinemez 
--3. child tablo silinmeden parent tablo silinemez

CREATE TABLE parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO parent VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO parent VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO parent VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO parent VALUES (104, 'Apple', 'Adam Eve');

select * from parent;

CREATE TABLE child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
);

INSERT INTO child VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO child VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO child VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO child VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO child VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO child VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO child VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from child;

--SORU 1: child tablosuna ted_verginosu 101 olan veri girişi yapınız
INSERT INTO child 
VALUES (101,2000,'Araba','Fahri');

INSERT INTO child 
VALUES (101,2000,'Pejo','Faruk');

--SORU 2: child tablosuna ted_verginosu 105 olan veri girişi yapınız.
INSERT INTO child 
VALUES (105,3000,'Araba','Fahri'); -- calismadi
--// parent tabloda olmayan primary key ile child veri girisi yapilamaz

--SORU 3: child tablosuna ted_vergino null olan veri girişi yapınız
INSERT INTO child 
VALUES (null , 4000,'Bisiklet','Nur');

--SORU 4: .parent tablosundaki vergi_no 101 olan veriyi siliniz.
DELETE FROM parent
WHERE vergi_no = 101; -- eror
--child tablodaki veri silinmeden parent tablodaki veri silinemez

--SORU 5: child tablosundaki ted_vergino 101 olan verileri siliniz
DELETE FROM child 
WHERE  ted_vergino = 101;

--SORU 6: .parent tablosundaki vergi_no 101 olan veriyi siliniz
DELETE FROM parent
WHERE vergi_no = 101; -- bu sefer siler

--SORU 7: .parent tablosunu siliniz.
-- child tablo silinmeden parent tablo silinemez

--SORU 8: child tablosunu siliniz
DROP TABLE child; -- tabloyu siler 

--SORU 9: .parent tablosunu siliniz
DROP TABLE parent; -- tabloyu siler 
-------------------------------------------

CREATE TABLE parent2
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson');

select * from parent2;

CREATE TABLE child2
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE
);

INSERT INTO child2 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child2 VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child2 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child2 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child2 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child2 VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child2 VALUES(104, 1007,'Kamera', 'Eymen Ozden');
select * from child2;

-- SORU 1: parent2 tablosundaki tüm verileri siliniz
DELETE FROM parent2;
-- Not:child2 tablodaki veriyi silmeden parent tablodaki veriyi ON DELETE CASCADE
-- ile sildik

-- SORU 2: parent2 tablosunu siliniz
-- ON DELETE CASCADE sayesinde child2 tablo silinmeden Parent tablo silinmex
DROP TABLE parent2 CASCADE;

-- SORU3: child2 tablosunu siliniz;
DROP TABLE child2;

----------------------------------------------

CREATE TABLE toptancilar     --> parent
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);

INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

select * from toptancilar;

CREATE TABLE malzemeler     --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES toptancilar(vergi_no)
on delete cascade
);

INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');

--SORU 1: vergi_no’su 202 olan toptancinin sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.
UPDATE toptancilar SET sirket_ismi = 'VivoBook'
WHERE vergi_no = 202;

-- SORU2: toptancilar tablosundaki tüm sirket isimlerini 'NOKIA' olarak güncelleyeniz.
UPDATE toptancilar SET sirket_ismi = 'NOKIA';

SELECT * FROM malzemeler;

--ON DELETE CASCADE komutu sayesinde Child tablo silinmeden Parent tablo silinebiliyor














