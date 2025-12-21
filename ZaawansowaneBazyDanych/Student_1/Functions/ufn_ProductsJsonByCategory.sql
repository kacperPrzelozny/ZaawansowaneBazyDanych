CREATE FUNCTION [Student_1].ufn_ProductsJsonByCategory
(
	@CategoryName NVARCHAR(50)
)
RETURNS NVARCHAR(MAX) AS
BEGIN
	DECLARE @json NVARCHAR(MAX)

	SET @json = (
		SELECT 
			Product.ProductID as 'ProductID',
			Product.Name as 'Name',
			Product.Color as 'Color',
			Product.Size as 'Size',
			Product.Weight as 'Weight'
		FROM SalesLT.Product
		INNER JOIN SalesLT.ProductCategory ON Product.ProductCategoryID = ProductCategory.ProductCategoryID
		WHERE ProductCategory.Name = @CategoryName
		FOR JSON PATH
    );
    
    RETURN @json;
END;