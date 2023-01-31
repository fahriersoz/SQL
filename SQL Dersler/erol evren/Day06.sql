
------------JOINS-------------

/*
2 Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir 
Tablolar icin ise JOIN kullanilir
5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur
*/

----------INNER JOINS------------

CREATE TABLE sirketler 
(
sirket_id int, 
sirket_isim varchar(20)
);

CREATE TABLE siparisler 
(
siparis_id int, 
sirket_id int, 
siparis_tarihi date
);

INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');

INSERT INTO siparisler VALUES(11, 101,'17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102,'18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103,'19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104,'20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105,'21-Apr-2020');

------------------INNER JOINS--------------------
/*
NOT :
1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
*/

--SORU: 1) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--         siparis_tarihleri ile yeni bir tablo olusturun

--NOT 1 : SART (ON):Iki Tabloda sirket_id’si ayni olanlarin --en sona
--NOT 2 : (Sirketler ismini) istiyor. Nerde var sirket ismi 1 tablodada var
--        Sonra (siparis id) istiyor. Nerde var siparisler tablosundan, siparis_id`isini aliyorum
--        ve (siparis_tarihleri) istiyor onuda 1 de olmdg icin siparisler tabl. aliyorum.
--        SELECT ile istenenleri olusturduk.
--NOT 3 : iki tabloyu birlestirmek icin: FROM "sirketler" INNER JOIN "siparisler" iki sirktin
--      ortsina (yeni bir tablo) Tablodaki datalari Birlestirmek icin "INNER JOIN" yaziyoruz
--NOT 4 : Sartimizi (Iki Tabloda sirket_id’si ayni olanlarin) en sona yazip kodumz bitiriyoruz

SELECT sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler. sirket_id = siparisler.sirket_id;

------------LEFT JOINS---------------
/*
NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
*/

--SORU: 1) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--         siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler. sirket_id = siparisler.sirket_id;

---------------RIGHT JOINS---------------
/*
NOT :
1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
ancak ortak olmayan datalar icin o kisimlar bos kalir
*/

--SORU: 1) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--         siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler RIGHT JOIN siparisler
ON sirketler. sirket_id = siparisler.sirket_id;

--SORU
SELECT sirket_id FROM sirketler
INTERSECT
SELECT sirket_id FROM siparisler

-----------FULL JOINS---------------
/*
NOT :
1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/

--SORU: 1) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--         siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler FULL JOIN siparisler
ON sirketler. sirket_id = siparisler.sirket_id;

------------SELF JOINS----------------
CREATE TABLE personel22
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);

INSERT INTO personel22 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel22 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel22 VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel22 VALUES(4, 'Fatma Can', 'CEO', 5);

--SORU 1: Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

--NOT: Benden istenen bir tabloda ismin karsisinda yoneyicilerinide gorebilmek. Onuda hayali bir
--     tablo ismi atayip onun uzerinden gidecegim.-->1.sutun=> p1.isim, 2.sutun=> p2.isim
SELECT p1.isim , p2.isim
FROM personel1 p1 inner join personel1 p2
ON p1.yonetici_id=p2.id
--gecici isim atayalim
SELECT p1.isim AS personel_isim,p2.isim AS yonetici_isim
FROM personel22 p1 INNER JOIN personel22 p2 ON p1.yonetici_id=p2.id

--"AS personel_isim"  yeni isim koyuyoruz ---- ON saartimiz

-------------LIKE Condition-------------
/*
LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma imkani verir

1) % => 0 veya birden fazla karakter belirtir
*/

CREATE TABLE musteriler 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1007, 'erhan', 84000); 


--SORU 1: Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * FROM musteriler 
WHERE isim LIKE 'A%' ---sadece buyuk harfi getirir     

SELECT * FROM musteriler 
WHERE isim ILIKE 'A%' --- "LIKE" basina "ILIKE" yaptigimizda kucuk harfleride  getiri  '/// calismiyor

/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz Eger buyuk kucuk harf gozetmeksizin hullanmak istersek
~~*
*/

--SORU 2 : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim, gelir FROM musteriler WHERE isim ~~ '%e'

--SORU 3 : Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
--1.yol
SELECT isim, gelir FROM musteriler WHERE isim ~~ '%er%'
--2.yol
SELECT isim, gelir FROM musteriler WHERE isim LIKE '%er%'
--3.yol
SELECT isim, gelir FROM musteriler WHERE isim ILIKE '%er%'

--=> sadece bir karakteri gosterir.
--SORU 4 :SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim ~~ '_atma';

--SORU 5 : Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim LIKE '_a%';

--SORU 6: Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim LIKE '__s%';

SELECT * FROM musteriler 
WHERE isim ~~ '__s%';

--SORU 7: Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler 
WHERE isim ~~ '__s_%';

--SORU 8: Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler 
WHERE isim LIKE 'F___%';

SELECT * FROM musteriler 
WHERE isim ~~ 'F___%';

--SORU 9: Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler 
WHERE isim ~~ '_a_m%';

SELECT * FROM musteriler 
WHERE isim LIKE '_a_m%';

-----------------LIKE Condition------------------  
/*
3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/
CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 3); 

--SORU 1 : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--        QUERY yazin
SELECT * FROM kelimeler 
WHERE kelime ~ 'h[ai]t'

SELECT * FROM kelimeler WHERE kelime ~* 'h[ai]t' 

--SORU 2 : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini 
--yazdiran QUERY yazin
SELECT * FROM kelimeler 
WHERE kelime ~* 'h[ak]t' --->

--SORU 3: Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin ---> Icinde = '[mi]'
SELECT * FROM kelimeler 
WHERE kelime ~* '[mi]' --->

--SORU 4: a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin ---> baslayan = '^[as]'
SELECT * FROM kelimeler 
WHERE kelime ~* '^[as]'

--SORU 5: m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin  ---> biten = '[mf]$'
SELECT * FROM kelimeler 
WHERE kelime ~* '[mf]$'

------------NOT LIKE Condition---------------------
--SORU 1 : ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler
WHERE kelime NOT LIKE 'h%'

--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler
WHERE kelime NOT LIKE '%a%';

--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler
WHERE kelime NOT LIKE '_de%'

--SORU 4 : 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler
WHERE kelime !~ '[_eio]'

-----------UPPER – LOWER - INITCAP-------------
/*
Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
kucuk harf yazdirmak icin kullaniriz
*/

--SORU 1: Kelimeler tablosundaki kelime sutunundaki verileri once hepsi buyuk harf, 
--    sonra kucuk harf ve ilk harfleri buyuk olacak sekilde yazdiralim
 
SELECT UPPER (kelime) as kelime FROM kelimeler     ---> "UPPER" butun kelimeleri "BUYUK" yapar 
--kelimeler tablosundan kelime sutununu BUYUK harf yap
 
SELECT LOWER (kelime) as kelime FROM kelimeler    ---> "LOWER" butun kelimeleri "kucuk" yapar 

SELECT  INITCAP (kelime) as kelime FROM kelimeler ---> "INITCAP" kelimenin bas harflerini "BUYUK" yapar

--SORU 2:Musteriler tablosundan  butun isimleri buyuk harf yapiniz
SELECT UPPER(isim) as kelime FROM musteriler --> Butun kelimeleri buyuk yapar

--SORU 3: Musteriler tablosundan  butun isimleri kucuk harf yapiniz
SELECT LOWER(isim) as kelime FROM musteriler --> Butun kelimeleri kucuk yapar

--SORU 3:Musteriler tablosundan Kelimelerin bas harfini buyuk  yapiniz
SELECT INITCAP(isim) as kelime FROM musteriler --> Kelimelerin bas harfini buyuk yapar

--SORU 5:personel22 tablosundan  butun isimleri buyuk harf yapiniz
SELECT LOWER (title), UPPER (isim) FROM personel22  --> Butun kelimeleri buyuk yapar

--------------LIKE Condition------------------
/*
LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir.
LIKE = ~~
ILIKE = ~~*
NOT LIKE = !~~
NOT ILIKE = !~~*
NOT REGEXP_LIKE = !~*
NOT REGEXP_LIKE = !~
*/

SELECT * FROM musteriler --> 

DROP TABLE musteriler --> tabloyu ismini siler

DROP TABLE musteriler CASCADE --> tabloda il ismini siler



