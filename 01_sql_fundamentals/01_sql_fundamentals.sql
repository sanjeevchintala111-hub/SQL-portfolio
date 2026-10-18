# Module 01 — SQL Fundamentals
**Database:** PostgreSQL  
**Table:** `ecommerce_orders`

## Part A — Retrieve Data

### 1. Display all columns from the table.
```sql
SELECT *
FROM ecommerce_orders;
```

### 2. Display only product names.
```sql
SELECT product_name
FROM ecommerce_orders;
```

### 3. Display order IDs, cities, and product names.
```sql
SELECT order_id, city, product_name
FROM ecommerce_orders;
```

### 4. Display the first 10 orders.
```sql
SELECT *
FROM ecommerce_orders
LIMIT 10;
```

### 5. Display all unique cities.
```sql
SELECT DISTINCT city
FROM ecommerce_orders;
```

## Part B — Filter Data

### 6. Find all orders from Chennai.
```sql
SELECT *
FROM ecommerce_orders
WHERE city = 'Chennai';
```

### 7. Find orders with a unit price above ₹1,000.
```sql
SELECT order_id, product_name, unit_price
FROM ecommerce_orders
WHERE unit_price > 1000;
```

### 8. Find orders with a quantity of at least 3.
```sql
SELECT *
FROM ecommerce_orders
WHERE quantity >= 3;
```

### 9. Find orders paid through UPI.
```sql
SELECT *
FROM ecommerce_orders
WHERE payment_method = 'UPI';
```

### 10. Find all clothing orders.
```sql
SELECT *
FROM ecommerce_orders
WHERE category = 'Clothing';
```

### 11. Find Chennai orders with a unit price above ₹1,000.
```sql
SELECT *
FROM ecommerce_orders
WHERE city = 'Chennai'
  AND unit_price > 1000;
```

### 12. Find orders from Chennai or Hyderabad.
```sql
SELECT *
FROM ecommerce_orders
WHERE city = 'Chennai'
   OR city = 'Hyderabad';
```

### 13. Exclude cancelled orders.
```sql
SELECT *
FROM ecommerce_orders
WHERE NOT (order_status = 'Cancelled');
```

### 14. Find orders from Chennai, Hyderabad, or Bengaluru using IN.
```sql
SELECT *
FROM ecommerce_orders
WHERE city IN ('Chennai', 'Hyderabad', 'Bengaluru');
```

### 15. Find products priced between ₹500 and ₹2,000.
```sql
SELECT product_name, unit_price
FROM ecommerce_orders
WHERE unit_price BETWEEN 500 AND 2000;
```

### 16. Find product names beginning with S using LIKE.
```sql
SELECT product_name
FROM ecommerce_orders
WHERE product_name LIKE 'S%';
```

### 17. Find product names containing "shampoo", ignoring case.
```sql
SELECT product_name
FROM ecommerce_orders
WHERE product_name ILIKE '%shampoo%';
```

### 18. Find orders with a missing product name.
```sql
SELECT *
FROM ecommerce_orders
WHERE product_name IS NULL;
```

### 19. Find orders with a non-missing product name.
```sql
SELECT *
FROM ecommerce_orders
WHERE product_name IS NOT NULL;
```

## Part C — Sort and Combine Filters

### 20. Sort orders by unit price, highest first.
```sql
SELECT product_name, unit_price
FROM ecommerce_orders
ORDER BY unit_price DESC;
```

### 21. Display the 10 cheapest products.
```sql
SELECT product_name, unit_price
FROM ecommerce_orders
ORDER BY unit_price ASC
LIMIT 10;
```

### 22. Find clothing orders in Chennai, newest first.
```sql
SELECT order_id, order_date, product_name, city
FROM ecommerce_orders
WHERE category = 'Clothing'
  AND city = 'Chennai'
ORDER BY order_date DESC;
```
