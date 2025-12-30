USE [Superstore Sales]
GO

/****** Object:  View [dbo].[vw_CategoryRevenuePareto]    Script Date: 12/29/2025 8:26:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_CategoryRevenuePareto] AS
WITH Category_Revenue AS (
    SELECT
        Category,
        SUM(Sales) AS Revenue
    FROM [dbo].[SuperstoreSales]
    GROUP BY Category
),
Ranked AS (
    SELECT
        Category,
        Revenue,
        SUM(Revenue) OVER () AS Total_Revenue,
        SUM(Revenue) OVER (
            ORDER BY Revenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS Cumulative_Revenue
    FROM Category_Revenue
)
SELECT
    Category,
    Revenue,
    Cumulative_Revenue / Total_Revenue AS Cumulative_Pct
FROM Ranked;
GO


