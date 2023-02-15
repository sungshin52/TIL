-- Q1
SELECT employeeNumber, lastName, firstName, city
FROM employees AS em
INNER JOIN offices AS offc
	ON em.officeCode = offc.officeCode
ORDER BY employeeNumber;

-- Q2
SELECT cus.customerNumber, offc.officeCode, cus.city, offc.city
FROM customers AS cus
LEFT JOIN offices AS offc
	ON cus.city = offc.city
ORDER BY cus.customerNumber DESC;

-- Q3
SELECT cus.customerNumber, offc.officeCode, cus.city, offc.city
FROM customers AS cus
RIGHT JOIN offices AS offc
	ON cus.city = offc.city
ORDER BY cus.customerNumber DESC;

-- Q4
SELECT cus.customerNumber, offc.officeCode, cus.city, offc.city
FROM customers AS cus
INNER JOIN offices AS offc
	ON cus.city = offc.city
ORDER BY cus.customerNumber DESC;

-- Q5
-- Q2, Q3, Q4 결과가 다른 이유?
-- Q2는 customers 테이블의 모든 레코드와 함꼐 교집합을 반환하는 반면, Q3은 offices 테이블의 모든 레코드와 함께 교집합을 반환한다.
-- Q4는 두 테이블의 교집합만을 반환한다. 따라서 결과가 다르다.

-- Q6
SELECT cus.customerNumber, offc.officeCode, cus.city, offc.city
FROM customers AS cus
LEFT JOIN offices AS offc
	ON cus.city = offc.city
UNION
SELECT cus.customerNumber, offc.officeCode, cus.city, offc.city
FROM customers AS cus
RIGHT JOIN offices AS offc
	ON cus.city = offc.city
ORDER BY customerNumber DESC;

-- Q7
SELECT or_d.orderNumber, ord.orderDate
FROM orderdetails AS or_d
INNER JOIN orders AS ord
	ON or_d.orderNumber = ord.orderNumber
ORDER BY orderNumber;

-- Q8
SELECT or_d.orderNumber, or_d.productCode, pro.productName
FROM orderdetails AS or_d
INNER JOIN products AS pro
	ON or_d.productCode = pro.productCode
ORDER BY orderNumber;

-- Q9
SELECT or_d.orderNumber, or_d.productCode, ord.orderDate, pro.productName
FROM orderdetails AS or_d
INNER JOIN orders AS ord
	ON or_d.orderNumber = ord.orderNumber
INNER JOIN products AS pro
	ON or_d.productCode = pro.productCode
ORDER BY orderNumber;