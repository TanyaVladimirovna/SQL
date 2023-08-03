if object_id('dbo.usp_MakeFamilyPurchase', 'P') is not null
	drop proc dbo.usp_MakeFamilyPurchase;
go

create proc dbo.usp_MakeFamilyPurchase
    @FamilySurName varchar(255)
as
begin
    set nocount on;

    declare @FamilyID int;

    select
		@FamilyID = dbo.Family.ID
    from dbo.Family
    where SurName = @FamilySurName;

    if @FamilyID is null
    begin
        raiserror('Такой семьи нет', 16, 1);
        return;
    end;

    update dbo.Family
    set BudgetValue = BudgetValue - (
        select 
			sum(Value)
        from dbo.Basket
        where dbo.Family.ID = @FamilyID
    )
    where dbo.Family.ID = @FamilyID;
end;
go

exec dbo.usp_MakeFamilyPurchase @FamilySurName = 'Smith';