CREATE PROCEDURE dbo.usp_AddNewProduct
    @ProductName Name,
    @ProductCategoryID INT,
    @ListPrice MONEY,
    @StandardCost MONEY,
    @InitialQuantity INT,
    @ProductNumber NVARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;

    IF @ListPrice <= 0
    BEGIN;
        THROW 50002, 'Cena jednostkowa (ListPrice) musi być większa od zera.', 1;
    END;

    IF @InitialQuantity < 0
    BEGIN;
        THROW 50003, 'Ilość w magazynie nie może być ujemna.', 1;
    END;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @NewProductID INT;

        INSERT INTO SalesLT.Product (
            Name, 
            ProductNumber, 
            StandardCost, 
            ListPrice, 
            ProductCategoryID,
			SellStartDate
        )
        VALUES (
            @ProductName, 
            @ProductNumber, 
            @StandardCost, 
            @ListPrice, 
            @ProductCategoryID,
			GETDATE()
        );

		SELECT TOP(1) @NewProductID = ProductID FROM SalesLT.Product ORDER BY ProductID DESC;

        INSERT INTO SalesLT.ProductInventory (ProductID, Quantity)
        VALUES (@NewProductID, @InitialQuantity);

        COMMIT TRANSACTION;

        SELECT @NewProductID AS GeneratedProductID;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END;