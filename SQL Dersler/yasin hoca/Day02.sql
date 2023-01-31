--- VERI NASIL EKLENIR 

CREATE TABLE students2
(
student_id smallint PRIMARY KEY,
student_name varchar(50) UNIQUE,
student_yas smallint NOT NULL,
student_domTarih date,
student_ili varchar(50),	
CONSTRAINT student_yas_check CHECK(student_yas BETWEEN 0 AND 30), --0 VE 30 DAHIL
CONSTRAINT student_name_check CHECK(student_name =UPPER(student_name))	
);


INSERT INTO students2 VALUES (101,'ALI CAN',13,'10-Aug-2008','ANKARA');
INSERT INTO students2 VALUES (102,'VELI HAN',14,'14-Aug-2007','AMAZYA');
INSERT INTO students2 VALUES (103,'FAHRI ERSOZ',29,'14-Aug-2000','ADANA');
INSERT INTO students2 VALUES (104,'NUR ERSOZ',29,'14-Aug-2000','ISPARTA');
INSERT INTO students2 VALUES (105,'FARUK ERSOZ',11,'14-Aug-2000','ISTANBUL');
INSERT INTO students2 VALUES (108,'ZUBEYIR ERSOZ',16,'14-Aug-2001','USKUP');

-- Integer degerler single quote ile veya yalin kullanilabilir

INSERT INTO students2 VALUES (106,'SAID ERSOZ',22,NULL,'SKOPYE');
INSERT INTO students2 VALUES (110,'FATMA GUL',22,'12 sep-1996','USKUP');
INSERT INTO students2 VALUES (111,'FATMA',18,'12 sep-2004','AMARIKA');
INSERT INTO students2 VALUES (112,'SULEYMAN ERSOZ',30,'03 sep-1930','AMARIKA');
INSERT INTO students2 VALUES (113,'FATMA ERSOZ',29,'03 sep-1933','ADANA');

--SPESIK BIR SUTUNA VERI NASIL GIRILIR
INSERT INTO students (student_id,student_yas) VALUES (114,29);
INSERT INTO students (student_name,student_id,student_yas) VALUES ('HASAN ERSOZ',115,19); -- karisik giirlsede o girip duzeltiyor

--var olan bir data nasil degistirilir
UPDATE students2
SET student_name = 'AHMET ERSOZ' 
WHERE student_id = 102; -- Eger id 114 ise -- studen nami bana guncelle

--hasan ersoz , dog tarih 11- dec 1997 degistir
UPDATE students2
SET student_domTarih = '11-Dec-1997' 
WHERE student_id = 115

--Coklu recort(stir) nasil guncellenir.
--id`si 106`dan kucuk tum dob degerleriini 01- Aug`e guncelle
UPDATE students2 
SET student_domTarih ='01-Aug-2021' --BU Tarihe guncellendi
WHERE student_id<106;

--tum yas degerlerini en yuksek yas degeri at
UPDATE students2 SET student_yas = (SELECT MAX(student_yas) FROM students2);

--tum dogum tarihlerini en dusuk student_dogmtarih`e degistir 
UPDATE students2 SET student_domTarih = (SELECT MIN(student_domTarih)FROM students2);

-- Sutunlari calisan_id, calisan_isim, calisan_maas olan bir "Calisanlar" table olusturun.
-- isci_id suutununa isci_id_pk adiyla primary key atayin..
-- 4 recort(satir) girisi yapin
--table yi konsolda goruntuleyin

CREATE TABLE isciler
(
isci_id SMALLINT,
isci_isim varchar(50),
isci_maas SMALLINT,	
CONSTRAINT isci_id_pk PRIMARY KEY(isci_id)	-- 1. adim
);

INSERT INTO isciler VALUES (101,'Fahri ERSOZ',12000); --2.adim
INSERT INTO isciler VALUES (102,'Nur ERSOZ',10000);
INSERT INTO isciler VALUES (103,'Fatma ERSOZ',7000);
INSERT INTO isciler VALUES (104,'Faruk ERSOZ',8500);

--Nur ERSOZ`un maas degerini en yuksek maas degerinin %20 dusugune yukseltin.
UPDATE isciler SET isci_maas = (SELECT MAX (isci_maas)*0.8 FROM isciler)WHERE isci_id=102;

-- Fahri ersozun maas degerini en dusuk maas degerinin %30 fazlasini dusurun.
UPDATE isciler SET isci_maas = (SELECT MIN (isci_maas)FROM isciler)*1.3 WHERE isci_id=101;

--ortalama maas degerlerini 1000 artir
UPDATE isciler 
SET isci_maas= isci_maas+1000
WHERE isci_maas <(SELECT AVG(isci_maas)FROM isciler);  -- AVG=Ortalama

--Otalama maas degerinden dusuk maas degerlelerine ortalama maas degeri atayin.
UPDATE isciler 
SET isci_maas = (SELECT AVG(isci_maas)FROM isciler)
WHERE isci_maas < (SELECT AVG(isci_maas)FROM isciler);

-- IS NUUL Condition

CREATE TABLE pople --insanlar
(
ssn int,
name varchar(50),
address varchar(80),
ili varchar(25)
);

INSERT INTO pople VALUES (10, 'Mark', 'Honda','Adana');
INSERT INTO pople VALUES (9,'Toyota','Istanbul');
INSERT INTO pople VALUES (3);
INSERT INTO pople VALUES (2, 'Mark', 'Toyota','Maras');
INSERT INTO pople VALUES (11, 'Honda');
INSERT INTO pople VALUES (4, 'Hyundai');
INSERT INTO pople VALUES (12, 'Eddie', 'Toyota','Kayseri');

-- nal isim degerlerini "To be inseted later" degerine guncelleyin.
UPDATE pople
SET name = 'To be inserted later' -- null olan degerleri "To be inserted later" ile degistir
WHERE name IS NULL; -- Eger isim null ise

-- null adres degerlerini 'To be inserted later' degerine guncelleyin
UPDATE pople
SET address = 'To be inserted later' -- set ed ve 'To be inserted later' degistir
WHERE address IS NULL;  -- eger adres null ise 

--Bir Table dan RECORD nasil silinir.
DELETE FROM pople
WHERE ssn = '40';

-- isimsiz Record lari sil
DELETE FROM pople
WHERE name =  'To be inserted later';

-- isimsiz Record lari sil
DELETE FROM pople
WHERE address =  'To be inserted later';

-- Hepsinin icini siler
--DELETE FROM sadece satirlari siler tabloyu silmez
DELETE FROM pople;

-- name ve address degerleri nall olan degerleri silin
DELETE FROM pople
WHERE name IS NULL OR address IS NULL;-- name nall ise veya adres nall ise sil

--ssn degeri 8 den buyuk ve 4 ten kucuk olan record lari sil
DELETE FROM pople
WHERE ssn > '10' AND ssn < '9';

-- name`deki nall olmayan tum record lari silin
DELETE FROM pople
WHERE name IS NULL

-- address deki nall olmayan tum record lari silin
DELETE FROM pople
WHERE address IS NULL

-- Truncate Command tum RECORD lari siler
-- DELETE ile kismen ayni islemi yapar

--TRUNCATE ve DELETE arasindaki fark nedir?
--1) DELETE komutunda filtrelemek icin WHERE Clouse kullanilabilir fakat TRUNCATE komutunda kullanilmaz
--2) DELETE komutunda sildigimiz RECORD lari geri cagirabiliriz fakat TRUNCATE comurunda RECORD lari geri cagiramayiz
TRUNCATE TABLE pople;

-- birbiri ile iliskili olan Schane(Sema)`dan tablo nasil kaldirilir
DROP TABLE pople;

CREATE TABLE isciler
(
isci_id SMALLINT,
isci_isim varchar(50),
isci_maas SMALLINT	
);

INSERT INTO isciler VALUES (101,'Fahri ERSOZ',12000); --2.adim
INSERT INTO isciler VALUES (102,'Nur ERSOZ',10000);
INSERT INTO isciler VALUES (103,'Fatma ERSOZ',7000);
INSERT INTO isciler VALUES (104,'Faruk ERSOZ',8500);



-- Spesifik tek sutun cagirma
SELECT isci_isim FROM isciler;

--Spesifik coklu sutun cagirma
SELECT isci_isim,isci_maas FROM isciler;

--Spesifik bir RECORD nasil cagrilir
SELECT * FROM isciler WHERE isci_id=101;

--Coklu Spesifik bir RECORD nasil cagrilir
SELECT * 
FROM isciler
WHERE isci_id < 102;

-- Maas degeri 2000,7000 yada 12000 olan record lari yazdirin
--1.yol
SELECT *
FROM isciler 
WHERE isci_maas= 2000 OR isci_maas = 7000 OR isci_maas =12000;
--2.yol
SELECT *
FROM isciler 
WHERE isci_maas IN(2000,7000,12000); -- TEKRAR YERINE  "IN" KUULLAN

--Spesifik bir Hucreden (cell) nasil cagrilir
SELECT isci_isim
FROM isciler
WHERE isci_id = 101;

--En yuksek maasi olan record u cagirin
SELECT *
FROM isciler
WHERE isci_maas = (SELECT MAX(isci_maas) FROM isciler);

--En Dusuk Maasi olan NAME`i  record u cagirin
SELECT isci_isim
FROM isciler
WHERE isci_maas = (SELECT MIN(isci_maas) FROM isciler);




SELECT * FROM isciler;








