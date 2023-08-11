create database ExerciseDb
use ExerciseDb

-- Create the Publisher table
create table Publisher (
    PId int identity primary key,
    PName nvarchar(50) unique not null
)
insert into Publisher (PName) values ('Toei Animation'),('Funimation'),('Pierrot')

-- Create the Category table
create table Category (
    CId int identity primary key,
    CName nvarchar(50) not null
)

insert into Category (CName) values ('Adeventure'), ('Fiction'), ('Science Fiction'),('Comedy')
    
-- Create the Author table
create table Author (
    AId int identity primary key,
    AName nvarchar(50) not null
)
insert into Author (AName) values ('Eiichiro Oda'),('Hajime Isayama'),('Masashi Kishimoto')
    
-- Create the Book table
create table Book (
    BId int identity primary key,
    BName nvarchar(100) not null,
    BPrice float not  null,
    AuthorId int foreign key references Author(AId),
    PublisherId int foreign key references Publisher(PId),
    CategoryId int foreign key references Category(CId)
)
insert into Book (BName, BPrice, AuthorId, PublisherId, CategoryId) values ('one Piece', 5000.99, 1, 1, 1), ('AOT', 4000.99, 2, 2, 2),   ('Naruto', 4500.99, 3, 3, 4)
    

-- Query to fetch desired columns from tables
select B.BId, B.BName, B.BPrice, A.AName as Author, P.PName as Publisher,C.CName as Category
from Book as B join Author as A on B.AuthorId = A.AId join Publisher as P on B.PublisherId = P.PId join Category as C on B.CategoryId = C.CId