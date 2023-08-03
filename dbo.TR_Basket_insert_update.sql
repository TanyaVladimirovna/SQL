create trigger dbo.TR_Basket_insert_update
	on dbo.Basket after insert, update
as
begin
    if (select
			count(*) 
		from dbo.Basket
		where ID_SKU in (select 
							ID_SKU 
						 from inserted)) >= 2
    begin
        update dbo.Basket
        set DiscountValue = Value * 0.05
        where ID_SKU in (select 
							ID_SKU 
						 from inserted)
    end
    else
    begin
        update dbo.Basket
        set DiscountValue = 0
        where ID_SKU in (select 
							ID_SKU
						 from inserted)
    end
end
go