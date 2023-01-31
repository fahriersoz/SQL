create table arac
(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
);

insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );
select * from arac;

--SORU 1: arac tablosundaki en yüksek fiyat'ı listele
SELECT max(fiyat) FROM arac;

--SORU 2: arac tablosundaki fiyatların toplamını listele
SELECT sum(fiyat) FROM arac;

--SORU 3: arac tablosundaki fiyat ortalamalarını listele
SELECT avg(fiyat) FROM arac;

SELECT round (avg(fiyat)) FROM arac; --> kusurat cikmiyor

SELECT round (avg(fiyat),2) FROM arac; --> kusurat ne kadar olmasini istiyorsak o kadar yazdirabiliriz

--SORU 4: arac tablosunda kaç tane araç oldugunu listele
SELECT count (id) FROM arac;

SELECT count (marka) FROM arac;

-------------------------------
CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);	
	
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');
select * from meslekler;

--SORU 1: meslekler tablosunu isim'e göre sıralayarak sorgulayınız.
SELECT * FROM meslekler ORDER BY isim;

--SORU 2: meslekler tablosunda maas'i buyukten kucuge siralayiniz
SELECT * FROM meslekler ORDER BY maas DESC;

--SORU3: meslekler tablosunda isim'i 'Ali' olanları,
--        maas'a göre büyükten küçüge sıralayarak sorgulayınız
SELECT * FROM meslekler 
WHERE isim = 'Ali'  ---> sart
ORDER BY maas DESC; ---> siraliyoruz -->byktn kucuge dogru 

--SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
--       maas sıralı olarak sorgulayınız.
SELECT * FROM meslekler 
WHERE soyisim = 'Bulut'
ORDER BY maas ;

--SORU 5: meslekler tablosunda id degeri 5 den büyük olan,  ilk 2 veriyi listeleyiniz
SELECT * FROM meslekler 
WHERE id > 5
LIMIT 2 ;      

--SORU 6: meslekler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz
SELECT * FROM meslekler 
ORDER BY maas DESC
LIMIT 3 ;

-- SORU 7: meslekler tablosunda ilk 2 veriden sonra 5 veriyi getirin
SELECT * FROM meslekler
OFFSET 2 LIMIT 5;

-- OFFSET atlama yaptigimizda kullanilir.
SELECT * FROM meslekler
OFFSET 5 LIMIT 7;

-- SORU 8: meslekler tablosunda en yüksek maaşı alan 4. 5. 6. kişilerin bilgilerini listele
SELECT * FROM meslekler
ORDER BY maas DESC
OFFSET 3 LIMIT 3;
-----------------------------------------------------

create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);
insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');

create table aktorler
(id int,
actor_name varchar(30),
film_id int
);

insert into aktorler values (1, 'Ata Demirer', 1);
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);

SELECT * FROM aktorler

-- SORU 1: Tüm film_name'leri, category'lerini ve filimlerde oynayan actor_name'leri listeleyiniz.
SELECT film_name, category, actor_name FROM filmler as A
LEFT JOIN aktorler as B
ON A.film_id = B.film_id;

SELECT film_name, category, actor_name FROM aktorler as B
RIGHT JOIN filmler as A
ON A.film_id = B.film_id;

-- SORU 2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.
SELECT actor_name, film_name FROM aktorler as A
LEFT JOIN filmler as B
ON A.film_id = B.film_id;


SELECT actor_name, film_name FROM filmler as E
RIGHT JOIN aktorler as F
ON F.film_id = E.film_id;

-------------------------------------------------------

create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);

create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

SELECT * FROM developer_dersler

--SORU 4: join kullanarak qa_dersleri ve developer_dersleri benzersiz sorgula

select A.ders_id, A.ders_ismi,A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_ismi=B.ders_ismi

union
select B.ders_id, B.ders_ismi,B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_ismi=B.ders_ismi;


























