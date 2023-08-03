if object_id('dbo.SKU', 'U') is not null drop table dbo.SKU;
if object_id('dbo.Family', 'U') is not null drop table dbo.Family;
if object_id('dbo.Basket', 'U') is not null drop table dbo.Basket;

create table dbo.SKU 
(
    ID int primary key identity,
	Code as '{ID_indentity} + s',
	Name varchar(25),
	UNIQUE(Code)   
);

create table dbo.Family
(
	ID int primary key identity,
	SurName varchar(25),
	BudgetValue int
);

create table dbo.Basket 
(
	ID int primary key identity,
	ID_SKU int references dbo.SKU (ID),
	ID_Family int references dbo.Family (ID),
	Quantity int,
	Value int,
	PurchaseDate datetime default (getdate()),
	DiscountValue int,
	check (Quantity > 0
				and Value > 0) 
);
