SQL Queries

This project includes structured SQL queries used to analyze business distribution, industry trends, and market opportunities.

Query 1: Top 10 Business Categories
```sql
SELECT 
    BusinessCategory,
    COUNT(*) AS total_businesses
FROM BusinessLicenses
WHERE BusinessCategory IS NOT NULL
GROUP BY BusinessCategory
ORDER BY total_businesses DESC
LIMIT 10;

SELECT 
    TownCentre,
    COUNT(*) AS total_businesses
FROM BusinessLicenses
WHERE TownCentre IS NOT NULL
GROUP BY TownCentre
ORDER BY total_businesses DESC;

SELECT
    TownCentre,
    LicenseType,
    COUNT(*) AS total_businesses,
    ROUND(
        COUNT(*) * 100.0 / 
        SUM(COUNT(*)) OVER (PARTITION BY TownCentre),
        2
    ) AS percentage
FROM BusinessLicenses
WHERE TownCentre IS NOT NULL
  AND LicenseType IS NOT NULL
GROUP BY TownCentre, LicenseType
ORDER BY TownCentre, total_businesses DESC;
