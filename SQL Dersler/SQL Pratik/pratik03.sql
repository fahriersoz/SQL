/*
* *  CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA  * *
	
1 - Child tablo silinmeden Parent tablo silinmeye calisilirsa PgAdmin Error verir.
    yani Child tablo silinmeden Parent tablo silinemez.
2 - Child tablodaki veri silinmeden Parent tabloda ki veri silinmeye calisilirsa
    PgAdmin Error verir. Child tablodaki silindikten sonra Parent tablodaki veri silinebilir.

	* *  CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA  * *
	
1 - Child tablo silinmeden Parent tablo silinebilir. PgAdmin buna Error vermez.
2 - Child tablodaki veri silinmeden Parent tablodaki veri silinebilir.PgAdmin buna Error vermez.
    Parent tablodaki veriyi siler fakat bu durumda "Child tablodaki veri de silinir".
3 - ON DELETE CASCADE komutu sayesinde Child tablo silinmeden Parent tablo silinebiliyor
*/

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

-- SORU3: vergi_no’su 201 olan toptancinin
-- sirket_ismi'ni 'nokia' ve irtibat_ismi’ni 'Canan Can' olarak güncelleyiniz.
UPDATE toptancilar SET sirket_ismi = 'noia', irtibat_ismi = 'Canan Can'
WHERE vergi_no = 201;

-- SORU 4: sirket_ismi nokia olan toptancinin irtibat_ismi'ni 'Bilal Han' olarak güncelleyiniz.
UPDATE toptancilar SET irtibat_ismi = 'Bilal Han'
WHERE sirket_ismi = 'nikia'

-- SORU 5: malzemeler tablosundaki 'Telefon' değerlerini 'Phone' olarak güncelleyiniz.
UPDATE malzemeler SET malzeme_isim = 'Phone'
WHERE malzeme_isim = 'Telefon';

-- SORU 6: malzemeler tablosundaki malzeme_id değeri 1004'ten büyük olanların
 --       malzeme_id'lerini 1 artırarak güncelleyiniz.
UPDATE malzemeler SET malzeme_id =malzeme_id + 1
WHERE malzeme_id > 1004;

--SORU7: malzemeler tablosundaki tüm malzemelerin malzeme_id değerini ted_vergino ile toplayarak güncelleyiniz.
UPDATE malzemeler SET malzeme_id = malzeme_id + ted_vergino;

-- SORU8: Malzemeler tablosundaki musteri_isim'i Ali Can olan malzeme_isim'ini,
--  toptancılar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.

UPDATE malzemeler  --> malzeleler tablosunda bir guncelleme yapiyoruz
SET malzeme_isim = (SELECT sirket_ismi FROM toptancilar WHERE irtibat_ismi = 'Adem Cos')
WHERE musteri_isim = 'Ali Can'; 
--(IC SORGU)
--> SET ile guncelleme yapacagim kismi soyluyorum. Neyi guncelleyecegim "malzeme_isim" guncelleyecegim
--> "TV"  guncelleyecegim
--NOT: Malzemeler tablosundaki "musteri_isim Ali Can olan" <-- burasi WHERE sartimiz. 
--(DIS SORGU) Parentez ic
--------------------------------------------------
-- SORU9: malzeme_ismi Laptop olan musteri_isim'ini,
--  (sirket_ismi Apple’in irtibat_isim'i )ile güncelleyiniz.-->parentez ici sorgu

UPDATE malzemeler 
SET malzeme_isim = (SELECT irtibat_ismi FROM toptancilar WHERE sirket_ismi = 'Apple' )
WHERE malzeme_isim = 'Laptop';
-- IC SORGU
-- (SELECT irtibat_ismi FROM toptancilar WHERE sirket_ismi = 'Apple' )
--(SELECT Getir irtibat ismini from: neden toptancilar tablosundan, kosulumuz 
--   WHERE sirket_ismi apple olan)
















