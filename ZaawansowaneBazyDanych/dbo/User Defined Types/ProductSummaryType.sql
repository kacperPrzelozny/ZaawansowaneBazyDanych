CREATE TYPE [dbo].[ProductSummaryType] AS TABLE (
    [ProductID]   INT          NULL,
    [ProductName] [dbo].[Name] NULL,
    [OldPrice]    MONEY        NULL,
    [NewPrice]    MONEY        NULL);

