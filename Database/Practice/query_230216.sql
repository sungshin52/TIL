-- Q1
SELECT productCode, productName, MSRP
FROM products
WHERE MSRP > (
	SELECT AVG(MSRP)
    FROM products
)
ORDER BY MSRP;

-- Q2
SELECT customerNumber, customerName
FROM customers
WHERE customerNumber IN (
	SELECT customerNumber
    FROM orders
    WHERE orderDate BETWEEN '2003-01-06' AND '2003-03-26'
)
ORDER BY customerNumber;

-- Q3
SELECT productCode, productName, productLine, MSRP
FROM products
WHERE (productLine, MSRP) IN (
	SELECT productLine, MAX(MSRP)
    FROM products
    WHERE productLine = 'Classic Cars'
);

-- Q4
SELECT customerNumber, customerName, country
FROM customers
WHERE country IN (
    SELECT MAX(country)
    FROM customers
)
ORDER BY customerNumber;

-- Q5
SELECT customerNumber, customerName, COUNT(*) AS order_count
FROM (
	SELECT *
    FROM orders
    INNER JOIN customers USING (customerNumber)
) AS findCus
GROUP BY customerNumber
ORDER BY order_count DESC
LIMIT 1;

-- Q6
SELECT DISTINCT productCode, productName
FROM orderdetails
INNER JOIN orders
	USING(orderNumber)
INNER JOIN products
	USING(productCode)
WHERE DATE_FORMAT(orderDate, '%Y') = '2004'
ORDER BY productCode DESC;