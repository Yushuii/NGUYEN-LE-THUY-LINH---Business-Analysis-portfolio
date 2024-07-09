-------set 2 thuộc tính thành not null
alter table Production
alter column ProductionCompanyNo char (2) not null
alter table Production
alter column MovieNo char(4)  not null
----Sau khi 2 thuộc tính not null thì thêm khóa chính 
ALTER TABLE Production
ADD CONSTRAINT PK_Production PRIMARY KEY (ProductionCompanyNo, MovieNo);
----
alter table Production
add primary key (ProductionCompanyNo,MovieNo)
----tạo ràng buộc

--add constraint Kt_Year_pr check ([Year_pr] 



delete from [dbo].[Movies] 
WHERE NOT (([Year_pr] <=2020) and ([Year_pr] >=2010))

alter table Movies
add constraint hi check (([Year_pr] <=2020) and ([Year_pr] >=2010))



--- truy vấn cơ bản 
select * from [dbo].[Stars]
where [NickName] is  null and year ([BirthDate] ) between 1960 and 1980 
----truy vấn
update [dbo].[Movies]
set [Budget] = [Budget]*2
where  [Director] = 'John Woo'
---Viết câu lệnh cho biết tên của hãng film nào sản xuất nhiều hơn 1 bộ phim cùng với số lượng bộ film mà hãng đó đã sản xuất, tính đến năm 2012;
SELECT P.ProductionCompanyNo, COUNT(M.MovieNo) as sl
FROM Movies M
JOIN Production P ON M.MovieNo = P.MovieNo
WHERE M.Year_pr < 2012
GROUP BY P.ProductionCompanyNo
HAVING COUNT(M.MovieNo) > 1;
---Cho biết toàn bộ thông tin của diễn viên chưa từng đóng bộ phim nào.
		--cách 1
select *
from [dbo].[Stars] S
where S.[StarNo] in (
						select S.[StarNo]
						from [dbo].[Stars] S
						left join [dbo].[StarIn]  SI on S.[StarNo] =  SI.[StarNo]
						group by S.[StarNo]
						having count (SI.[MovieNo]) <1
						)
--Dùng truy vấn lồng nhau để tìm toàn bộ thông tin của diễn viên đã đóng cả 2 phim RedCliff I và RedCliff II
select * 
from [dbo].[Stars] S
where S.[StarNo] in (
						select [StarNo]
						from [dbo].[StarIn] SI
						where SI.[MovieNo] in
								(
									select M.[MovieNo]
									from [dbo].[Movies] M
									where M.[MoviveName] = 'The RedCliff I'
								)
					intersect 
						select [StarNo]
						from [dbo].[StarIn] SI
						where SI.[MovieNo] in		
								(
									select [MovieNo]
									from [dbo].[Movies] M
									where M.[MoviveName] = 'The RedCliff II' 
								)
					)


					