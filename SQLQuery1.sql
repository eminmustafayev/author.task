create database Authors
use Authors

create table Books(
Id int primary key identity,
[Name] nvarchar(100),
[PageCount] int Check(PageCount>9),
Check (Len(Name) BETWEEN 2 AND 100),
authorId int foreign key references Authors(Id)
)

create table Authors(
Id int primary key identity,
[Name] nvarchar(99) not null ,
Surname nvarchar(99) not null )

create view BookAuthorDetalis as
select 
Books.Id,
Books.Name,
Books.PageCount,
Authors.Name + ' ' + Authors.Surname as AuthorFullName
from Books
join Authors on Authors.Id=Books.authorId

select *from BookAuthorDetalis

create procedure usp_Get_Book @axtarilanDeyer nvarchar(100) as 
select
Books.Id,
Books.Name,
Books.PageCount,
Authors.Name + ' ' + Authors.Surname as AuthorFullName
from Books
Join Authors on  @axtarilanDeyer=Books.authorId
where  Authors.Name + ' ' + Authors.Surname LIKE '%' +@axtarilanDeyer + '%'

EXEC usp_Get_Book  @axtarilanDeyer = 


CREATE PROCEDURE usp_Insert_Author  @Name NVARCHAR(50),@Surname NVARCHAR(50) AS
INSERT INTO Authors (Name, Surname)    VALUES (@Name, @Surname)
 
 CREATE PROCEDURE usp_Update_Author 
 @Id INT,
 @Name nvarchar(50),   @Surname NVARCHAR(50) AS
   UPDATE Authors
    SET Name = @Name, Surname = @Surname
    WHERE Id = @Id

	CREATE PROCEDURE usp_Delete_Author @Id INT AS
     delete from Authors
    where Id = @Id

 CREATE VIEW AuthorDetails AS
SELECT 
    Authors.Id AS Id,
    (Authors.Name + ' ' + Authors.Surname) AS FullName,
    COUNT(Books.Id) AS BooksCount,
    MAX(Books.PageCount) AS MaxPageCount
FROM 
    Authors
  JOIN 
    Books ON Authors.Id = Books.AuthorId
 

 


 