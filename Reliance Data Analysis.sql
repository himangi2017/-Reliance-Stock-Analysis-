DROP TABLE reliance_data;
CREATE TABLE reliance_data (

    TradeDate DATE,

    OpenPrice DECIMAL(10,2),

    HighPrice DECIMAL(10,2),

    LowPrice DECIMAL(10,2),

    ClosePrice DECIMAL(10,2),

    PreviousClose DECIMAL(10,2),

    LTP DECIMAL(10,2),

    VWAP DECIMAL(10,2),

    Week52High DECIMAL(10,2),

    Week52Low DECIMAL(10,2),

    Volume BIGINT,

    TradeValue BIGINT,

    NumberOfTrades BIGINT

);

select*from reliance_data;

SELECT COUNT(*) AS Total_Rows
FROM reliance_data;

SELECT ROUND(AVG(ClosePrice), 2) AS Average_Close_Price
FROM reliance_data;

SELECT
TradeDate,
Volume
FROM reliance_data
ORDER BY Volume DESC
LIMIT 1;

SELECT
TradeDate,
(HighPrice - LowPrice)
AS Daily_Volatility
FROM reliance_data;

SELECT
TradeDate,
ClosePrice,
VWAP,
CASE
WHEN ClosePrice > VWAP
THEN 'Bullish'
WHEN ClosePrice < VWAP
THEN 'Bearish'
ELSE 'Neutral'
END AS VWAP_Signal
FROM reliance_data;

SELECT
TradeDate,
ROUND(
((ClosePrice - OpenPrice)
/ OpenPrice) * 100,
2)
AS Daily_Return_Percentage
FROM reliance_data;

SELECT
TradeDate,
ClosePrice,
ROUND(
AVG(ClosePrice)
OVER(ORDER BY TradeDate
ROWS BETWEEN 4 PRECEDING
AND CURRENT ROW),2)
AS Moving_Average_5_Days
FROM reliance_data;

SELECT
CASE
WHEN AVG(ClosePrice) > AVG(VWAP)
THEN 'Reliance Trend Bullish'
ELSE 'Reliance Trend Bearish'
END AS Market_Insight
FROM reliance_data;

SELECT
TradeDate,
HighPrice - LowPrice AS Price_Volatility
FROM reliance_data;

SELECT
TradeDate,
Volume
FROM reliance_data
ORDER BY Volume DESC
limit 5;

SELECT
TradeDate,
ClosePrice,
ClosePrice - LAG(ClosePrice)
OVER (ORDER BY TradeDate) AS Price_Change
FROM reliance_data;

SELECT
CASE
WHEN ClosePrice > OpenPrice THEN 'Bullish Day'
WHEN ClosePrice < OpenPrice THEN 'Bearish Day'
ELSE 'Neutral'
END AS Market_Type,
COUNT(*) AS Total_Days
FROM reliance_data
GROUP BY Market_Type;

SELECT
DATE_FORMAT(TradeDate, '%Y-%m') AS Month,
ROUND(AVG(ClosePrice),2) AS Avg_Close
FROM reliance_data
GROUP BY Month
ORDER BY Month;







