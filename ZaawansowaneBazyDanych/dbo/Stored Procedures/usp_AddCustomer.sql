
CREATE PROCEDURE dbo.usp_AddCustomer
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(50),
    @Phone NVARCHAR(25),
    @CompanyName NVARCHAR(128)
AS
BEGIN
    SET NOCOUNT ON;

	IF dbo.udf_CheckIfCustomerEmailExist(@Email) = 1
    BEGIN
        PRINT 'Adres e-mail jest już w systemie';
        RETURN;
    END

	INSERT INTO [234591].Customer (FirstName, LastName, CompanyName, EmailAddress, PasswordHash, PasswordSalt)
	VALUES (@FirstName, @LastName, @CompanyName, @Email, 'customhash', 'customsalt')
END;