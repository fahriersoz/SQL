CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;

--Örnek 2 : companies tablosundan en yüksek ikinci number_of_employees değeri olan 
--company ve number_of_employees değerlerini çağırın.

--1.YOL--> OFFSET ve FETCH NEXT kullanarak
SELECT company, number_of_employees FROM companies
ORDER BY number_of_employees DESC
OFFSET 1 ROW FETCH NEXT 1 ROW ONLY ; --Sadece bir satiri ver diyorum
-- bu kodu cagirinca intelejide ResultSet gelecek

--2.YOL--> Subquery ile cozum
SELECT company, number_of_employees 
FROM companies WHERE number_of_employees = (SELECT MAX(number_of_employees) FROM companies
WHERE number_of_employees < (SELECT MAX(number_of_employees) FROM companies)) ;


--SELECT MAX(number_of_employees) FROM companies WHERE number_of_employees < (SELECT MAX(number_of_employees) FROM companies)
--// Yukarida paretez icine koyuyoruz.

--Örnek 2: number_of_employees değeri ortalama çalışan sayısından az olan number_of_employees değerlerini 16000 olarak UPDATE edin.

UPDATE companies  SET number_of_employees = 16000 
WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies) ;


