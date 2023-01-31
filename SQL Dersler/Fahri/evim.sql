
Create Database fahri;  -- fahri diye databeyz olustu

CREATE TABLE evim
(ogreci_no char(7),isim varchar(20),soyisim varchar(25),not_ort real,kayit_tarihi date);

-- Vaar olan tablodan yeni bir tablo olusturma ISMI DEGISTIRIYORUZ !!
--CREATE TABLE evimdekiler
--AS  -- bana getirecegin yerdeki gibi
--SELECT isim,soyisim,not_ort --secerek, ne getirsin bana aynisini yazmak zorundasiniz
--FROM evim; --- nerden getireyim evim`den

CREATE TABLE evimdekiler 
AS 
SELECT isim,soyisim,not_ort FROM evim;

INSERT INTO evim VALUES ('1234567','Fahri','ERSOZ',89.5,now());
INSERT INTO evim VALUES ('1224567','Nur','ERSOZ',90.5,now());
INSERT INTO evim VALUES ('1223567','Said','ERSOZ',80.5,now());
INSERT INTO evim VALUES ('1223527','Fatma','ERSOZ',80.5,now());
INSERT INTO evim VALUES ('1723567','Zubeyir','ERSOZ',80.5,now());
INSERT INTO evim VALUES ('1923567','Faruk','ERSOZ',80.5,now());

--BirTabloya Parca veri ekleme
INSERT INTO evim (isim,soyisim,not_ort,kayit_tarihi) VALUES ('Suleyman','ERSOZ',100,now())

SELECT * FROM evim   -- evim tablosundan herseyi sec
-- Select =sec neyi seceyim * herseyi from den dan evimden









