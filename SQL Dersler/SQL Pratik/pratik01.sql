create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);
--- INSERT:Veritabanına yeni veri ekler.

insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);

--SORU 1: ogrenciler tablosundaki id ve isim sütununu getiriniz

SELECT id, isim FROM ogrenciler;-- id ve isim`i getir
SELECT isim, sinav_notu FROM ogrenciler; -- isim ve sinav notunu getir
SELECT * FROM ogrenciler ORDER BY sinav_notu DESC; --Sinav notunu buyukten kucuge dogru siralar

--SORU 2: Sınav notu 80'den büyük olan butun öğrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler 
WHERE sinav_notu >80; -- sart oldugu icin WHERE kullandik

SELECT * FROM ogrenciler WHERE id>120; 

--SORU 3: Adresi Ankara olan ögrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE adres = 'Ankara';
SELECT * FROM ogrenciler WHERE adres = 'Istanbul';
SELECT * FROM ogrenciler WHERE adres = 'Isparta';

--SORU 4: Sınav notu 85 ve adresi Ankara olan öğrenci ismini listele
SELECT isim -- isim stunundan bir veri getirmemizi istiyor 
FROM ogrenciler -- nerden ogrenciler tablosundan 
WHERE sinav_notu = '85' and adres = 'Ankara';  -- kosulu sinav notu 85 olacak vr adresi Ankara olacak.

--SORU 4: Sınav notu 100 ve adresi Isparta olan tum öğrencileri listeleyiniz
SELECT * FROM ogrenciler
WHERE sinav_notu = '100' and adres = 'Isparta';


--SORU 5: .Sınav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
--1.YOL
SELECT * FROM ogrenciler
WHERE sinav_notu = 65 OR sinav_notu = 85;

--2.YOL
SELECT * -- sec 
FROM ogrenciler --ogrenciler tablosundan 
WHERE sinav_notu IN(65,85); -- sartimiz sinav notu`nun icinde 65-85 olanlar

--SORU 6: .Sınav notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler
WHERE sinav_notu 
BETWEEN 65 AND 85; --sinav notu 65 ve 85 arasinda 

--SORU 7: .id'si 122 ve 125 arasında olmayan ögrencilerin isim ve sınav notu listele
SELECT isim,sinav_notu 
FROM ogrenciler
WHERE id NOT BETWEEN 122 AND 125;

--SORU 8: sinav_notu 75 olan satırı siliniz

DELETE FROM ogrenciler
WHERE sinav_notu = 75;

--SORU 9: adres'i Trabzon olan satırı siliniz

DELETE FROM ogrenciler
WHERE adres = 'Trabzon';

--SORU 10: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz
DELETE FROM ogrenciler
WHERE isim = 'Derya Soylu' OR isim = 'Yavuz Bal';

--SORU 11: sınav notu 100 den küçük olan satırları siliniz
DELETE FROM ogrenciler
WHERE sinav_notu<100;

--SORU 12: Tablodaki tüm satırları siliniz
DELETE FROM ogrenciler;

/*
SORU 12: memurlar isminde bir tablo oluşturunuz. id, isim, maas sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun. NOT NULL kısıtlaması olsun.
*/

CREATE TABLE memurlar
(
id int PRIMARY KEY,-- Benzersiz ve not null iceremez
isim varchar(30)UNIQUE, --
maas int CHECK (maas>5000)NOT NULL
);

/*
SORU 13: insanlar isminde bir tablo oluşturunuz. isim, soyisim sutunları olsun.
isim sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun. Kısıtlamanın ismi pr_ks olsun
soyisim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun
*/
CREATE TABLE insanlar
(
isim int,
soyisim varchar(30), 
	
CONSTRAINT pr_ky PRIMARY KEY (isim),
CONSTRAINT ini_ks UNIQUE (soyisim)	
);





select * from ogrenciler





