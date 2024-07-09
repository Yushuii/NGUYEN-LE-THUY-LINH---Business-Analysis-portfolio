---Dùng câu lệnh ALTER TABLE để tạo ràng buộc khóa ngoại giửa hai bảng STARIN và MOVIES 
		---sửa lại thuộc tính movieno thì mới ràng buộc 2 bảng được 
		alter table  [dbo].[Movies]
		alter column [MovieNo] varchar (4) not null
		---set khóa chính Movie
		alter table  [dbo].[Movies]
		add constraint PK1_movieno
		primary key ([MovieNo])
		--set not null cho 2 thuộc tính của starIn
		alter table  [dbo].[StarIn] 
		alter column [StarNo] char (4) not null
		alter table  [dbo].[StarIn] 
		alter column [MovieNo] varchar (4) not null
		--set khóa chính là 2 thằng này
		alter table  [dbo].[StarIn] 
		add constraint PK1_start
		primary key ([StarNo],[MovieNo])	
		----tạo ràng buộc khóa ngoại giửa hai bảng STARIN và MOVIES 
		alter table  [dbo].[StarIn]
		add constraint FK1_mamovie
		foreign key ([MovieNo] ) references [dbo].[Movies] ([MovieNo])
--Viết câu lệnh cho biết toàn bộ thông tin của từng diễn viên đã đóng những bộ phim được 
--sản xuất từ từ năm 2009 đến 2012. Kết quả truy vấn phải có cả thông tin diễn viên và phim.
		select * 
		from [dbo].[StarIn] SI
		join [dbo].[Movies] M on  SI.[MovieNo] = M.[MovieNo]
		join [dbo].[Stars] S on SI.[StarNo] = S.[StarNo]
		where [Year_pr] between 2009 and 2012
---Diễn viên Zhao Wei không đóng phim The RedCliff I, viết câu lệnh xóa dòng dữ liệu 
--thích hợp để database phản ánh chính xác thông tin này.
	delete from [dbo].[StarIn] where [StarNo]  in(
												select [StarNo]
												from [dbo].[Stars]
												where [StarName] = 'Zhao Wei'
												)
												and [MovieNo] in(
												select [MovieNo]
												from [dbo].[Movies]
												where [MoviveName] = 'The RedCliff I'
												)
--Viết câu lệnh cho biết tên của diễn viên nào đóng nhiều hơn một bộ phim và số lượng bộ phim người đó đã đóng.
	select [StarName], count (SI.[MovieNo]) as soluong
	from [dbo].[Stars] S
	join [dbo].[StarIn] SI on S.[StarNo] = SI.[StarNo]
	group by SI.[StarNo], [StarName]
	having count (SI.[MovieNo]) >1 
--Hai diễn viên Leung Chiu-Wai và Zhao Wei đã đóng chung với nhau bộ phim nào
	select [MoviveName]
	from [dbo].[Movies]
	where [MovieNo] in (
		--danh sách phim wai đóng 
		select [MovieNo]
		from [dbo].[StarIn]
		where [StarNo] in (
						select [StarNo]
						from [dbo].[Stars]
						where [StarName] = 'Leung Chiu-wai'
						)
						)
	and  [MovieNo] in (
		--danh sách phim wei đóng
		select [MovieNo]
		from [dbo].[StarIn]
		where [StarNo] in (
						select [StarNo]
						from [dbo].[Stars]
						where [StarName] = 'Zhao Wei'
						)
						)
--Dùng truy vấn lồng nhau để tìm thông tin của những diễn viên đã đóng 2 bộ phim khác nhau cùng 
--với tên của 2 bộ phim đó (trong kết quả không có dữ liệu trùng nhau)
select *  --nếu chọn * thì bị trùng thông tin starno
		--[StarName],[NickName],[Height],[BirthDate],[BirthPlace],[MoviveName]
from [dbo].[Stars] S			
join 
							(select [StarNo] ,[MoviveName]
							from [dbo].[Movies] M
							join [dbo].[StarIn] SI on  SI.[MovieNo] = M.[MovieNo]
							where [StarNo] in (
									select [StarNo]
									from [dbo].[StarIn] SI
									join [dbo].[Movies] M on SI.[MovieNo] = M.[MovieNo]
									group by [StarNo]
									having count (SI.[MovieNo]) =2
												)
							)
										
									AS MOVIEEE  
									on S.[StarNo] = MOVIEEE.[StarNo]




	
			
					
					
					
					
			