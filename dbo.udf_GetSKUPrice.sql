if object_id('dbo.udf_GetSKUPrice') is not null drop function dbo.udf_GetSKUPrice;
go

create function dbo.udf_GetSKUPrice
(
	@ID_SKU as int
)
returns decimal(18, 2)

begin

	declare @Price decimal(18, 2)

	select
		@Price = sum(Value) / sum(Quantity)
	from dbo.Basket
	where ID_SKU = @ID_SKU

	return @Price
end;
go










	
