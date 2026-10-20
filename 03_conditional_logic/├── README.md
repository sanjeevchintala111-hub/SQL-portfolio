# Module 03: Conditional Logic — PostgreSQL

## Part A: CASE WHEN

### 1. Classify products by price as High, Medium, or Low.

```sql
SELECT product_name, unit_price,
       CASE
           WHEN unit_price >= 5000 THEN 'High'
           WHEN unit_price >= 1000 THEN 'Medium'
           ELSE 'Low'
       END AS price_category
FROM ecommerce_orders;
```

**Explanation:** `CASE` assigns a category according to the price.

### 2. Classify orders by quantity as Bulk, Medium, or Small.

```sql
SELECT order_id, quantity,
       CASE
           WHEN quantity >= 5 THEN 'Bulk'
           WHEN quantity >= 2 THEN 'Medium'
           ELSE 'Small'
       END AS quantity_category
FROM ecommerce_orders;
```

**Explanation:** Groups orders according to their quantity.

### 3. Display readable order-status labels.

```sql
SELECT order_id, order_status,
       CASE
           WHEN order_status = 'Delivered' THEN 'Completed'
           WHEN order_status = 'Cancelled' THEN 'Unsuccessful'
           WHEN order_status = 'Processing' THEN 'In Progress'
           ELSE 'Other Status'
       END AS status_label
FROM ecommerce_orders;
```

**Explanation:** Converts status values into clearer labels.

### 4. Classify products as Expensive or Affordable.

```sql
SELECT product_name, unit_price,
       CASE
           WHEN unit_price >= 2000 THEN 'Expensive'
           ELSE 'Affordable'
       END AS price_label
FROM ecommerce_orders;
```

**Explanation:** Separates products using a price threshold of 2000.

### 5. Identify orders eligible for bulk review.

```sql
SELECT order_id, quantity,
       CASE
           WHEN quantity >= 10 THEN 'Bulk Eligible'
           ELSE 'Regular Order'
       END AS order_type
FROM ecommerce_orders;
```

**Explanation:** Identifies orders containing at least 10 units.

### 6. Classify orders by discount rate.

```sql
SELECT order_id, discount_rate,
       CASE
           WHEN COALESCE(discount_rate, 0) >= 0.30 THEN 'High Discount'
           WHEN COALESCE(discount_rate, 0) >= 0.10 THEN 'Medium Discount'
           WHEN COALESCE(discount_rate, 0) > 0 THEN 'Low Discount'
           ELSE 'No Discount'
       END AS discount_category
FROM ecommerce_orders;
```

**Explanation:** Classifies discounts. For example, `0.30` means 30%.

### 7. Classify cities into zones.

```sql
SELECT order_id, city,
       CASE
           WHEN city IN ('Chennai', 'Hyderabad', 'Bengaluru')
               THEN 'South Zone'
           ELSE 'Other Zone'
       END AS sales_zone
FROM ecommerce_orders;
```

**Explanation:** Groups the selected cities into one sales zone.

### 8. Classify order-line value.

```sql
SELECT order_id, product_name,
       unit_price * quantity AS original_value,
       CASE
           WHEN unit_price * quantity >= 10000 THEN 'High Value'
           WHEN unit_price * quantity >= 3000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS value_category
FROM ecommerce_orders;
```

**Explanation:** Calculates the pre-discount value and classifies it.

### 9. Group payment methods into categories.

```sql
SELECT order_id, payment_method,
       CASE
           WHEN payment_method = 'UPI' THEN 'Digital'
           WHEN payment_method IN ('Credit Card', 'Debit Card')
               THEN 'Card'
           WHEN payment_method = 'Cash' THEN 'Cash'
           ELSE 'Other'
       END AS payment_category
FROM ecommerce_orders;
```

**Explanation:** Groups payment methods. Adjust the labels if your dataset uses different payment-method names.

### 10. Flag orders requiring review.

```sql
SELECT order_id, quantity,
       CASE
           WHEN quantity >= 10 THEN 'Review Required'
           ELSE 'Normal'
       END AS review_status
FROM ecommerce_orders;
```

**Explanation:** Flags orders containing 10 or more units.

## Part B: COALESCE()

### 11. Replace missing product names with Unknown Product.

```sql
SELECT order_id,
       COALESCE(product_name, 'Unknown Product') AS product_name
FROM ecommerce_orders;
```

**Explanation:** `COALESCE()` returns the first non-NULL value.

### 12. Replace missing cities with Unknown City.

```sql
SELECT order_id,
       COALESCE(city, 'Unknown City') AS city
FROM ecommerce_orders;
```

**Explanation:** Displays a fallback label when the city is NULL.

### 13. Treat missing discount rates as zero.

```sql
SELECT order_id,
       COALESCE(discount_rate, 0) AS discount_rate
FROM ecommerce_orders;
```

**Explanation:** Replaces NULL discount rates with `0`.

### 14. Replace missing payment methods.

```sql
SELECT order_id,
       COALESCE(payment_method, 'Not Provided') AS payment_method
FROM ecommerce_orders;
```

**Explanation:** Provides a readable label for missing payment information.

### 15. Calculate order quantity safely when quantity is NULL.

```sql
SELECT order_id, product_name,
       unit_price,
       COALESCE(quantity, 0) AS quantity,
       unit_price * COALESCE(quantity, 0) AS original_value
FROM ecommerce_orders;
```

**Explanation:** Treats missing quantities as zero for this calculation.

### 16. Replace missing order statuses.

```sql
SELECT order_id,
       COALESCE(order_status, 'Unknown Status') AS order_status
FROM ecommerce_orders;
```

**Explanation:** Replaces NULL status values with a fallback label.

### 17. Find the first available product classification.

```sql
SELECT order_id,
       COALESCE(product_name, category, 'Unclassified') AS item_label
FROM ecommerce_orders;
```

**Explanation:** Uses the product name first, category second, and `Unclassified` if both are NULL.

### 18. Count product names that are missing or empty.

```sql
SELECT COUNT(*) AS missing_product_names
FROM ecommerce_orders
WHERE COALESCE(product_name, '') = '';
```

**Explanation:** Counts NULL and empty-string product names. Whitespace-only values require extra handling.

## Part C: NULLIF()

### 19. Demonstrate safe division using NULLIF.

```sql
SELECT order_id,
       unit_price,
       quantity,
       unit_price / NULLIF(quantity, 0) AS division_result
FROM ecommerce_orders;
```

**Explanation:** `NULLIF(quantity, 0)` returns NULL when quantity is zero, preventing division-by-zero errors. This is a function demonstration, not a standard per-unit price calculation.

### 20. Convert empty product names to NULL.

```sql
SELECT order_id,
       NULLIF(product_name, '') AS cleaned_product_name
FROM ecommerce_orders;
```

**Explanation:** Returns NULL when the product name is an empty string.

### 21. Convert the text Unknown into NULL for city.

```sql
SELECT order_id,
       NULLIF(city, 'Unknown') AS cleaned_city
FROM ecommerce_orders;
```

**Explanation:** Changes the exact value `Unknown` to NULL.

### 22. Demonstrate division with a zero-denominator safeguard.

```sql
SELECT order_id,
       discount_rate,
       unit_price,
       discount_rate / NULLIF(unit_price, 0) AS ratio
FROM ecommerce_orders;
```

**Explanation:** Prevents division by zero when `unit_price` is zero. This ratio is only a practice example, not the usual discount calculation.

### 23. Convert empty payment methods to NULL.

```sql
SELECT order_id,
       NULLIF(payment_method, '') AS cleaned_payment_method
FROM ecommerce_orders;
```

**Explanation:** Replaces an empty payment-method string with NULL.

## Part D: Combining Conditional Functions

### 24. Classify quantities while handling NULL values.

```sql
SELECT order_id,
       quantity,
       CASE
           WHEN COALESCE(quantity, 0) >= 5 THEN 'Bulk'
           WHEN COALESCE(quantity, 0) >= 2 THEN 'Medium'
           ELSE 'Small'
       END AS quantity_category
FROM ecommerce_orders;
```

**Explanation:** `COALESCE()` handles missing quantities, while `CASE` classifies them.

### 25. Calculate original value, discounted value, and discount category.

```sql
SELECT order_id,
       product_name,
       unit_price * quantity AS original_value,
       discount_rate,
       ROUND(
           unit_price * quantity *
           (1 - COALESCE(discount_rate, 0)),
           2
       ) AS discounted_value,
       CASE
           WHEN COALESCE(discount_rate, 0) >= 0.30
               THEN 'High Discount'
           WHEN COALESCE(discount_rate, 0) >= 0.10
               THEN 'Medium Discount'
           WHEN COALESCE(discount_rate, 0) > 0
               THEN 'Low Discount'
           ELSE 'No Discount'
       END AS discount_category
FROM ecommerce_orders;
```

**Explanation:** Calculates the pre-discount and discounted order-line values, then labels the discount rate. It assumes discounts are stored as decimals, such as `0.20` for 20%.

---

## Module 03 Summary

- `CASE WHEN`: applies conditional logic.
- `COALESCE()`: replaces NULL with a fallback value.
- `NULLIF()`: returns NULL when two expressions match.
- `ROUND()`: rounds numeric results to a specified number of decimal places.

**GitHub folder:** `sql-portfolio/03_conditional_logic/`

**Suggested files:**
- `README.md`
- `03_conditional_logic.sql`
