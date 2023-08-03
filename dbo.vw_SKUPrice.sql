select
	S.ID 
	,S.Code
	,S.Name
	,dbo.udf_GetSKUPrice(B.ID_SKU) as Price
from dbo.SKU as S
	join dbo.Basket as B on B.ID = S.ID;