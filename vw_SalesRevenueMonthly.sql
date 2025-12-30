USE [Superstore Sales]
GO

/****** Object:  View [dbo].[vw_SalesRevenueMonthly]    Script Date: 12/29/2025 8:29:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_SalesRevenueMonthly] AS
SELECT
    DATEFROMPARTS(YEAR(Order_Date), MONTH(Order_Date), 1) AS MonthStart,
    Region,
    Segment,
    Category,
    Sub_Category,
    SUM(Sales) AS revenue
FROM SuperstoreSales
GROUP BY
    DATEFROMPARTS(YEAR(Order_Date), MONTH(Order_Date), 1),
    Region,
    Segment,
    Category,
    Sub_Category;
GO


