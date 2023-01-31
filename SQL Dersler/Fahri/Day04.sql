-----drop table if exists..... dosyayi siler

CREATE TABLE ogrenciler99
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no,isim),  --COMPOSİTE PK  
unique (soyisim,not_ort)
);
-------------------------------------------
CREATE TABLE calisanlar22 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

CREATE TABLE markalar22
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO calisanlar22 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar22 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar22 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar22 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar22 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar22 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar22 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

INSERT INTO markalar22 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar22 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar22 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar22 VALUES(103, 'LCWaikiki', 21000);

--SORU 1 : Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
SELECT marka_id, calisan_sayisi 
FROM markalar22 
WHERE marka_isim IN (SELECT isyeri FROM calisanlar22 WHERE sehir = 'Ankara');

---------------ALIASES---------------
--Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir.
CREATE TABLE calisan
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) 
);

INSERT INTO calisan VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisan VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisan VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT calisan_id AS id FROM calisan; -- Calisanlarin sadece  id`isini
SELECT calisan_isim AS id FROM calisan; -- Calisanlarin sadece  calisan_isim`isini
SELECT calisan_dogdugu_sehir AS id FROM calisan;  -- Calisanlarin sadece  calisan_dogdugu_sehir`isini
-- iki satiri birlestidim
-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
--1. yol
SELECT calisan_id AS id, calisan_isim || calisan_dogdugu_sehir AS Calisan_Bilgisi FROM calisan;
--2. yol
SELECT calisan_id AS id, concat (calisan_isim || calisan_dogdugu_sehir) AS Calisan_Bilgisi FROM calisan;
--3. yol arasina bosluk koyalim
SELECT calisan_id AS id, calisan_isim ||' : '|| calisan_dogdugu_sehir AS Calisan_Bilgisi FROM calisan;
SELECT calisan_id AS id, calisan_isim ||'  '|| calisan_dogdugu_sehir AS Calisan_Bilgisi FROM calisan;
SELECT calisan_id AS id, (calisan_isim, ' ', calisan_dogdugu_sehir) AS Calisan_Bilgisi FROM calisan;
--------------------------------------
CREATE TABLE personel
(
ID char(9),
isim varchar(50),
soyisim varchar(50),
email varchar(50),
is_bas_tar date,
is_unvani varchar(30),
maas INT
);

INSERT INTO personel VALUES(123456789,'Ali','Can','alican@gmail.com', '10-APR-10','isci',5000);
INSERT INTO personel VALUES(123456788,'Veli','Cem','velican@gmail.com','10-JAN-10','isci',5500);
INSERT INTO personel VALUES(123456787,'Ayse','Gul','aysegul@gmail.com','01-MAY-14','muhasebe',4500);
INSERT INTO personel VALUES(123456786,'Fahri','Ersoz','faheiersz@gmail.com','10-APR-11','muhendis',7500);
-- a) Yukarda verilen “personel” tablosunu olusturun
-- b) Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
SELECT isim,is_unvani,maas FROM personel
WHERE maas>=5000;
-- c) Iscilerin tum bilgilerini listeleyin
SELECT * FROM personel;
-- d) Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
SELECT is_unvani,maas FROM personel
WHERE IN personel = soyisim = 'Can',AND soyisim='Cem', AND soyisim ='Gul';
--------------------------
-----------------------
-
-----------IS NULL CONDITION--------------------------
-- Arama yapilan field’da NULL degeri almis kayitlari getirir.
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT isim FROM insanlar;  -- insanlar Tablosundan isimleri getir
SELECT ssn FROM insanlar;  -- insanlar Tablosundan ssn`i getir
SELECT adres FROM insanlar;  -- insanlar Tablosundan adres`i getir

SELECT isim FROM insanlar 
WHERE isim IS NULL;  -- isim sutunundan sartimizi is null dersek sadece null getiri

SELECT isim FROM insanlar 
WHERE isim IS NOT NULL; -- null ilmayan isimleri getiri.

--SORU 04: Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar
SET isim = 'No Isim'  -- ismi null olanlari no isim yaptim
WHERE isim is null;









SELECT * FROM insanlar;












