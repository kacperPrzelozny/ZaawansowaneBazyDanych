CREATE TABLE [SalesLT].[ProductsCategories] (
    [Name]          [dbo].[Name]  NOT NULL,
    [ProductNumber] NVARCHAR (25) NOT NULL,
    [CategoryName]  [dbo].[Name]  NULL,
    [OwnerId]       VARCHAR (6)   NOT NULL
);

