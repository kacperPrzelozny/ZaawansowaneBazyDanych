CREATE PROCEDURE [Student_1].usp_ProcessTopProducts
    @Summary dbo.ProductSummaryType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @N DECIMAL(3,2) = 0.01; 

    SELECT 
		ProductID,
        ProductName AS ProductName,
        ListPrice AS OldPrice,
        CAST((ListPrice - (ListPrice * @N)) AS DECIMAL(18,2)) AS NewPrice
    FROM #TopProducts;

END;