CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);
-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim
DELETE FROM ogrenciler WHERE isim = 'Mustafa Bak' or isim = 'Nesibe Yilmaz';

TRUNCATE TABLE ogrenciler

DROP TABLE if exists talebeler -- bununla onceden var olan tablo silinir
------------------------------
CREATE TABLE talebe
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);


CREATE TABLE notlar01( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebe(id)
on delete cascade
);

INSERT INTO notlar01 VALUES ('123','kimya',75);
INSERT INTO notlar01 VALUES ('124', 'fizik',65);
INSERT INTO notlar01 VALUES ('125', 'tarih',90);
INSERT INTO notlar01 VALUES ('126', 'Matematik',90);

DELETE FROM notlar01 
WHERE talebe_id = '123'; -- Talebe id sinden 123 u sil

DELETE FROM talebe
WHERE id ='126';

SELECT * FROM talebe
SELECT * FROM notlar01

 ------------IN CONDITION---------------------

CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

--Musteriler tablosundan urun ismi orenge,aple veya apricort olan Tum datallari listeleyiniz
--1.yol OR BIR SART SAGLANSA YETER
SELECT * FROM musteriler -- TUM VERILER GELDI
WHERE urun_isim ='Orange' OR urun_isim='Apple' OR urun_isim = 'Apricot';
--2.YOL sartlarin hepsinin saglanmasi gerek
SELECT * FROM musteriler 
WHERE urun_isim ='Orange' AND urun_id=10;

--------IN CONDITION-----------> ile yapmak istesek
SELECT * FROM musteriler 
WHERE urun_isim IN ('Orange','Apple','Apricot'); -- Ayni listeyi aldik

---------NOT IN-Condition----------> VERILERIN DISINDAKINI GETIRIR
SELECT * FROM musteriler 
WHERE urun_isim NOT IN ('Orange','Apple','Apricot');

---------BETWEEN--Condition---------> iki mantiksal ifade ile tanimlayabileceginiz durumlari
--tek komutla yazma  imkani verir.Yazilan iki sinirda dahildir.

--1) Urun_id 20 ile 40 arasinda olan urunlerin tum bilgilerini listeleyini

SELECT * FROM musteriler --- musteriler tablosundan butun verileri listele 
WHERE urun_id>=20 AND urun_id<=40; -- yanliz 20 ile 40 arazi

SELECT * FROM musteriler 
WHERE urun_id BETWEEN 20 AND 40; -- Ayni sonucu verdi

----------NOT BETWEEN Condition-----------> iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek
--komutla yazabilme imkani verir. Yazdigimiz 2 sinirda araliga harictir (EXCLUSIVE)
SELECT * FROM musteriler 
WHERE urun_id NOT BETWEEN 20 AND 40;

CREATE table personel
(
prs_id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

---------SUBQUERIES------------
--SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur.WHERE’ den sonra kullanilabilir

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nika', 19000);

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini
-- ve-- bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

SELECT isim,maas,isyeri FROM calisanlar2  --burasi ana sorgu 
WHERE isyeri IN(SELECT marka_isim FROM markalar WHERE calisan_sayisi > 15000);

---- marka_id’si 101’den büyük olan marka çalişanlarinin <--isim, maaş ve şehirlerini listeleyiniz.
SELECT isim,maas,sehir FROM calisanlar2 --calisanlar2 tablosundan isim,maas,sehir bana getir
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
SELECT id,sehir,

---------------SUBQUERIES--------
-------AGGREGATE METOT KULLANIMI------
/*
- Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
*/
---------------MAX----MIN----------
--*MAX maasi bulunuz
SELECT MAX(maas) FROM calisanlar2 -- Max maas`i bulduk fakat tabloda maas yazizini degistirelim
SELECT MAX(maas) AS maxsimum_maas FROM calisanlar2; --7000

--Eğer bir sütuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek
--    istediğimiz ismi yazarız
--*MIN maasi bulunuz
SELECT MIN(maas) FROM calisanlar2 -- 1000
SELECT MIN(maas) AS minumum_maas FROM calisanlar2; -- 1000
----------- SUM ---------------
-- Calisanlar tablosundaki maaslarin toplamini bulunuz
SELECT SUM (maas) FROM calisanlar2; --19000
-------------AVG ------------
-- Calisanlar tablosundaki maaslarin ortalamasini bulunuz
SELECT AVG (maas) FROM calisanlar2;----2714.285714285714
-------Virgulden sonra gormeyetim------------
SELECT round (AVG (maas)) FROM calisanlar2; --2714
------Virgulden sonra 2 basamak olsun---------
SELECT round (AVG (maas),2) FROM calisanlar2; --2714.29
----------- COUNT ---------------
-- Calisanlar tablosundaki maaslarin sayisini listeleyiniz
SELECT COUNT (maas) FROM calisanlar2;--7 -- Count dedigim zaman satirlari sayiyor
SELECT COUNT (*) FROM calisanlar2; -- 7

/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/

-----------SUBQUERIES--------
--Her markanin id’sini, ismini ve toplam kaç şehirde 
--bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id,marka_isim, 
(SELECT COUNT(sehir) AS sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri)
FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim,calisan_sayisi,
(SELECT SUM (maas) FROM calisanlar2 WHERE isyeri = marka_isim)
FROM markalar

-- eger sum yerine tabloda "toplam_maas " yazilsin dersek gecici isim verir.
--Gecici bir isim vermek istiyorsak AS .... Ne yazacaksak onu yazaariz
-- 1. yol
CREATE VIEW toplammas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT SUM (maas) FROM calisanlar2 WHERE isyeri = marka_isim) as toplam_maas --<===
FROM markalar
-- 2. YOL
SELECT * FROM toplammas; -- BURAYA KAYDETTI KISAYOL

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini 
--listeleyen bir Sorgu yaziniz.
-- 1.YOL
SELECT marka_isim,calisan_sayisi,
(SELECT MAX (maas) FROM calisanlar2 WHERE isyeri = marka_isim) AS maxmaas,
(SELECT MIN (maas) FROM calisanlar2 WHERE isyeri = marka_isim) AS minmaas
FROM markalar;

---------- VIEW Kullanimi-------<========///
--Hafizaya aliyor ve istedigimiz zaman kullaniyoruz
-- 2. YOL
CREATE VIEW maxmimummaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT MAX (maas) FROM calisanlar2 WHERE isyeri = marka_isim) AS maxmaas,
(SELECT MIN (maas) FROM calisanlar2 WHERE isyeri = marka_isim) AS minmaas
FROM markalar;

SELECT * FROM maxmimummaas; --MaxMin maasi bu komutla icine koyduk... 
SELECT * FROM toplammas;
/*
Yaptığımız sorguları hafızaya alır ve tekrar bizden isten sorgulama yenine
view'e atadığımız ismi SELECT komutuyla çağırırız
*/

-------------------EXISTS CONDITION---------------------
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.
*/
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

/*
SORU:-MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
*/
SELECT urun_id,musteri_isim FROM mart -- ana sorgumuz --> mart ayinda  urun_id,musteri_isim bunlar
WHERE EXISTS (SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id); 
-- EXISTS olanlari varssa getir.
/*
SORU:-Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
SELECT urun_isim,musteri_isim FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim);
--=>mart.urun_isim=nisan.urun_isim => mart tablosundaki urun ismiyle, nisan tablosundaki urun isimleri
--esit olan varsa "EXISTS" bana getir.
/*
soru:--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri  ======> SORU COZ
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
---
---+
------------UPDATE SET----------
------ DML --> ic mimar, tablonun icindeki verileri gunceller
-----Tablodaki Data Nasil Update Edilir (UPDATE SET)?----
CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

-- SORU: vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz
/*
=> Gucelleme sorusunda yapilacak ilk is UPDATE ....(tedarikciler) ==> Sonrada neyi SET etmek istiyorsak 
javadada varde get getiri set set ederdi..set et firma_ismi neyle 'Vestel' ile degistir WHERE ver vergi_no
=102;
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE stun_ismi = 'istenen ver'
*/
UPDATE tedarikciler
SET firma_ismi = 'Vestel' WHERE vergi_no=102; ---Huawei-> 'Vestel' olarak degistirdi

-- SORU:vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz
UPDATE tedarikciler
SET firma_ismi = 'Casper',irtibat_ismi = 'Ali Veli'
WHERE vergi_no = 101;

--SORU: urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler -- urunler tablosu
SET urun_isim = 'Telefon'  -- URUN ISMINI set edecegim
WHERE urun_isim = 'Phone'; --sartimiz 'Phone' telefon olsun

--SORU: urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler -- urunler tablosundan 
SET urun_id = urun_id + 1  -- urun_id set et ve 1 artir
WHERE urun_id > 1004;  -- sartim 1004 den buyuk ilanlari

--SORU: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz
UPDATE urunler
SET urun_id =urun_id + ted_vergino;

--SORU:urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi 
--     Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
--      Bu update işlemini yapmadan önce, tabloları eski haline getirmeliyiz.
UPDATE urunler -- 1. urunler tablosundan 
SET urun_isim = (select firma_ismi from tedarikciler WHERE irtibat_ismi = 'Adam Eve')
--2. urun ismini set edecegim , --4. irt ismi adem eva olan firma ismiyle degistir dedi urun ismini() acip icine yazdim
WHERE musteri_isim='Ali Bak'; --3. sartimi yazdim

--SORU: Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler -- 1. urunler tablosundan 
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi = 'Apple')
-- musteri isim ni ne ile degistiecek irtibat ismi ile degistirin diyor. ()parantez ile sapkuari tedarikciler den
-- (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi = 'Apple')
-- irtibat ismini sec. nerden tedarikciler den, yanilz ver firma ismi 'Apple' olan
WHERE urun_isim = 'Laptop' --sartim laptop satin alan musteriler





SELECT * FROM tedarikciler
SELECT * FROM urunler

DELETE FROM urunler -- Tablolarin ismi ile yeniden islem yapmak icin
