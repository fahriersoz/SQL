-----drop table if exists..... dosyayi siler

CREATE TABLE ogrenciler93
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no,isim),  --COMPOSİTE PK  
unique (soyisim,not_ort)
);

--SORU 1: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz

SELECT marka_id,calisan_sayisi FROM markalar
WHERE marka_isim IN (SELECT isyeri FROM calisanlar2 WHERE sehir = 'Ankara');

---------------ALIASES---------------
--Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir.

CREATE TABLE calisanlar 
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) 
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
--1.YOL
SELECT calisan_id AS id, calisan_isim||'*'||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar
---------------------------------
--Arama yapilan field’da NULL degeri almis kayitlari getirir.
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

--SORU 02 : Name stununda null olan degerleri listeleyin
SELECT isim FROM insanlar 
WHERE isim IS NULL;

-- SORU 03: insanlar tablosunda sadece null olmayan degerleri listeleyiniz
SELECT isim FROM insanlar 
WHERE isim IS NOT NULL;

--SORU 04: Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar
SET isim ='no isim' WHERE ssn='456789012';

------------ORDER BY CLAUSE--------------
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar (ASC)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/

CREATE TABLE insan
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), 
adres varchar(50)
);

INSERT INTO insan VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insan VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insan VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insan VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insan VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insan VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--SORU 05 :Insanlar tablosundaki datalari adres’e gore siralayin
SELECT * FROM insan
ORDER BY adres;

--SORU 06 :Insanlar tablosundaki datalari soyisme gore siralayin
SELECT * FROM insan
ORDER BY soyisim;

--SORU 07 : Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insan
WHERE isim = 'Mine' ORDER BY ssn;

--SORU 07_1 : Insanlar tablosundaki adresi 'Ankara' olanlari SSN sirali olarak listeleyin
SELECT * FROM insan
WHERE adres = 'Ankara' ORDER BY adres;

--SORU 07_2 : Insanlar tablosundaki adresi 'Istanbul' olanlari SSN sirali olarak listeleyin
SELECT * FROM insan
WHERE adres = 'Istanbul' ORDER BY adres;

/*
 Order By komutundan sonra field (SUTUN)ismi yerine field (stun) numarasi da kullanilabilir
 
--SORU 08 : Insanlar tablosundaki ""soyismi Bulut"" olanlari isim sirali olarak listeleyin
*/
-- adrese(4) gore sirala
SELECT * FROM insan
WHERE soyisim = 'Bulut' ORDER BY 4;

SELECT * FROM insan ORDER BY ssn;  -- ssn gore siralar kucukten buyuge dogru 
SELECT * FROM insan ORDER BY isim;  -- isim`e gore siralar
SELECT * FROM insan ORDER BY soyisim;  -- soyisim`e gore siralar
SELECT * FROM insan ORDER BY adres;  -- adres`e gore siralar

-----------ORDER BY field_name DESC CLAUSE-------------
--SORU 09:Insanlar tablosundaki tum kayitlari z den a`ya  buyukten kucuge olarak siralayin
SELECT * FROM insan ORDER BY ssn DESC;  -- buyukten kucuge siralar
SELECT * FROM insan ORDER BY adres DESC; --Z`den A`ya siralar
SELECT * FROM insan ORDER BY soyisim DESC; --Z`den A`ya siralar
SELECT * FROM insan ORDER BY isim DESC; --Z`den A`ya siralar

--SORU 10:Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insan ORDER BY isim ASC, soyisim DESC;
SELECT * FROM insan ORDER BY ssn ASC, soyisim DESC; 

--SORU 11: İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim,soyisim
FROM insan
ORDER BY LENGTH (soyisim);

SELECT isim,soyisim FROM insan ORDER BY LENGTH (isim) DESC; -- isme gore buyukten kucuge  dogru siralar
SELECT isim,soyisim FROM insan ORDER BY LENGTH (isim); -- isme gore kucukten buyuge dogru siralar
/*
Eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız 
Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz
*/
SELECT isim,soyisim
FROM insan
ORDER BY LENGTH (soyisim) DESC; -- soyisim gore buyukten kucuge  dogru siralar

--SORU 12:Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
--1.yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insan ORDER BY LENGTH (isim || soyisim);

-- 2. yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insan ORDER BY LENGTH (isim) + LENGTH (soyisim);

-- 3. yol
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insan ORDER BY LENGTH (isim)+LENGTH (soyisim);

-- 4. yol
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insan ORDER BY LENGTH (concat(isim,soyisim));
SELECT isim||' '|| soyisim AS SOY_ISIM FROM insan ORDER BY LENGTH (ISIM || SOYISIM);

-----------------GROUP BY CLAUSE------------------
--Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT 
--komutuyla birlikte kullanılır

CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Fahri', 'Muz', 5);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Faruk','Mandalina',5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav

--SORU 13: Isme gore alinan toplam urunleri bulun.
--1. yol
SELECT isim, sum (Urun_miktar) FROM manav GROUP BY isim;
--2. yol
SELECT isim, sum (Urun_miktar)AS ald_tplm_urun FROM manav GROUP BY isim;

--SORU 14: Isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge lisyeleyiniz
SELECT isim, sum (Urun_miktar) AS ald_tplm_urun FROM manav GROUP BY isim ORDER BY ald_tplm_urun DESC;

SELECT * FROM manav ORDER BY Urun_miktar; -- kuc. buyg. dogr siralar

SELECT * FROM manav ORDER BY Urun_miktar DESC; --bykten kcg. dogr. siralar.

--SORU 15: Urun ismine gore, urunu alan toplam kisi sayisi bulunuz
SELECT Urun_adi, 
COUNT (isim) -- saydir 
FROM manav -- manavdan
GROUP BY Urun_adi; -- bir stun daha ekliyoruz

--SORU 15: Isim ismine gore urunu alan toplam kisi sayisi bulunuz
--// testen cozmeye baslayalim 
SELECT isim, --1. kisi sayis 'isim' stununda ekle
COUNT (Urun_adi) -- 3. urun adini saydir
FROM manav-- 2. nerden manv
GROUP BY isim; --4. urun ismine gore


select * from manav;





