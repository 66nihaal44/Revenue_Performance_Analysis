USE [Superstore Sales]
GO

/****** Object:  View [dbo].[vw_SalesRevenueAgg]    Script Date: 12/29/2025 8:28:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_SalesRevenueAgg] AS
SELECT
    Region,
    Segment,
    Category,
    Sub_Category,
    SUM(Sales) AS Revenue
FROM [dbo].[SuperstoreSales]
GROUP BY
    Region,
    Segment,
    Category,
    Sub_Category;
GO


