CREATE PROCEDURE dbo.usp_GetCustomers
    @FirstName Name = NULL,
    @LastName K1_surname.LastName = NULL,
    @CustomerId INT = NULL,
    @EmailAddress NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CustomerID,
        FirstName,
        LastName,
        EmailAddress,
        Phone,
        CompanyName
    FROM [234591].Customer
    WHERE 
        (@CustomerId IS NULL OR CustomerID = @CustomerId)
        AND (@FirstName IS NULL OR FirstName = @FirstName)
        AND (@LastName IS NULL OR LastName = @LastName)
        AND (@EmailAddress IS NULL OR EmailAddress = @EmailAddress);
END;