INSERT INTO student33 VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO student33 VALUES('10008', null, 5000, '2018-04-14'); 
INSERT INTO student33 VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO student33 VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO student33 VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); 
INSERT INTO student33 VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO student33 VALUES('10007', 'CAN', 5000, '2018-04-14'); 
INSERT INTO student33 VALUES('10009', 'cem', '', '2018-04-14'); 
INSERT INTO student33 VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO student33 VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO student33 VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO student33 VALUES( null, 'filiz ' ,12000, '2018-04-14');


CREATE TABLE student33
(
student_id smallint,
student_name varchar(50),
student_yas smallint,
student_domTarih date,
CONSTRAINT student_yas_check CHECK(student_yas BETWEEN 0 AND 30), --0 VE 30 DAHIL
CONSTRAINT student_name_check CHECK(student_name =UPPER(student_name))	
);

SELECT * FROM student33 

--- VERI NASIL EKLENIR 

CREATE TABLE students
(
student_id smallint PRIMARY KEY,
student_name varchar(50) UNIQUE,
student_yas smallint NOT NULL,
student_domTarih date,
student_ili varchar(50),	
CONSTRAINT student_yas_check CHECK(student_yas BETWEEN 0 AND 30), --0 VE 30 DAHIL
CONSTRAINT student_name_check CHECK(student_name =UPPER(student_name))	
);


INSERT INTO students VALUES (101,'ALI CAN',13,'10-Aug-2008','ANKARA');
INSERT INTO students VALUES (102,'VELI HAN',14,'14-Aug-2007','AMAZYA');
INSERT INTO students VALUES (103,'FAHRI ERSOZ',29,'14-Aug-2000','ADANA');
INSERT INTO students VALUES (104,'NUR ERSOZ',29,'14-Aug-2000','ISPARTA');
INSERT INTO students VALUES (105,'FARUK ERSOZ',11,'14-Aug-2000','ISTANBUL');
INSERT INTO students VALUES (108,'ZUBEYIR ERSOZ',16,'14-Aug-2001','USKUP');

-- Integer degerler single quote ile veya yalin kullanilabilir

INSERT INTO students VALUES (106,'SAID ERSOZ',22,NULL,'SKOPYE');
INSERT INTO students VALUES (110,'FATMA GUL',22,'12 sep-1996','USKUP');
INSERT INTO students VALUES (111,'FATMA',18,'12 sep-2004','AMARIKA');
INSERT INTO students VALUES (112,'SULEYMAN ERSOZ',30,'03 sep-1930','AMARIKA');
INSERT INTO students VALUES (113,'FATMA ERSOZ',29,'03 sep-1933','ADANA');

--SPESIK BIR SUTUNA VERI NASIL GIRILIR
INSERT INTO students (student_id,student_yas) VALUES (114,29);
INSERT INTO students (student_name,student_id,student_yas) VALUES ('HASAN ERSOZ',115,19); -- karisik giirlsede o girip duzeltiyor

--var olan bir data nasil degistirilir
UPDATE students
SET student_name = 'AHMET ERSOZ' 
WHERE student_id = 102; -- Eger id 114 ise -- studen nami bana guncelle

--hasan ersoz , dog tarih 11- dec 1997 degistir
UPDATE students
SET student_domTarih = '11-Dec-1997' 
WHERE student_id = 115



SELECT * FROM students




