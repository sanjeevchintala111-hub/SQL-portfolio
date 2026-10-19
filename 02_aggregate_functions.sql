# Module 02 — Aggregate Functions and Grouping
**Database:** PostgreSQL  
**Table:** `ecommerce_orders`

## Part A — Aggregate Functions

### 1. Count the total number of orders.
```sql
SELECT COUNT(*) AS total_orders
FROM ecommerce_orders;
```

### 2. Calculate the total quantity of products ordered.
```sql
SELECT SUM(quantity) AS total_quantity
FROM ecommerce_orders;
```

### 3. Calculate the average unit price.
```sql
SELECT ROUND(AVG(unit_price), 2) AS average_unit_price
FROM ecommerce_orders;
```

### 4. Find the highest unit price.
```sql
SELECT MAX(unit_price) AS highest_unit_price
FROM ecommerce_orders;
```

### 5. Find the lowest unit price.
```sql
SELECT MIN(unit_price) AS lowest_unit_price
FROM ecommerce_orders;
```

### 6. Count the unique customers.
```sql
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_orders;
```

### 7. Calculate the total order value before discounts.
```sql
SELECT ROUND(SUM(unit_price * quantity), 2) AS total_order_value
FROM ecommerce_orders;
```

### 8. Calculate the average order quantity.
```sql
SELECT ROUND(AVG(quantity), 2) AS average_quantity
FROM ecommerce_orders;
```

## Part B — GROUP BY

### 9. Count orders by category.
```sql
SELECT category, COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY category;
```

### 10. Calculate total quantity ordered in each category.
```sql
SELECT category, SUM(quantity) AS total_quantity
FROM ecommerce_orders
GROUP BY category;
```

### 11. Calculate the average unit price for each category.
```sql
SELECT category, ROUND(AVG(unit_price), 2) AS average_price
FROM ecommerce_orders
GROUP BY category;
```

### 12. Find the highest-priced product in each category.
```sql
SELECT category, MAX(unit_price) AS highest_price
FROM ecommerce_orders
GROUP BY category;
```

### 13. Find the lowest-priced product in each category.
```sql
SELECT category, MIN(unit_price) AS lowest_price
FROM ecommerce_orders
GROUP BY category;
```

### 14. Count orders by city.
```sql
SELECT city, COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY city
ORDER BY total_orders DESC;
```

### 15. Calculate total product value by city.
```sql
SELECT city,
       ROUND(SUM(unit_price * quantity), 2) AS total_value
FROM ecommerce_orders
GROUP BY city
ORDER BY total_value DESC;
```

### 16. Count orders by payment method.
```sql
SELECT payment_method, COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY payment_method
ORDER BY total_orders DESC;
```

### 17. Calculate average quantity by payment method.
```sql
SELECT payment_method,
       ROUND(AVG(quantity), 2) AS average_quantity
FROM ecommerce_orders
GROUP BY payment_method;
```

### 18. Count orders by order status.
```sql
SELECT order_status, COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY order_status
ORDER BY total_orders DESC;
```

### 19. Calculate total quantity by sales channel.
```sql
SELECT sales_channel, SUM(quantity) AS total_quantity
FROM ecommerce_orders
GROUP BY sales_channel
ORDER BY total_quantity DESC;
```

### 20. Calculate total product value by category and city.
```sql
SELECT category, city,
       ROUND(SUM(unit_price * quantity), 2) AS total_value
FROM ecommerce_orders
GROUP BY category, city
ORDER BY category, total_value DESC;
```

## Part C — HAVING and Advanced Grouping

### 21. Find categories with more than 10 order rows.
```sql
SELECT category, COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY category
HAVING COUNT(*) > 10;
```

### 22. Find cities with total product value above ₹50,000.
```sql
SELECT city,
       ROUND(SUM(unit_price * quantity), 2) AS total_value
FROM ecommerce_orders
GROUP BY city
HAVING SUM(unit_price * quantity) > 50000;
```

### 23. Find categories with an average unit price above ₹1,000.
```sql
SELECT category,
       ROUND(AVG(unit_price), 2) AS average_price
FROM ecommerce_orders
GROUP BY category
HAVING AVG(unit_price) > 1000;
```

### 24. Count distinct products in each category.
```sql
SELECT category,
       COUNT(DISTINCT product_name) AS unique_products
FROM ecommerce_orders
GROUP BY category;
```

### 25. Calculate total product value by category, excluding cancelled orders.
```sql
SELECT category,
       ROUND(SUM(unit_price * quantity), 2) AS total_value
FROM ecommerce_orders
WHERE order_status <> 'Cancelled'
GROUP BY category
ORDER BY total_value DESC;
```
