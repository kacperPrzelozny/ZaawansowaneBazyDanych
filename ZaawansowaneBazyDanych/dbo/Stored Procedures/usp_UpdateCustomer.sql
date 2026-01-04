CREATE PROCEDURE dbo.usp_UpdateCustomer
    @CustomerID INT,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @Email NVARCHAR(50) = NULL,
    @Phone NVARCHAR(25) = NULL,
    @CompanyName NVARCHAR(128) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY;
		BEGIN TRANSACTION;

		IF NOT EXISTS (SELECT 1 FROM [234591].Customer WHERE CustomerID = @CustomerID)
		BEGIN;
			THROW 50001, 'Nie istnieje Customer o takim ID', 1;
		END;

		IF @FirstName IS NOT NULL
			UPDATE [234591].Customer SET FirstName = @FirstName WHERE CustomerID = @CustomerID;
		IF @LastName IS NOT NULL
			UPDATE [234591].Customer SET LastName = @LastName WHERE CustomerID = @CustomerID;
		IF @Email IS NOT NULL
			UPDATE [234591].Customer SET EmailAddress = @Email WHERE CustomerID = @CustomerID;
		IF @Phone IS NOT NULL
			UPDATE [234591].Customer SET Phone = @Phone WHERE CustomerID = @CustomerID;
		IF @CompanyName IS NOT NULL
			UPDATE [234591].Customer SET CompanyName = @CompanyName WHERE CustomerID = @CustomerID;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH;
	    IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END;