CREATE FUNCTION [Student_1].ufn_IsPriceHigherThanCurrent
(
	@Product NVARCHAR(MAX)
)
RETURNS BIT AS
BEGIN
	DECLARE @ProductID INT = JSON_VALUE(@Product, '$.ProductID')
	DECLARE @Price MONEY = JSON_VALUE(@Product, '$.ListPrice')
	DECLARE @Result BIT;

	DECLARE @ActualPrice MONEY;
	SELECT @ActualPrice = ListPrice FROM SalesLT.Product WHERE Product.ProductID = @ProductID

	IF @Price > @ActualPrice
		SET @Result = 1;
	IF @Price < @ActualPrice
		SET @Result = 0;

	RETURN @Result;
END;