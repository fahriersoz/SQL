-- DATABASE(Veri Tabani) Olusturma

--Create dataBase fahri01;

Create dataBase fahri32;

 -- DDL DATA DEFINITION LANG
 -- CREATE - TABLO OLUSTURMA
 
 CREATE TABLE Ogrenciler2 -- tabloyu olustur
 (
	 Orenci_No char(7),
 	 Isim varchar(20),
	 Soyisim varchar(25),
	 Not_Ort real,  -- ondalik sayilar icin
	 Kayit_Tarihi Date
 );
 
 -- VAR OLAN TABLODAN YENI BIR YABLO OLUSTURMA
 
 CREATE TABLE Ogrenci_Notlari
 AS    -- 
 SELECT Isim,Soyisim,Not_Ort FROM Ogrenciler2;
 
 -- DML - DATA MANUPULATION LANG.
 -- INSERT (Databas`e veri ekleme)
 
INSERT INTO Ogrenciler2 VALUES('1234567','Fahri','ERSOZ',85.5,now());
INSERT INTO Ogrenciler2 VALUES('1234567','Fahri','ERSOZ',85.5,'2017-10-16');


-- BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK

INSERT INTO Ogrenciler2 (Isim,Soyisim) VALUES ('Faruk','ERSOZ');

 -- DML - DATA MANUPULATION LANG.
 -- SELECT
 
 select * FROM Ogrenciler2;
 
 
 
 
 
 
 
 
 
 
 