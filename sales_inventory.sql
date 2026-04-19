-- =========================================================
-- Sales & Inventory Assignment – Schema, Data, and Solutions
-- Target: PostgreSQL, schema: assignment
-- =========================================================


-- ===========================
-- 0. SCHEMA AND TABLE SETUP
-- ===========================

-- Create schema
CREATE SCHEMA IF NOT EXISTS assignment;

-- Drop tables if they already exist (for repeatable runs)
DROP TABLE IF EXISTS assignment.sales CASCADE;
DROP TABLE IF EXISTS assignment.inventory CASCADE;
DROP TABLE IF EXISTS assignment.products CASCADE;
DROP TABLE IF EXISTS assignment.customers CASCADE;

-- Create Customers table
CREATE TABLE assignment.customers (
  customer_id       INT PRIMARY KEY,
  first_name        VARCHAR(50),
  last_name         VARCHAR(50),
  email             VARCHAR(100),
  phone_number      VARCHAR(50),
  registration_date DATE,
  membership_status VARCHAR(10)
);

-- Create Products table
CREATE TABLE assignment.products (
  product_id     INT PRIMARY KEY,
  product_name   VARCHAR(100),
  category       VARCHAR(50),
  price          DECIMAL(10, 2),
  supplier       VARCHAR(100),
  stock_quantity INT
);

-- Create Sales table
CREATE TABLE assignment.sales (
  sale_id       INT PRIMARY KEY,
  customer_id   INT,
  product_id    INT,
  quantity_sold INT,
  sale_date     DATE,
  total_amount  DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES assignment.customers(customer_id),
  FOREIGN KEY (product_id)  REFERENCES assignment.products(product_id)
);

-- Create Inventory table
CREATE TABLE assignment.inventory (
  product_id     INT PRIMARY KEY,
  stock_quantity INT,
  FOREIGN KEY (product_id) REFERENCES assignment.products(product_id)
);


-- ===========================
-- 1. DATA INSERTS
-- ===========================

-- Customers (1–50)
INSERT INTO assignment.customers
(customer_id, first_name, last_name, email, phone_number, registration_date, membership_status)
VALUES
(1, 'Karen', 'Molina', 'gonzalezkimberly@glass.com', '(728)697-1206', '2020-08-27', 'Bronze'),
(2, 'Elizabeth', 'Archer', 'tramirez@gmail.com', '778.104.6553', '2023-08-28', 'Silver'),
(3, 'Roberta', 'Massey', 'davislori@gmail.com', '+1-365-606-7458x399', '2024-06-12', 'Bronze'),
(4, 'Jacob', 'Adams', 'andrew72@hotmail.com', '246-459-1425x462', '2023-02-10', 'Gold'),
(5, 'Cynthia', 'Lowery', 'suarezkiara@ramsey.com', '001-279-688-8177x4015', '2020-11-13', 'Silver'),
(6, 'Emily', 'King', 'igoodwin@howard.com', '(931)575-5422x5900', '2021-05-01', 'Silver'),
(7, 'Linda', 'Larsen', 'pware@yahoo.com', '289-050-2028x7673', '2021-08-20', 'Silver'),
(8, 'Angela', 'Hanson', 'zanderson@gmail.com', '+1-403-917-3585', '2023-03-17', 'Bronze'),
(9, 'Whitney', 'Wilson', 'norma70@yahoo.com', '001-594-317-6656', '2024-01-27', 'Bronze'),
(10, 'Angela', 'Atkins', 'burnsjorge@medina.org', '344.217.5788', '2025-02-05', 'Silver'),
(11, 'Gary', 'Lucero', 'ssnyder@hotmail.com', '001-842-595-7853', '2024-10-08', 'Silver'),
(12, 'Matthew', 'Romero', 'jennifer22@gmail.com', '556.328.91896', '2022-04-07', 'Bronze'),
(13, 'Ronald', 'Thompson', 'hramos@hayes.biz', '298-487-2483', '2023-07-31', 'Bronze'),
(14, 'Suzanne', 'Anderson', 'michaelcole@ruiz-ware.com', '+1-018-029-7257', '2023-11-02', 'Bronze'),
(15, 'Mary', 'Kelly', 'matthewmurphy@gmail.com', '(845)934-9x286', '2021-01-20', 'Bronze'),
(16, 'John', 'George', 'burnettlauren@gmail.com', '+1-708-200-4286', '2022-05-17', 'Bronze'),
(17, 'James', 'Rodriguez', 'brownbrian@blair-sanford.com', '8826047658', '2022-11-25', 'Gold'),
(18, 'Steven', 'Burnett', 'zblackburn@yahoo.com', '(055)912-6726x1246', '2020-01-28', 'Gold'),
(19, 'Jonathan', 'White', 'millsseth@choi-kelly.org', '755-979-1934x772', '2022-02-06', 'Bronze'),
(20, 'Christopher', 'Santiago', 'heidimaddox@hotmail.com', '118-589-6973x058', '2021-10-16', 'Silver'),
(21, 'John', 'Diaz', 'gsmith@hotmail.com', '369.915.4337', '2022-09-17', 'Gold'),
(22, 'Curtis', 'Rose', 'ryanmartinez@moore.com', '(921)461-2128', '2021-12-14', 'Bronze'),
(23, 'Charles', 'Hughes', 'jonesangela@frank-lynn.com', '(152)603-5387x8994', '2024-07-29', 'Silver'),
(24, 'Sarah', 'Cooke', 'whitedennis@tucker.org', '(641)830-6756x56741', '2024-12-15', 'Bronze'),
(25, 'Luis', 'Harrison', 'melvin70@gmail.com', '516.509.9493', '2021-08-19', 'Silver'),
(26, 'Annette', 'Greene', 'aaron68@hall.com', '(733)734-1847x1078', '2025-04-12', 'Bronze'),
(27, 'Melissa', 'Jacobson', 'becklarry@gmail.com', '562-245-7784x4729', '2023-04-28', 'Bronze'),
(28, 'Julie', 'Gardner', 'adamsrodney@hall.com', '+1-014-029-3206x188', '2024-03-31', 'Gold'),
(29, 'Margaret', 'Taylor', 'lfuller@hotmail.com', '(299)340-8900x297', '2021-09-06', 'Bronze'),
(30, 'Erika', 'Mckee', 'wsmith@gmail.com', '(160)040-7321', '2021-05-25', 'Silver'),
(31, 'Donna', 'Whitney', 'justinnicholson@gmail.com', '7086491657', '2022-08-07', 'Gold'),
(32, 'Kristina', 'Wade', 'ashley30@richards-young.com', '603-604-2831x303', '2024-03-16', 'Silver'),
(33, 'Joshua', 'Green', 'ihartman@yahoo.com', '988-232-8285x00933', '2024-05-14', 'Silver'),
(34, 'John', 'Leblanc', 'herickson@green.info', '229.016.2527x20209', '2022-12-24', 'Silver'),
(35, 'Nicholas', 'Campbell', 'ghernandez@hotmail.com', '(982)215-6626', '2022-06-06', 'Gold'),
(36, 'Christopher', 'Hicks', 'ryan48@gmail.com', '884.881.7758', '2021-04-03', 'Silver'),
(37, 'Craig', 'Miller', 'scampbell@johnson.net', '390-328-7286x021', '2024-04-30', 'Silver'),
(38, 'Jennifer', 'Bailey', 'dwright@hotmail.com', '001-992-011-9250', '2022-09-07', 'Silver'),
(39, 'Emma', 'Davis', 'lisalester@hotmail.com', '911.706.3025', '2021-06-04', 'Gold'),
(40, 'Michael', 'Wilson', 'lmerritt@wallace-wang.com', '462.021.3233', '2025-01-14', 'Bronze'),
(41, 'Sarah', 'Church', 'deniseramos@gmail.com', '(840)285-3653x61868', '2021-03-14', 'Silver'),
(42, 'Carolyn', 'Stevenson', 'george62@garrison.net', '040.179.1155', '2024-07-26', 'Silver'),
(43, 'Sarah', 'Cole', 'amandamartin@hotmail.com', '481-651-5206x4800', '2024-07-27', 'Silver'),
(44, 'Jeremiah', 'Lozano', 'bethany38@lopez.net', '846-327-7426', '2023-01-02', 'Bronze'),
(45, 'Leslie', 'Boyd', 'cartermorgan@scott-franco.com', '+1-583-786-3525', '2022-10-22', 'Silver'),
(46, 'Carrie', 'Anderson', 'stevenlivingston@yahoo.com', '+1-086-709-5530x6149', '2024-08-23', 'Gold'),
(47, 'Jared', 'Davis', 'mooretodd@cook.com', '001-069-544-8807x2397', '2022-08-29', 'Bronze'),
(48, 'James', 'Soto', 'patriciaburns@yahoo.com', '129.857.8193x421', '2023-01-27', 'Gold'),
(49, 'Cody', 'Kline', 'bradfordleslie@hotmail.com', '+1-710-706-3703x7998', '2022-06-28', 'Bronze'),
(50, 'Jennifer', 'Perkins', 'austinowens@hill.info', '762.009.1882', '2020-10-19', 'Silver');

-- Products (1–15)
INSERT INTO assignment.products
(product_id, product_name, category, price, supplier, stock_quantity)
VALUES
(1,  'Laptop',              'Electronics',  999.99, 'Dell',       50),
(2,  'Smartphone',          'Electronics',  799.99, 'Samsung',   150),
(3,  'Washing Machine',     'Appliances',   499.99, 'LG',         30),
(4,  'Headphones',          'Accessories',  199.99, 'Sony',      100),
(5,  'Refrigerator',        'Appliances',  1200.00, 'Whirlpool',  40),
(6,  'Smart TV',            'Electronics', 1500.00, 'Samsung',    20),
(7,  'Microwave',           'Appliances',   180.00, 'Panasonic',  75),
(8,  'Blender',             'Appliances',    50.00, 'Ninja',     200),
(9,  'Gaming Console',      'Electronics',  350.00, 'Sony',       60),
(10, 'Wireless Mouse',      'Accessories',   25.00, 'Logitech',  300),
(11, 'Keyboard',            'Accessories',   49.99, 'Logitech',  250),
(12, 'Monitor',             'Electronics',  250.00, 'Acer',      120),
(13, 'External Hard Drive', 'Electronics',   80.00, 'Seagate',    90),
(14, 'Tablet',              'Electronics',  400.00, 'Apple',      70),
(15, 'Smartwatch',          'Electronics',  199.99, 'Apple',     120);

-- Sales
INSERT INTO assignment.sales
(sale_id, customer_id, product_id, quantity_sold, sale_date, total_amount)
VALUES
(1,  1,  1,  1, '2023-07-15',  999.99),
(2,  2,  2,  2, '2023-08-20', 1599.98),
(3,  3,  3,  1, '2023-09-10',  499.99),
(4,  4,  4,  3, '2023-07-25',  599.97),
(5,  5,  5,  1, '2023-06-18', 1200.00),
(6,  6,  6,  1, '2023-10-05', 1500.00),
(7,  7,  7,  1, '2023-08-01',  180.00),
(8,  8,  8,  2, '2023-09-02',  100.00),
(9,  9,  9,  1, '2023-10-10',  350.00),
(10,10, 10,  3, '2023-11-12',   75.00),
(11,11, 11,  2, '2023-12-01',  100.00),
(12,12, 12,  1, '2023-12-07',  250.00),
(13,13, 13,  1, '2024-01-15',   80.00),
(14,14, 14,  1, '2024-02-05',  400.00),
(15,15, 15,  1, '2024-01-05',  199.99);

-- Inventory
INSERT INTO assignment.inventory
(product_id, stock_quantity)
VALUES
(1,  50),
(2, 150),
(3,  30),
(4, 100),
(5,  40),
(6,  20),
(7,  75),
(8, 200),
(9,  60),
(10,300),
(11,250),
(12,120),
(13, 90),
(14, 70),
(15,120);

-- Quick sanity checks
SELECT * FROM assignment.customers   LIMIT 5;
SELECT * FROM assignment.products    LIMIT 5;
SELECT * FROM assignment.sales       LIMIT 5;
SELECT * FROM assignment.inventory   LIMIT 5;


-- ============================================
-- 2. SOLUTIONS WITH EXPLANATORY NOTES
-- ============================================

-- -------------------------------------------
-- Q1–10: Basic SELECTs and aggregations
-- -------------------------------------------

-- Q1: Select all data from Customers.
SELECT *
FROM assignment.customers;

-- Q2: Total number of products.
SELECT COUNT(*) AS total_products
FROM assignment.products;

-- Q3: Product name and price where price > 500.
SELECT product_name, price
FROM assignment.products
WHERE price > 500;

-- Q4: Average price of all products.
SELECT AVG(price) AS avg_price
FROM assignment.products;

-- Q5: Total sales amount across all records.
SELECT SUM(total_amount) AS total_sales_amount
FROM assignment.sales;

-- Q6: Distinct membership statuses.
SELECT DISTINCT membership_status
FROM assignment.customers;

-- Q7: Full name from first and last name.
SELECT
  first_name || ' ' || last_name AS full_name
FROM assignment.customers;

-- Q8: Products in category 'Electronics'.
SELECT *
FROM assignment.products
WHERE category = 'Electronics';

-- Q9: Highest price in Products.
SELECT MAX(price) AS highest_price
FROM assignment.products;

-- Q10: Number of sales per product.
SELECT
  product_id,
  COUNT(*) AS sales_count
FROM assignment.sales
GROUP BY product_id;


-- -------------------------------------------
-- Q11–20: Grouping and basic joins
-- -------------------------------------------

-- Q11: Total quantity sold for each product.
SELECT
  product_id,
  SUM(quantity_sold) AS total_quantity_sold
FROM assignment.sales
GROUP BY product_id;

-- Q12: Lowest price of products.
SELECT MIN(price) AS lowest_price
FROM assignment.products;

-- Q13: Customers who purchased products with price > 1000.
SELECT DISTINCT
  c.customer_id,
  c.first_name,
  c.last_name
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
JOIN assignment.products p
  ON p.product_id = s.product_id
WHERE p.price > 1000;

-- Q14: Product name and total sales amount per product.
SELECT
  p.product_id,
  p.product_name,
  SUM(s.total_amount) AS total_sales_amount
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

-- Q15: Total amount spent by each customer.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(s.total_amount) AS total_spent
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q16: Customer name, product name, quantity sold.
SELECT
  c.first_name,
  c.last_name,
  p.product_name,
  s.quantity_sold
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
JOIN assignment.products p
  ON p.product_id = s.product_id;

-- Q17: Self-join Customers to find pairs with same membership status.
SELECT
  c1.customer_id AS customer_id_1,
  c1.first_name  AS first_name_1,
  c1.last_name   AS last_name_1,
  c2.customer_id AS customer_id_2,
  c2.first_name  AS first_name_2,
  c2.last_name   AS last_name_2,
  c1.membership_status
FROM assignment.customers c1
JOIN assignment.customers c2
  ON c1.membership_status = c2.membership_status
 AND c1.customer_id < c2.customer_id;

-- Q18: Total number of sales for each product.
SELECT
  p.product_id,
  p.product_name,
  COUNT(s.sale_id) AS sales_count
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

-- Q19: Products where stock quantity < 10.
SELECT *
FROM assignment.products
WHERE stock_quantity < 10;

-- Q20: Products with total sales quantity > 5.
SELECT
  p.product_id,
  p.product_name,
  SUM(s.quantity_sold) AS total_quantity_sold
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(s.quantity_sold) > 5;


-- -------------------------------------------
-- Q21–30: Category filters and date logic
-- -------------------------------------------

-- Q21: Customers who bought Electronics or Appliances.
SELECT DISTINCT
  c.customer_id,
  c.first_name,
  c.last_name
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
JOIN assignment.products p
  ON p.product_id = s.product_id
WHERE p.category IN ('Electronics', 'Appliances');

-- Q22: Total sales amount per product (grouped by name).
SELECT
  p.product_name,
  SUM(s.total_amount) AS total_sales_amount
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_name;

-- Q23: Customers who made a purchase in 2023.
SELECT DISTINCT
  c.customer_id,
  c.first_name,
  c.last_name
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM s.sale_date) = 2023;

-- Q24: Customers with the highest total sales in 2023.
WITH customer_totals AS (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spent_2023
  FROM assignment.customers c
  JOIN assignment.sales s
    ON s.customer_id = c.customer_id
  WHERE EXTRACT(YEAR FROM s.sale_date) = 2023
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_totals
WHERE total_spent_2023 = (
  SELECT MAX(total_spent_2023) FROM customer_totals
);

-- Q25: Most expensive product sold (by product price).
SELECT DISTINCT p.product_id, p.product_name, p.price
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
WHERE p.price = (
  SELECT MAX(price)
  FROM assignment.products p2
  JOIN assignment.sales s2
    ON s2.product_id = p2.product_id
);

-- Q26: Number of customers with any single sale > 500.
SELECT COUNT(DISTINCT s.customer_id) AS customer_count
FROM assignment.sales s
WHERE s.total_amount > 500;

-- Q27: Total number of sales made by 'Gold' customers.
SELECT COUNT(*) AS gold_sales_count
FROM assignment.sales s
JOIN assignment.customers c
  ON c.customer_id = s.customer_id
WHERE c.membership_status = 'Gold';

-- Q28: Products with low stock (< 10) using Inventory.
SELECT
  p.product_id,
  p.product_name,
  i.stock_quantity
FROM assignment.products p
JOIN assignment.inventory i
  ON i.product_id = p.product_id
WHERE i.stock_quantity < 10;

-- Q29: Customers who purchased more than 5 units (sum of quantity).
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(s.quantity_sold) AS total_quantity
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(s.quantity_sold) > 5;

-- Q30: Average quantity sold per product.
SELECT
  product_id,
  AVG(quantity_sold) AS avg_quantity_sold
FROM assignment.sales
GROUP BY product_id;


-- -------------------------------------------
-- Q31–40: Monthly counts and stock/sales
-- -------------------------------------------

-- Q31: Number of sales in December 2023.
SELECT COUNT(*) AS december_2023_sales
FROM assignment.sales
WHERE sale_date >= DATE '2023-12-01'
  AND sale_date <  DATE '2024-01-01';

-- Q32: Total amount spent by each customer in 2023, descending.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(s.total_amount) AS total_spent_2023
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM s.sale_date) = 2023
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent_2023 DESC;

-- Q33: Products sold but with less than 5 units left in stock.
SELECT DISTINCT
  p.product_id,
  p.product_name,
  i.stock_quantity
FROM assignment.products p
JOIN assignment.inventory i
  ON i.product_id = p.product_id
JOIN assignment.sales s
  ON s.product_id = p.product_id
WHERE i.stock_quantity < 5;

-- Q34: Total sales per product, ordered by highest sales.
SELECT
  p.product_id,
  p.product_name,
  SUM(s.total_amount) AS total_sales_amount
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales_amount DESC;

-- Q35: Customers who bought products within 7 days of registration.
SELECT DISTINCT
  c.customer_id,
  c.first_name,
  c.last_name
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
WHERE s.sale_date BETWEEN c.registration_date
                      AND c.registration_date + INTERVAL '7 days';

-- Q36: Sales for products priced between 100 and 500.
SELECT
  s.sale_id,
  s.customer_id,
  s.product_id,
  p.product_name,
  p.price,
  s.quantity_sold,
  s.total_amount
FROM assignment.sales s
JOIN assignment.products p
  ON p.product_id = s.product_id
WHERE p.price BETWEEN 100 AND 500;

-- Q37: Most frequent customer (by number of sales rows).
WITH customer_counts AS (
  SELECT
    customer_id,
    COUNT(*) AS sales_count
  FROM assignment.sales
  GROUP BY customer_id
)
SELECT *
FROM customer_counts
WHERE sales_count = (
  SELECT MAX(sales_count) FROM customer_counts
);

-- Q38: Total quantity of products sold per customer.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(s.quantity_sold) AS total_quantity
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q39: Products with highest and lowest stock, together.
WITH extremes AS (
  SELECT
    product_id,
    product_name,
    stock_quantity,
    RANK() OVER (ORDER BY stock_quantity DESC) AS r_max,
    RANK() OVER (ORDER BY stock_quantity ASC)  AS r_min
  FROM assignment.products
)
SELECT product_id, product_name, stock_quantity
FROM extremes
WHERE r_max = 1 OR r_min = 1;

-- Q40: Products whose names contain 'Phone' and their total sales.
SELECT
  p.product_id,
  p.product_name,
  SUM(s.total_amount) AS total_sales_amount
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
WHERE p.product_name ILIKE '%phone%'
GROUP BY p.product_id, p.product_name;


-- -------------------------------------------
-- Q41–50: Joins, categories, 2023 focus
-- -------------------------------------------

-- Q41: Gold customers – total sales amount and product names.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  p.product_name,
  SUM(s.total_amount) AS total_sales_amount
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
JOIN assignment.products p
  ON p.product_id = s.product_id
WHERE c.membership_status = 'Gold'
GROUP BY c.customer_id, c.first_name, c.last_name, p.product_name;

-- Q42: Total sales by product category.
SELECT
  p.category,
  SUM(s.total_amount) AS total_sales_amount
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.category;

-- Q43: Total sales per product, grouped by month and year.
SELECT
  p.product_id,
  p.product_name,
  EXTRACT(YEAR  FROM s.sale_date) AS sale_year,
  EXTRACT(MONTH FROM s.sale_date) AS sale_month,
  SUM(s.total_amount) AS total_sales_amount
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id,
         p.product_name,
         EXTRACT(YEAR  FROM s.sale_date),
         EXTRACT(MONTH FROM s.sale_date)
ORDER BY p.product_id, sale_year, sale_month;

-- Q44: Products that have been sold but still have stock remaining.
SELECT DISTINCT
  p.product_id,
  p.product_name,
  i.stock_quantity
FROM assignment.products p
JOIN assignment.inventory i
  ON i.product_id = p.product_id
JOIN assignment.sales s
  ON s.product_id = p.product_id
WHERE i.stock_quantity > 0;

-- Q45: Top 5 customers by total purchases.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(s.total_amount) AS total_spent
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- Q46: Total number of unique products sold in 2023.
SELECT COUNT(DISTINCT s.product_id) AS unique_products_sold_2023
FROM assignment.sales s
WHERE EXTRACT(YEAR FROM s.sale_date) = 2023;

-- Q47: Products not sold in the last 6 months.
SELECT p.*
FROM assignment.products p
WHERE NOT EXISTS (
  SELECT 1
  FROM assignment.sales s
  WHERE s.product_id = p.product_id
    AND s.sale_date >= CURRENT_DATE - INTERVAL '6 months'
);

-- Q48: Products price 200–800, total quantity sold per product.
SELECT
  p.product_id,
  p.product_name,
  p.price,
  SUM(s.quantity_sold) AS total_quantity_sold
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
WHERE p.price BETWEEN 200 AND 800
GROUP BY p.product_id, p.product_name, p.price;

-- Q49: Customers who spent the most money in 2023.
WITH customer_totals AS (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spent_2023
  FROM assignment.customers c
  JOIN assignment.sales s
    ON s.customer_id = c.customer_id
  WHERE EXTRACT(YEAR FROM s.sale_date) = 2023
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_totals
WHERE total_spent_2023 = (
  SELECT MAX(total_spent_2023) FROM customer_totals
);

-- Q50: Products sold more than 100 units and price > 200.
SELECT
  p.product_id,
  p.product_name,
  p.price,
  SUM(s.quantity_sold) AS total_quantity_sold
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
WHERE p.price > 200
GROUP BY p.product_id, p.product_name, p.price
HAVING SUM(s.quantity_sold) > 100;


-- -------------------------------------------
-- Q51–60: Subquery questions
-- -------------------------------------------

-- Q51: Customers who spent more than average spending across all customers.
WITH per_customer AS (
  SELECT
    customer_id,
    SUM(total_amount) AS total_spent
  FROM assignment.sales
  GROUP BY customer_id
), avg_spent AS (
  SELECT AVG(total_spent) AS avg_total_spent
  FROM per_customer
)
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  pc.total_spent
FROM per_customer pc
JOIN assignment.customers c
  ON c.customer_id = pc.customer_id
JOIN avg_spent a
  ON pc.total_spent > a.avg_total_spent;

-- Q52: Products priced higher than average price.
SELECT *
FROM assignment.products p
WHERE p.price > (
  SELECT AVG(price)
  FROM assignment.products
);

-- Q53: Customers who have never made a purchase.
SELECT *
FROM assignment.customers c
WHERE NOT EXISTS (
  SELECT 1
  FROM assignment.sales s
  WHERE s.customer_id = c.customer_id
);

-- Q54: Products that have never been sold.
SELECT *
FROM assignment.products p
WHERE NOT EXISTS (
  SELECT 1
  FROM assignment.sales s
  WHERE s.product_id = p.product_id
);

-- Q55: Customer who made the single most expensive purchase.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  s.sale_id,
  s.total_amount
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
WHERE s.total_amount = (
  SELECT MAX(total_amount)
  FROM assignment.sales
);

-- Q56: Products whose total sales > average total sales across products.
WITH product_totals AS (
  SELECT
    product_id,
    SUM(total_amount) AS total_sales
  FROM assignment.sales
  GROUP BY product_id
), avg_sales AS (
  SELECT AVG(total_sales) AS avg_total_sales
  FROM product_totals
)
SELECT
  p.product_id,
  p.product_name,
  pt.total_sales
FROM product_totals pt
JOIN avg_sales a
  ON pt.total_sales > a.avg_total_sales
JOIN assignment.products p
  ON p.product_id = pt.product_id;

-- Q57: Customers registered earlier than average registration date.
SELECT *
FROM assignment.customers c
WHERE c.registration_date < (
  SELECT TO_TIMESTAMP(
           AVG(EXTRACT(EPOCH FROM registration_date))
         )::DATE
  FROM assignment.customers
);

-- Q58: Products priced higher than average within their category.
SELECT *
FROM assignment.products p
WHERE p.price > (
  SELECT AVG(p2.price)
  FROM assignment.products p2
  WHERE p2.category = p.category
);

-- Q59: Customers who have spent more than customer with ID = 10.
WITH customer_10 AS (
  SELECT COALESCE(SUM(total_amount), 0) AS total_spent_10
  FROM assignment.sales
  WHERE customer_id = 10
)
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(s.total_amount) AS total_spent
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(s.total_amount) > (
  SELECT total_spent_10 FROM customer_10
);

-- Q60: Products whose total quantity sold > overall average quantity sold per product.
WITH product_totals AS (
  SELECT
    product_id,
    SUM(quantity_sold) AS total_quantity
  FROM assignment.sales
  GROUP BY product_id
), avg_q AS (
  SELECT AVG(total_quantity) AS avg_quantity
  FROM product_totals
)
SELECT *
FROM product_totals pt
JOIN avg_q a
  ON pt.total_quantity > a.avg_quantity;


-- -------------------------------------------
-- Q61–70: CTE questions
-- -------------------------------------------

-- Q61: CTE total amount spent per customer, then top 5.
WITH customer_totals AS (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spent
  FROM assignment.customers c
  JOIN assignment.sales s
    ON s.customer_id = c.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_totals
ORDER BY total_spent DESC
LIMIT 5;

-- Q62: CTE total quantity sold per product, then top 3.
WITH product_totals AS (
  SELECT
    p.product_id,
    p.product_name,
    SUM(s.quantity_sold) AS total_quantity
  FROM assignment.products p
  JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.product_id, p.product_name
)
SELECT *
FROM product_totals
ORDER BY total_quantity DESC
LIMIT 3;

-- Q63: CTE total sales per category, then highest revenue category.
WITH category_totals AS (
  SELECT
    p.category,
    SUM(s.total_amount) AS total_revenue
  FROM assignment.products p
  JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.category
)
SELECT *
FROM category_totals
WHERE total_revenue = (
  SELECT MAX(total_revenue) FROM category_totals
);

-- Q64: CTE purchases per customer, then those with > 2 purchases.
WITH purchase_counts AS (
  SELECT
    customer_id,
    COUNT(*) AS purchase_count
  FROM assignment.sales
  GROUP BY customer_id
)
SELECT
  pc.customer_id,
  c.first_name,
  c.last_name,
  pc.purchase_count
FROM purchase_counts pc
JOIN assignment.customers c
  ON c.customer_id = pc.customer_id
WHERE pc.purchase_count > 2;

-- Q65: CTE total quantity sold per product, then products > average quantity.
WITH product_totals AS (
  SELECT
    product_id,
    SUM(quantity_sold) AS total_quantity
  FROM assignment.sales
  GROUP BY product_id
), avg_q AS (
  SELECT AVG(total_quantity) AS avg_quantity
  FROM product_totals
)
SELECT *
FROM product_totals pt
JOIN avg_q a
  ON pt.total_quantity > a.avg_quantity;

-- Q66: CTE total spending per customer, then customers > average spending.
WITH customer_totals AS (
  SELECT
    customer_id,
    SUM(total_amount) AS total_spent
  FROM assignment.sales
  GROUP BY customer_id
), avg_s AS (
  SELECT AVG(total_spent) AS avg_spent
  FROM customer_totals
)
SELECT *
FROM customer_totals ct
JOIN avg_s a
  ON ct.total_spent > a.avg_spent;

-- Q67: CTE total revenue per product, ordered highest to lowest.
WITH product_revenue AS (
  SELECT
    p.product_id,
    p.product_name,
    SUM(s.total_amount) AS total_revenue
  FROM assignment.products p
  JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.product_id, p.product_name
)
SELECT *
FROM product_revenue
ORDER BY total_revenue DESC;

-- Q68: CTE monthly sales totals, then month with highest revenue.
WITH monthly_totals AS (
  SELECT
    DATE_TRUNC('month', sale_date) AS month_start,
    SUM(total_amount) AS total_revenue
  FROM assignment.sales
  GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT *
FROM monthly_totals
WHERE total_revenue = (
  SELECT MAX(total_revenue) FROM monthly_totals
);

-- Q69: CTE number of unique customers per product, then products with > 3 customers.
WITH product_customer_counts AS (
  SELECT
    product_id,
    COUNT(DISTINCT customer_id) AS unique_customer_count
  FROM assignment.sales
  GROUP BY product_id
)
SELECT *
FROM product_customer_counts
WHERE unique_customer_count > 3;

-- Q70: CTE total quantity sold per product, then products < average quantity.
WITH product_totals AS (
  SELECT
    product_id,
    SUM(quantity_sold) AS total_quantity
  FROM assignment.sales
  GROUP BY product_id
), avg_q AS (
  SELECT AVG(total_quantity) AS avg_quantity
  FROM product_totals
)
SELECT *
FROM product_totals pt
JOIN avg_q a
  ON pt.total_quantity < a.avg_quantity;


-- -------------------------------------------
-- Q71–80: Window-function questions
-- -------------------------------------------

-- Q71: Rank customers by total amount spent.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(s.total_amount) AS total_spent,
  RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS spend_rank
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q72: Rank products by total quantity sold.
SELECT
  p.product_id,
  p.product_name,
  SUM(s.quantity_sold) AS total_quantity,
  RANK() OVER (ORDER BY SUM(s.quantity_sold) DESC) AS quantity_rank
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

-- Q73: 3rd highest spending customer.
WITH ranked AS (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS rnk
  FROM assignment.customers c
  JOIN assignment.sales s
    ON s.customer_id = c.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM ranked
WHERE rnk = 3;

-- Q74: 2nd most expensive product by price.
WITH ranked AS (
  SELECT
    p.product_id,
    p.product_name,
    p.price,
    RANK() OVER (ORDER BY p.price DESC) AS price_rank
  FROM assignment.products p
)
SELECT *
FROM ranked
WHERE price_rank = 2;

-- Q75: Rank products within each category by price.
SELECT
  p.category,
  p.product_id,
  p.product_name,
  p.price,
  RANK() OVER (
    PARTITION BY p.category
    ORDER BY p.price DESC
  ) AS category_price_rank
FROM assignment.products p;

-- Q76: Rank customers by number of purchases.
WITH counts AS (
  SELECT
    customer_id,
    COUNT(*) AS purchase_count
  FROM assignment.sales
  GROUP BY customer_id
)
SELECT
  c.customer_id,
  cu.first_name,
  cu.last_name,
  c.purchase_count,
  RANK() OVER (ORDER BY c.purchase_count DESC) AS purchase_rank
FROM counts c
JOIN assignment.customers cu
  ON cu.customer_id = c.customer_id;

-- Q77: Running total of sales amounts ordered by sale_date.
SELECT
  sale_id,
  customer_id,
  product_id,
  sale_date,
  total_amount,
  SUM(total_amount) OVER (
    ORDER BY sale_date, sale_id
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM assignment.sales
ORDER BY sale_date, sale_id;

-- Q78: Previous sale amount for each sale.
SELECT
  sale_id,
  customer_id,
  product_id,
  sale_date,
  total_amount,
  LAG(total_amount) OVER (ORDER BY sale_date, sale_id) AS prev_total_amount
FROM assignment.sales
ORDER BY sale_date, sale_id;

-- Q79: Next sale amount for each sale.
SELECT
  sale_id,
  customer_id,
  product_id,
  sale_date,
  total_amount,
  LEAD(total_amount) OVER (ORDER BY sale_date, sale_id) AS next_total_amount
FROM assignment.sales
ORDER BY sale_date, sale_id;

-- Q80: Divide customers into 4 groups based on total spending (quartiles).
WITH totals AS (
  SELECT
    customer_id,
    SUM(total_amount) AS total_spent
  FROM assignment.sales
  GROUP BY customer_id
)
SELECT
  t.customer_id,
  c.first_name,
  c.last_name,
  t.total_spent,
  NTILE(4) OVER (ORDER BY t.total_spent DESC) AS spending_quartile
FROM totals t
JOIN assignment.customers c
  ON c.customer_id = t.customer_id;


-- -------------------------------------------
-- Q81–90: Advanced analytical queries
-- -------------------------------------------

-- Q81: Customers who bought products in more than one category.
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  COUNT(DISTINCT p.category) AS category_count
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
JOIN assignment.products p
  ON p.product_id = s.product_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT p.category) > 1;

-- Q82: Customers who purchased within 7 days of registering.
SELECT DISTINCT
  c.customer_id,
  c.first_name,
  c.last_name
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
WHERE s.sale_date BETWEEN c.registration_date
                      AND c.registration_date + INTERVAL '7 days';

-- Q83: Products with stock lower than average stock.
SELECT *
FROM assignment.products p
WHERE p.stock_quantity < (
  SELECT AVG(stock_quantity)
  FROM assignment.products
);

-- Q84: Customers who purchased the same product more than once (by quantity).
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  s.product_id,
  SUM(s.quantity_sold) AS total_quantity
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, s.product_id
HAVING SUM(s.quantity_sold) > 1;

-- Q85: Product categories with highest total revenue.
WITH category_totals AS (
  SELECT
    p.category,
    SUM(s.total_amount) AS total_revenue
  FROM assignment.products p
  JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.category
)
SELECT *
FROM category_totals
WHERE total_revenue = (
  SELECT MAX(total_revenue) FROM category_totals
);

-- Q86: Products among top 3 most sold (by quantity).
WITH product_totals AS (
  SELECT
    p.product_id,
    p.product_name,
    SUM(s.quantity_sold) AS total_quantity,
    RANK() OVER (ORDER BY SUM(s.quantity_sold) DESC) AS rnk
  FROM assignment.products p
  JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.product_id, p.product_name
)
SELECT *
FROM product_totals
WHERE rnk <= 3;

-- Q87: Customers who purchased the most expensive product.
WITH max_price AS (
  SELECT MAX(price) AS max_price
  FROM assignment.products
)
SELECT DISTINCT
  c.customer_id,
  c.first_name,
  c.last_name
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
JOIN assignment.products p
  ON p.product_id = s.product_id
JOIN max_price m
  ON p.price = m.max_price;

-- Q88: Products purchased by the highest number of unique customers.
WITH product_customers AS (
  SELECT
    product_id,
    COUNT(DISTINCT customer_id) AS unique_customers
  FROM assignment.sales
  GROUP BY product_id
)
SELECT pc.*
FROM product_customers pc
WHERE pc.unique_customers = (
  SELECT MAX(unique_customers) FROM product_customers
);

-- Q89: Customers with at least one purchase above average sale amount.
SELECT DISTINCT
  c.customer_id,
  c.first_name,
  c.last_name
FROM assignment.customers c
JOIN assignment.sales s
  ON s.customer_id = c.customer_id
WHERE s.total_amount > (
  SELECT AVG(total_amount)
  FROM assignment.sales
);

-- Q90: Customers whose total quantity purchased > average quantity per customer.
WITH customer_quantities AS (
  SELECT
    customer_id,
    SUM(quantity_sold) AS total_quantity
  FROM assignment.sales
  GROUP BY customer_id
), avg_q AS (
  SELECT AVG(total_quantity) AS avg_quantity
  FROM customer_quantities
)
SELECT
  cq.customer_id,
  c.first_name,
  c.last_name,
  cq.total_quantity
FROM customer_quantities cq
JOIN avg_q a
  ON cq.total_quantity > a.avg_quantity
JOIN assignment.customers c
  ON c.customer_id = cq.customer_id;


-- -------------------------------------------
-- Q91–100: Advanced window + analytics
-- -------------------------------------------

-- Q91: Customers in top 10% of spending.
WITH totals AS (
  SELECT
    customer_id,
    SUM(total_amount) AS total_spent
  FROM assignment.sales
  GROUP BY customer_id
), ranked AS (
  SELECT
    customer_id,
    total_spent,
    NTILE(10) OVER (ORDER BY total_spent DESC) AS decile
  FROM totals
)
SELECT
  r.customer_id,
  c.first_name,
  c.last_name,
  r.total_spent,
  r.decile
FROM ranked r
JOIN assignment.customers c
  ON c.customer_id = r.customer_id
WHERE r.decile = 1;

-- Q92: Products contributing to top 50% of total revenue.
WITH product_revenue AS (
  SELECT
    product_id,
    SUM(total_amount) AS total_revenue
  FROM assignment.sales
  GROUP BY product_id
), ordered AS (
  SELECT
    product_id,
    total_revenue,
    SUM(total_revenue) OVER (ORDER BY total_revenue DESC) AS running_revenue,
    SUM(total_revenue) OVER () AS grand_total
  FROM product_revenue
)
SELECT
  o.product_id,
  p.product_name,
  o.total_revenue,
  o.running_revenue,
  o.grand_total
FROM ordered o
JOIN assignment.products p
  ON p.product_id = o.product_id
WHERE o.running_revenue <= 0.5 * o.grand_total;

-- Q93: Customers who made purchases in consecutive months.
WITH customer_months AS (
  SELECT DISTINCT
    customer_id,
    DATE_TRUNC('month', sale_date) AS month_start
  FROM assignment.sales
), with_lag AS (
  SELECT
    customer_id,
    month_start,
    LAG(month_start) OVER (
      PARTITION BY customer_id
      ORDER BY month_start
    ) AS prev_month
  FROM customer_months
)
SELECT DISTINCT customer_id
FROM with_lag
WHERE prev_month IS NOT NULL
  AND month_start = prev_month + INTERVAL '1 month';

-- Q94: Products with largest difference between stock and total sold.
WITH sold AS (
  SELECT
    product_id,
    SUM(quantity_sold) AS total_sold
  FROM assignment.sales
  GROUP BY product_id
)
SELECT
  p.product_id,
  p.product_name,
  p.stock_quantity,
  COALESCE(s.total_sold, 0) AS total_sold,
  (p.stock_quantity - COALESCE(s.total_sold, 0)) AS stock_minus_sold
FROM assignment.products p
LEFT JOIN sold s
  ON s.product_id = p.product_id
ORDER BY ABS(stock_minus_sold) DESC;

-- Q95: Customers whose spending > average spending of their membership tier.
WITH customer_totals AS (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.membership_status,
    COALESCE(SUM(s.total_amount), 0) AS total_spent
  FROM assignment.customers c
  LEFT JOIN assignment.sales s
    ON s.customer_id = c.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name, c.membership_status
), tier_avgs AS (
  SELECT
    membership_status,
    AVG(total_spent) AS avg_spent
  FROM customer_totals
  GROUP BY membership_status
)
SELECT ct.*
FROM customer_totals ct
JOIN tier_avgs ta
  ON ta.membership_status = ct.membership_status
WHERE ct.total_spent > ta.avg_spent;

-- Q96: Products whose sales > average sales in their category.
WITH product_totals AS (
  SELECT
    p.product_id,
    p.product_name,
    p.category,
    COALESCE(SUM(s.total_amount), 0) AS total_sales
  FROM assignment.products p
  LEFT JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.product_id, p.product_name, p.category
), category_avgs AS (
  SELECT
    category,
    AVG(total_sales) AS avg_sales
  FROM product_totals
  GROUP BY category
)
SELECT pt.*
FROM product_totals pt
JOIN category_avgs ca
  ON ca.category = pt.category
WHERE pt.total_sales > ca.avg_sales;

-- Q97: Customer whose single largest purchase is biggest relative to own total.
WITH per_sale AS (
  SELECT
    customer_id,
    sale_id,
    total_amount
  FROM assignment.sales
), totals AS (
  SELECT
    customer_id,
    SUM(total_amount) AS total_spent
  FROM assignment.sales
  GROUP BY customer_id
), ratios AS (
  SELECT
    ps.customer_id,
    ps.sale_id,
    ps.total_amount,
    t.total_spent,
    ps.total_amount / NULLIF(t.total_spent, 0) AS ratio
  FROM per_sale ps
  JOIN totals t
    ON t.customer_id = ps.customer_id
)
SELECT
  r.customer_id,
  c.first_name,
  c.last_name,
  r.sale_id,
  r.total_amount,
  r.total_spent,
  r.ratio
FROM ratios r
JOIN assignment.customers c
  ON c.customer_id = r.customer_id
WHERE r.ratio = (
  SELECT MAX(ratio) FROM ratios
);

-- Q98: Products in top 3 most sold within each category.
WITH product_totals AS (
  SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(s.quantity_sold) AS total_quantity,
    RANK() OVER (
      PARTITION BY p.category
      ORDER BY SUM(s.quantity_sold) DESC
    ) AS rnk
  FROM assignment.products p
  JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.product_id, p.product_name, p.category
)
SELECT *
FROM product_totals
WHERE rnk <= 3;

-- Q99: Customers tied for highest total spending.
WITH totals AS (
  SELECT
    customer_id,
    SUM(total_amount) AS total_spent
  FROM assignment.sales
  GROUP BY customer_id
)
SELECT
  t.customer_id,
  c.first_name,
  c.last_name,
  t.total_spent
FROM totals t
JOIN assignment.customers c
  ON c.customer_id = t.customer_id
WHERE t.total_spent = (
  SELECT MAX(total_spent) FROM totals
);

-- Q100: Products that generated sales every year present in the dataset.
WITH years AS (
  SELECT DISTINCT EXTRACT(YEAR FROM sale_date)::int AS year
  FROM assignment.sales
), product_years AS (
  SELECT DISTINCT
    product_id,
    EXTRACT(YEAR FROM sale_date)::int AS year
  FROM assignment.sales
)
SELECT
  p.product_id,
  p.product_name
FROM assignment.products p
JOIN product_years py
  ON py.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT py.year) = (
  SELECT COUNT(*) FROM years
);


-- -------------------------------------------
-- Q101–115: CASE, dates, COALESCE, cleanup
-- -------------------------------------------

-- Note: These UPDATEs assume some extra columns exist (price_category, customer_level, stock_status).

-- Q101: Update products: assign price_category (Expensive/Moderate/Affordable).
ALTER TABLE assignment.products
  ADD COLUMN IF NOT EXISTS price_category TEXT;

UPDATE assignment.products
SET price_category = CASE
  WHEN price > 1000 THEN 'Expensive'
  WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
  ELSE 'Affordable'
END;

-- Q102: Update customers: assign customer_level based on total spending.
ALTER TABLE assignment.customers
  ADD COLUMN IF NOT EXISTS customer_level TEXT;

WITH totals AS (
  SELECT
    customer_id,
    SUM(total_amount) AS total_spent
  FROM assignment.sales
  GROUP BY customer_id
)
UPDATE assignment.customers c
SET customer_level = CASE
  WHEN COALESCE(t.total_spent, 0) > 20000 THEN 'VIP'
  WHEN COALESCE(t.total_spent, 0) BETWEEN 10000 AND 20000 THEN 'Regular'
  ELSE 'New'
END
FROM totals t
WHERE t.customer_id = c.customer_id;

UPDATE assignment.customers
SET customer_level = 'New'
WHERE customer_level IS NULL;

-- Q103: Update products: assign stock_status (Low/Sufficient).
ALTER TABLE assignment.products
  ADD COLUMN IF NOT EXISTS stock_status TEXT;

UPDATE assignment.products
SET stock_status = CASE
  WHEN stock_quantity < 10 THEN 'Low Stock'
  ELSE 'Sufficient Stock'
END;

-- Q104: Show each customer’s registration year.
SELECT
  customer_id,
  first_name,
  last_name,
  EXTRACT(YEAR FROM registration_date) AS registration_year
FROM assignment.customers;

-- Q105: Count how many customers registered in each year.
SELECT
  EXTRACT(YEAR FROM registration_date) AS registration_year,
  COUNT(*) AS customer_count
FROM assignment.customers
GROUP BY EXTRACT(YEAR FROM registration_date)
ORDER BY registration_year;

-- Q106: Total sales amount for each month.
SELECT
  DATE_TRUNC('month', sale_date) AS month_start,
  SUM(total_amount) AS total_sales
FROM assignment.sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month_start;

-- Q107: All sales made in 2023.
SELECT *
FROM assignment.sales
WHERE EXTRACT(YEAR FROM sale_date) = 2023;

-- Q108: Total sales amount for each year.
SELECT
  EXTRACT(YEAR FROM sale_date) AS sale_year,
  SUM(total_amount) AS total_sales
FROM assignment.sales
GROUP BY EXTRACT(YEAR FROM sale_date)
ORDER BY sale_year;

-- Q109: Number of days each customer has been registered.
SELECT
  customer_id,
  first_name,
  last_name,
  CURRENT_DATE - registration_date AS days_registered
FROM assignment.customers;

-- Q110: Display each sale plus year and month from sale_date.
SELECT
  sale_id,
  customer_id,
  product_id,
  sale_date,
  EXTRACT(YEAR  FROM sale_date) AS sale_year,
  EXTRACT(MONTH FROM sale_date) AS sale_month,
  total_amount
FROM assignment.sales;

-- Q111: Customer email, replace NULL with 'No Email Provided'.
SELECT
  customer_id,
  first_name,
  last_name,
  COALESCE(email, 'No Email Provided') AS safe_email
FROM assignment.customers;

-- Q112: Customers without an email address.
SELECT *
FROM assignment.customers
WHERE email IS NULL OR email = '';

-- Q113: Products never sold (subquery).
SELECT *
FROM assignment.products p
WHERE NOT EXISTS (
  SELECT 1
  FROM assignment.sales s
  WHERE s.product_id = p.product_id
);

-- Q114: Customers who have not made any purchases (subquery).
SELECT *
FROM assignment.customers c
WHERE NOT EXISTS (
  SELECT 1
  FROM assignment.sales s
  WHERE s.customer_id = c.customer_id
);

-- Q115: Re-assign price_category (Premium/Standard/Budget) via CASE.
UPDATE assignment.products
SET price_category = CASE
  WHEN price > 1000 THEN 'Premium'
  WHEN price BETWEEN 300 AND 1000 THEN 'Standard'
  ELSE 'Budget'
END;


-- -------------------------------------------
-- Q116–123: Functions, procedures, indexes, transactions
-- -------------------------------------------

-- Q116: Function returning products over a given total revenue.
CREATE OR REPLACE FUNCTION assignment.products_over_revenue(min_revenue numeric)
RETURNS TABLE (
  product_id    int,
  product_name  text,
  total_revenue numeric
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    p.product_id,
    p.product_name,
    SUM(s.total_amount) AS total_revenue
  FROM assignment.products p
  JOIN assignment.sales s
    ON s.product_id = p.product_id
  GROUP BY p.product_id, p.product_name
  HAVING SUM(s.total_amount) > min_revenue;
END;
$$ LANGUAGE plpgsql;

-- Q117: Function returning total amount spent by a given customer_id.
CREATE OR REPLACE FUNCTION assignment.total_spent_by_customer(p_customer_id int)
RETURNS numeric AS $$
DECLARE
  v_total numeric;
BEGIN
  SELECT COALESCE(SUM(total_amount), 0)
  INTO v_total
  FROM assignment.sales
  WHERE customer_id = p_customer_id;

  RETURN v_total;
END;
$$ LANGUAGE plpgsql;

-- Q118: Function returning number of orders between two dates.
CREATE OR REPLACE FUNCTION assignment.orders_in_date_range(p_start date, p_end date)
RETURNS int AS $$
DECLARE
  v_count int;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM assignment.sales
  WHERE sale_date >= p_start
    AND sale_date <= p_end;

  RETURN v_count;
END;
$$ LANGUAGE plpgsql;

-- Q119: Stored procedure inserting a new sale.
CREATE OR REPLACE PROCEDURE assignment.insert_sale(
  p_sale_id       int,
  p_customer_id   int,
  p_product_id    int,
  p_quantity_sold int,
  p_sale_date     date,
  p_total_amount  numeric
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO assignment.sales (
    sale_id, customer_id, product_id, quantity_sold, sale_date, total_amount
  ) VALUES (
    p_sale_id, p_customer_id, p_product_id, p_quantity_sold, p_sale_date, p_total_amount
  );
END;
$$;

-- Q120: Index on product_id in sales.
CREATE INDEX IF NOT EXISTS idx_sales_product_id
ON assignment.sales (product_id);

-- Q121: Index on registration_date in customers.
CREATE INDEX IF NOT EXISTS idx_customers_registration_date
ON assignment.customers (registration_date);

-- Q122: Transaction to insert a new sale and update stock.
BEGIN;

INSERT INTO assignment.sales (
  sale_id, customer_id, product_id, quantity_sold, sale_date, total_amount
) VALUES (
  1001, 1, 1, 2, CURRENT_DATE, 2 * 999.99
);

UPDATE assignment.products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 1;

COMMIT;

-- If something fails between BEGIN and COMMIT, issue:
-- ROLLBACK;

-- Q123: Transaction to update email and roll back if invalid (simple check).
BEGIN;

UPDATE assignment.customers
SET email = 'new_email@example.com'
WHERE customer_id = 1;

DO $$
DECLARE
  v_email text;
BEGIN
  SELECT email INTO v_email
  FROM assignment.customers
  WHERE customer_id = 1;

  IF POSITION('@' IN v_email) = 0 THEN
    RAISE EXCEPTION 'Invalid email';
  END IF;
END;
$$;

COMMIT;

-- If the DO block raises an exception, the transaction will be rolled back.


-- -------------------------------------------
-- Q124–130: Views, set operators, casting
-- -------------------------------------------

-- Q124: View: total revenue per product.
CREATE OR REPLACE VIEW assignment.v_product_revenue AS
SELECT
  p.product_id,
  p.product_name,
  SUM(s.total_amount) AS total_revenue
FROM assignment.products p
LEFT JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

-- Q125: View: each customer and total spending.
CREATE OR REPLACE VIEW assignment.v_customer_spending AS
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  COALESCE(SUM(s.total_amount), 0) AS total_spent
FROM assignment.customers c
LEFT JOIN assignment.sales s
  ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q126: UNION of all customer first names and product names.
SELECT first_name AS name
FROM assignment.customers
UNION
SELECT product_name AS name
FROM assignment.products;

-- Q127: INTERSECT of all customer IDs and IDs of customers who made purchases.
SELECT customer_id
FROM assignment.customers
INTERSECT
SELECT DISTINCT customer_id
FROM assignment.sales;

-- Q128: Anti-join: products that have never been sold (LEFT JOIN).
SELECT p.*
FROM assignment.products p
LEFT JOIN assignment.sales s
  ON s.product_id = p.product_id
WHERE s.product_id IS NULL;

-- Q129: Customers who have not made any purchases (NOT EXISTS).
SELECT *
FROM assignment.customers c
WHERE NOT EXISTS (
  SELECT 1
  FROM assignment.sales s
  WHERE s.customer_id = c.customer_id
);

-- Q130: Cast price to integer alongside original price.
SELECT
  product_id,
  product_name,
  price,
  CAST(price AS int) AS price_int
FROM assignment.products;


-- -------------------------------------------
-- Q131–139: Formatting, GROUP BY, data cleaning
-- -------------------------------------------

-- Q131: Convert registration_date to text 'YYYY-MM'.
SELECT
  customer_id,
  first_name,
  last_name,
  registration_date,
  TO_CHAR(registration_date, 'YYYY-MM') AS registration_year_month
FROM assignment.customers;

-- Q132: Fix GROUP BY error (must group by all non-aggregated columns and join Sales).
-- Original (incorrect):
-- SELECT product_id, product_name, SUM(total_amount) FROM sales GROUP BY product_id;
SELECT
  p.product_id,
  p.product_name,
  SUM(s.total_amount) AS total_amount
FROM assignment.products p
JOIN assignment.sales s
  ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

-- Q133: Fix incorrect use of WHERE with aggregate (use HAVING).
-- Original (incorrect):
-- SELECT product_id, SUM(total_amount) FROM sales WHERE SUM(total_amount) > 1000 GROUP BY product_id;
SELECT
  product_id,
  SUM(total_amount) AS total_amount
FROM assignment.sales
GROUP BY product_id
HAVING SUM(total_amount) > 1000;

-- Q134: Fix wrong join condition between sales and products.
-- Original (incorrect):
-- SELECT * FROM assignment.sales s JOIN assignment.products p ON s.customer_id = p.product_id;
SELECT *
FROM assignment.sales s
JOIN assignment.products p
  ON s.product_id = p.product_id;

-- Q135: Replace NULL email values with 'No Email Provided'.
UPDATE assignment.customers
SET email = 'No Email Provided'
WHERE email IS NULL;

-- Q136: Trim leading/trailing spaces from customer first names.
UPDATE assignment.customers
SET first_name = TRIM(first_name);

-- Q137: Convert all customer emails to lowercase.
UPDATE assignment.customers
SET email = LOWER(email)
WHERE email IS NOT NULL;

-- Q138: Replace empty strings in phone numbers with NULL.
UPDATE assignment.customers
SET phone_number = NULL
WHERE phone_number = '';

-- Q139: Extract the year from registration_date, handling NULLs gracefully.
SELECT
  customer_id,
  first_name,
  last_name,
  CASE
    WHEN registration_date IS NULL
      THEN NULL
    ELSE EXTRACT(YEAR FROM registration_date)::int
  END AS registration_year
FROM assignment.customers;


-- End of assignment script.