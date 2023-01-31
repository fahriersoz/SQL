CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
)

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890128, 'Ahmet Ozturk', 'Andana', 1000, 'Pejo'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--SORU 1) Isme gore toplam maaslari bulun
SELECT isim,SUM (maas) FROM personel
GROUP BY isim;

--SORU 2) personel tablosundaki isimleri guruplayiniz
SELECT isim FROM personel

--SORU:3) sehre gore toplam personel sayisini bulun
SELECT sehir, COUNT(isim) AS calisan_sayisi 
FROM personel
GROUP BY sehir;

--SORU:4) Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
SELECT sirket, COUNT(*) AS calisan_sayisi
FROM personel
WHERE maas > 5000
GROUP BY sirket;

--SORU:5) Her sirket icin Min ve Max maasi bulun
SELECT sirket, MIN (maas) AS en_az_maas, MAX (maas) AS en_fazla_maas 
FROM personel
GROUP BY sirket;
SELECT * FROM personel
---------------------------------------------------------
----------------HAVING CLAUSE--------------------
--HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur

/*
Having komutu yanlızca group by komutu ile kullanılır.
Eğer gruplamadan sonra bir şart varsa having komutu kullanılır.
Where kullanımı ile aynı mantıkta çalışır
*/

--SORU 1 Her sirketin MIN  maaslarini eger 4000’den buyukse goster
SELECT sirket,min(maas) as en_dusuk_maas FROM personel
GROUP BY sirket
HAVING min(maas)>4000

--SORU 2)Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi 
--ve toplam maasi gosteren sorgu yaziniz
SELECT isim, sum(maas) AS toplam_maas FROM personel
GROUP BY isim
HAVING sum(maas)>10000;

--SORU 3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
SELECT sehir, COUNT (isim) as toplm_pers_sayisi FROM personel
GROUP BY sehir
HAVING COUNT (isim)>1;

--SORU 4) Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
SELECT sehir, MAX (maas) AS max_maas 
FROM personel
GROUP BY sehir
HAVING MAX (maas) <5000;

----------------UNION OPERATOR--------------
--Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir

--SORU 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
--sehirleri gosteren sorguyu yaziniz
--1.yol
SELECT sehir AS isci_veya_sehir_ismi ,maas
FROM personel 
WHERE maas >5000 

UNION  -- sorgulari birlestiriyor

SELECT isim AS isim_ve_sehir_ismi , maas -- gecici isim isim_ve_sehir_ismi koyduk.
FROM personel
WHERE maas > 4000;

--2.yol
SELECT sehir,maas FROM personel WHERE maas >5000  
UNION  
SELECT isim, maas FROM personel WHERE maas > 4000;

--SORU 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz

SELECT isim as isim_ve_sehir,maas FROM personel WHERE maas >3000 
union
SELECT sehir,maas FROM personel WHERE maas >3000  
ORDER BY maas DESC  -- buyukten kucuge dogru siraladi

--SORU 3) Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
--        olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz
SELECT sehir ,maas FROM personel WHERE maas >3000 
union
SELECT isim,maas FROM personel WHERE maas <5000 
ORDER BY maas DESC
------------------------------------------------------------
----------------UNION OPERATOR-----------------------------
--2 Tablodan Data Birlestirme

--SORU "personel":Personel isminde bir tablo olusturun.Icinde id,isim,sehir,maas ve sirket field’lari olsun. 
--     Id’yi 2.yontemle PK yapin

CREATE TABLE personel
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

--SORU "personel_bilgi":Personel_bilgi isminde bir tablo olusturun.Icinde id,tel ve cocuk sayisi field’lari olsun. Id’yi FK yapin ve personel
--      tablosu ile relation kurun
CREATE TABLE personel_bilgi  
(
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5); 
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

SELECT * FROM personel_bilgi

---------UNION ALL------------------------
/*
Union tekrarli verileri teke düşürür ve bize o şekilde sonuç verir
Union All ise tekrarli verilerle birlikte tün sorguları getirir

UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
Ayni kayit birden fazla olursa, sadece bir tanesini alir.
UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.
NOT : UNION ALL ile birlestirmelerde de
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali
*/

--SORU 3) id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
--        personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

SELECT sehir as sehir_ve_tel, maas as maas_ve_cocuksayisi FROM personel WHERE id = 123456789
UNION
SELECT tel,cocuk_sayisi FROM personel_bilgi WHERE id = 123456789;

--SORU 3) Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim,maas FROM personel WHERE maas<5000
UNION all
SELECT isim,maas FROM personel WHERE maas<5000

--SORU 4) Ayni sorguyu UNION ile iki kere yazarak calistirin
SELECT sehir,maas FROM personel WHERE maas<5000
UNION 
SELECT sehir,maas FROM personel WHERE maas<5000

--SORU 5) Ayni sorguyu UNION ALL ile iki kere yazarak calistirin
SELECT sehir,maas FROM personel WHERE maas<5000
UNION all
SELECT sehir,maas FROM personel WHERE maas<5000

--SORU 6) Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslari yazdirin
SELECT sehir,maas FROM personel WHERE maas>4000;
--SORU 7) Tabloda personel maasi 5000’den az olan tum isimleri ve maaslari yazdirin
SELECT sehir,maas FROM personel WHERE maas<5000;
--SORU 8) Iki sorguyu UNION ve UNION ALL ile birlestirin
SELECT sehir,maas FROM personel WHERE maas>4000
UNION all
SELECT sehir,maas FROM personel WHERE maas<5000;

-------------INTERSECT OPERATOR-------------
/*
SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır. 
Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür. 
Bir sorguda bir kayıt varsa ve diğerinde yoksa, INTERSECT sonuçlarından çıkarılacaktır.
*/

--SORU 1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
SELECT id FROM personel WHERE sehir IN ('Istanbul','Ankara');

--SORU 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3);

--SORU 3) (1. ve 2.soru) Iki sorguyu INTERSECT ile birlestirin
SELECT id FROM personel WHERE sehir IN ('Istanbul','Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3);  -- ORTAK id`ileri verir
--------
--SORU 1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini
SELECT id FROM personel WHERE maas NOT BETWEEN 4800 AND 5500;

--SORU 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3);

--SORU 3) (1. ve 2.soru) Iki sorguyu INTERSECT ile birlestirin
SELECT id FROM personel WHERE maas NOT BETWEEN 4800 AND 5500
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3);
--------
--SORU 4) Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
SELECT isim FROM personel WHERE sirket = 'Honda'
INTERSECT
SELECT isim FROM personel WHERE sirket = 'Ford'
INTERSECT
SELECT isim FROM personel WHERE sirket = 'Tofas'  

-------------EXCEPT OPERATOR---------
/*
SQL EXCEPT yan tümcesi/operatörü, iki SELECT deyimini birleştirmek için kullanılır ve 
ilk SELECT deyiminden ikinci SELECT deyimi tarafından döndürülmeyen satırları döndürür. 
Bu, EXCEPT'in yalnızca ikinci SELECT deyiminde bulunmayan satırları döndürdüğü anlamına gelir.

UNION işlecinde olduğu gibi, EXCEPT işlecini kullanırken de aynı kurallar geçerlidir. 
MySQL, EXCEPT operatörünü desteklemiyor.
*/

--SORU 1) 5000’den az maas alip Honda’da calismayanlari yazdirin
SELECT isim,sirket FROM personel WHERE maas<5000
EXCEPT
SELECT isim,sirket FROM personel WHERE sirket = 'Honda'

--SORU2) Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
SELECT isim, sehir FROM personel WHERE isim= 'Mehmet Ozturk'
EXCEPT
SELECT isim, sirket FROM personel WHERE sehir= 'Istanbul'


SELECT * FROM personel

