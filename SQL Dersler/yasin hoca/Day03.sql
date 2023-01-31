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

SELECT * FROM students2;

-----coklu recort(satir) nasil guncellenir-----

--soru 1: id`si 106 dan kucuk tum degerleri 01 ags-2021`e guncelle
UPDATE students2
SET student_domTarih = '01-Aug-2021'
WHERE student_id < 106;

--soru 2: Tum yas degerlerini en yuksek yas degerlerine guncelleyin
UPDATE students2
SET student_yas = (SELECT max (student_yas) FROM students2);

--soru 3: Tum student_domTarih degerlerini en dusuk student_domTarih`lerine guncelleyin
UPDATE students2
SET student_domTarih = (SELECT min (student_domTarih) FROM students2);

--soru 4: Sutunlari worker_id, worker_name, worker_salary olan bir "workers" tablo oluslusturunuz.
--       worker_id sutununu worker_id_pk adiyla PRIMARY KEY atayin.
--       4 recort girisi yapin ve tabloya yazdirin.

CREATE TABLE workers1
(
worker_id SMALLINT,
worker_name	varchar(50),
worker_salary SMALLINT,
CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)	
);

INSERT INTO workers1 VALUES (101, 'Ali Can', 12000);
INSERT INTO workers1 VALUES (102,'SAID ERSOZ',2000);
INSERT INTO workers1 VALUES (103,'FATMA GUL',7000);
INSERT INTO workers1 VALUES (104,'FATMA',8500);
INSERT INTO workers1 VALUES (105,'SULEYMAN ERSOZ',13000);
INSERT INTO workers1 VALUES (106,'FATMA ERSOZ',2950);


--SORU 1 : Saidin maas degerini en yuksek maas degerinin % 20 dusugune yukseltsin.
UPDATE workers1
SET worker_salary = (SELECT max (worker_salary) *0.8 FROM workers1)
WHERE worker_id = 102;

--SORU 2 : Ali cani`in maas degeri en dusuk maas egerinin  % 30 fazlasini dusurun
UPDATE workers1
SET worker_salary = (SELECT MIN (worker_salary) * 1.3 FROM workers1)
WHERE worker_id = 101;

--SORU 3 : Ortalama maas degerinden dusuk olan maas degerini 1000 $ atirin
UPDATE workers1
SET worker_salary = worker_salary + 1000
WHERE worker_salary < (SELECT AVG (worker_salary)FROM workers1)

--SORU 4 : Ortalama maas degerinden dusuk maas degerine ortalama maas degeri atayin
UPDATE workers1
SET worker_salary = (SELECT AVG (worker_salary)FROM workers1)
WHERE worker_salary < (SELECT AVG (worker_salary)FROM workers1);

SELECT * FROM workers1;

---- IS NULL Condition-----

CREATE TABLE pople
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)	
);

INSERT INTO pople VALUES (123456789, 'Mark Star', 'Sayibeyli');
INSERT INTO pople VALUES (123456789, 'Melik Sari', 'Tufanbeyli');
INSERT INTO pople VALUES (123356789, 'Bilal Guzel');
INSERT INTO pople VALUES (124456789, 'Can Canan', 'Kozan');
INSERT INTO pople VALUES (123466789, 'Ali Veli', 'Feke');
INSERT INTO pople (ssn, address) VALUES (123455789, 'Ceralan');
INSERT INTO pople (ssn, address) VALUES (123956789, 'Sansa');
INSERT INTO pople VALUES (123416789, 'Adem Cil', 'Ortakoy');
INSERT INTO pople VALUES (123453389, 'Fahri Ersoz', 'Pekezli');

--SORU 1 : Null name degerlerini "To be inserted later" degerini guncelleyin.
UPDATE pople
SET name = 'To be inserted later'
WHERE name IS NULL;

--SORU 2 : Null address degerlerini "To be inserted later" degerini guncelleyin.
UPDATE pople
SET address = 'To be inserted later'
WHERE address IS NULL;

--SORU 3 : Bir tablodan RECORD (satir) nasil silinir.
DELETE FROM pople
WHERE ssn = '124456789'

--SORU 4 : Isimsiz RECORT`lari (satir)sil.
DELETE FROM pople
WHERE name = 'To be inserted later';

--SORU 5 : RECORT`larin(satir)tamamini sil.
DELETE FROM pople;

---DELETE Command sadece RECORT`lari (satir) siler, Tabloyu yok etmez

--SORU 6 : name ve address degerleri null ilan degerleri silin
DELETE FROM pople
WHERE name IS NULL OR address IS NULL;

--SORU 7 : ssn degeri 123456789` dan buyuk 123466789`dan kucuk olan Recort(satir)lari siliniz

DELETE FROM pople
WHERE sss> "123456789" AND<"123466789";

--SORU 8 : Name degeri null olmayan tum recortlari silin
DELETE FROM pople
WHERE name IS NOT null;

-- TRUNCADE Command tum recortlari siler Delet ile kismen ayni islemi yapar
-- Aralarindaki fark 
TRUNCATE TABLE pople;

DROP TABLE pople;

-- DQL: Data Quaery Language. Data okumak icin kullanilan dil.(SELECT)

CREATE TABLE isci
(
id INT,
name VARCHAR(50),
maas INT
--CONSTRAINT id4_pk PRIMARY(id)	
);

INSERT INTO isci VALUES (1001, 'Mark Star', '12000');
INSERT INTO isci VALUES (1002, 'Melik Sari', '2000');
INSERT INTO isci VALUES (1003, 'Bilal Guzel', '7000');
INSERT INTO isci VALUES (1004, 'Can Canan', '8500');
INSERT INTO isci VALUES (1005, 'Ali Veli', '6800');


--SORU 9 : bir field(sutun) nasil cagrilir
SELECT name FROM isci

--SORU 10 : Coklu field(sutun) nasil cagrilir
SELECT name, maas FROM isci

--SORU 11 : field(sutun) nasil cagrilir
SELECT * FROM isci
where id = 1003

--SORU 12 :Coklu Recort(satirlar) nasil cagrilir
SELECT * FROM isci
WHERE id <1003

--SORU 13 : maas degeri 2000,7000 ve ve 12000 olanlari cagirin.
--1.yol
SELECT * FROM isci
WHERE maas = 12000 OR maas = 7000 OR maas = 2000;

--2.yol => TEKRARLARDA IN KULLANIN 
SELECT * FROM isci
WHERE maas IN(2000, 7000,12000)

--SORU 14 : Sprsifik bir hucre (cell) nasil cagrilir.
SELECT name
FROM isci
WHERE id = 1003;

--SORU 15 : En yuksek maas degeri olan recortu cagrin.
SELECT * FROM isci
WHERE maas = (SELECT MAX(maas)FROM isci);

--SORU 16 : En dusuk maas degeri olan recortu cagrin.
SELECT * FROM isci
WHERE maas = (SELECT MIN(maas)FROM isci);

--SORU 17 : En dusuk maas degeri olan name`i getir
SELECT name FROM isci
WHERE name = (SELECT MIN(name)FROM isci);


SELECT * FROM isci;





















