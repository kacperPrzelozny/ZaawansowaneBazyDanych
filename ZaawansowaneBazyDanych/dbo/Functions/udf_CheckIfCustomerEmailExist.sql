CREATE FUNCTION dbo.udf_CheckIfCustomerEmailExist
(
    @Email NVARCHAR(50)
)
RETURNS BIT
AS
BEGIN
    DECLARE @Exists BIT = 0;

    IF EXISTS (SELECT 1 FROM [234591].Customer WHERE EmailAddress = @Email)
    BEGIN
        SET @Exists = 1;
    END

    RETURN @Exists;
END;