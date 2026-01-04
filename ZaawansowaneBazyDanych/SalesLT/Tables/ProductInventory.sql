CREATE TABLE [SalesLT].[ProductInventory] (
    [ProductID]    INT              NOT NULL,
    [Quantity]     INT              DEFAULT ((0)) NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER DEFAULT (newid()) NULL,
    [ModifiedDate] DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_ProductInventory_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

