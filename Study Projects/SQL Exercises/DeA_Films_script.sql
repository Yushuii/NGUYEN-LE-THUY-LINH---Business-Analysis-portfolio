Create table ProductionCompanies 
(
   ProductionCompanyNo char(2),
   CompanyName varchar(30)
)

Create table Production
(
   ProductionCompanyNo char(2),
   MovieNo char(4)
)

create table StarIn
(
	StarNo char(4),
	MovieNo varchar(4) --
)

Create Table Movies
(
	MovieNo char(4),
	MoviveName varchar(30),
	Year_pr int,
	Director Varchar(30),
	Budget int
)

Create table Stars
(
 StarNo char(4),
 StarName varchar(30),
 NickName varchar(30),
 Height varchar(5),
 BirthDate Datetime,
 BirthPlace varchar(30)
)

---------------
-- Insert Data
-- ProductionCompanies table
INSERT INTO ProductionCompanies
VALUEs ('01', 'Mk2 Production')
INSERT INTO ProductionCompanies
VALUEs ('02', 'Twentieth Century Fox')
INSERT INTO ProductionCompanies
VALUEs ('03', 'Summit Entertainment')
-- StaIn table
INSERT INTO StarIn
VALUES ('S001','P001')
INSERT INTO StarIn
VALUES ('S001','P002')
INSERT INTO StarIn
VALUES ('S001','P003')
INSERT INTO StarIn
VALUES ('S001','P004')
INSERT INTO StarIn
VALUES ('S002','P003')
INSERT INTO StarIn
VALUES ('S002','P004')
INSERT INTO StarIn
VALUES ('S005','P003')
INSERT INTO StarIn
VALUES ('S003','P004')
INSERT INTO StarIn
VALUES ('S004','P005')
INSERT INTO StarIn
VALUES ('S006','P005')
INSERT INTO StarIn
VALUES ('S006','P006')
--Production Table
INSERT INTO Production
VALUES ('01','P001')
INSERT INTO Production
VALUES ('02','P002')
INSERT INTO Production
VALUES ('03','P003')
INSERT INTO Production
VALUES ('03','P004')
-- mOVIES TABLE
INSERT INTO Movies
VALUES ('P001','On the Road',2012,'Walter S',25000000)
INSERT INTO Movies
VALUES ('P002','Jumper',2008,'Doug L',85000000)
INSERT INTO Movies
VALUES ('P003','Twilight',2008,'Catherine H',37000000)
INSERT INTO Movies
VALUES ('P004','The Twilight SaGa',2011,'Bill C',88000000)
INSERT INTO Movies
VALUES ('P005','The RedCliff I',2008,'John Woo',80000000)
INSERT INTO Movies
VALUES ('P006','The RedCliff II',2009,'John Woo',100000000)
-- Stars Table
INSERT INTO Stars
VALUEs('S001','Kristen S','Kris','1.68m','11/08/1975','Texas')
INSERT INTO Stars
VALUEs('S002','Robert P','Robe','1.85m','08/11/1985','Washington DC')
INSERT INTO Stars
VALUEs('S003','Taylor L',NULL,'1.79m','01/01/1980','NewYork')
INSERT INTO Stars
VALUEs('S004','Dakota F','Kota','1.66m','01/01/1980','Los Angeles')
INSERT INTO Stars
VALUEs('S005','Billy B',Null,'1.84m','12/11/1965','NewYork')
INSERT INTO Stars
VALUEs('S006','Leung Chiu-wai','Tony','1.71m',NULL,'HongKong')
INSERT INTO Stars
VALUEs('S007','Zhao Wei',NULL,'1.71m',NULL,'Wuhan')

