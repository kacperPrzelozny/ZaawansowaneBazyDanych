CREATE TABLE [SalesLT].[ProductAttribute] (
    [ProductID]  INT                                    NULL,
    [Attributes] XML(CONTENT [dbo].[ProductAttributes]) NULL,
    CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY ([ProductID]) REFERENCES [SalesLT].[Product] ([ProductID])
);

