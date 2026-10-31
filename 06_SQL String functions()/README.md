# PostgreSQL String Functions – 22 Queries

**Dataset:** `sales_pipeline`  
**Database:** PostgreSQL  
**Level:** Basic to Advanced

---

## 1. LENGTH()

**Purpose:** Counts the number of characters in a string.

```sql
SELECT
    account,
    LENGTH(account) AS name_length
FROM sales_pipeline;
```

**Business question:** How many characters are there in each account name?

## 2. UPPER()

**Purpose:** Converts text into uppercase.

```sql
SELECT
    account,
    UPPER(account) AS uppercase_name
FROM sales_pipeline;
```

**Business question:** Display all account names in uppercase.

## 3. LOWER()

**Purpose:** Converts text into lowercase.

```sql
SELECT
    account,
    LOWER(account) AS lowercase_name
FROM sales_pipeline;
```

**Business question:** Convert account names into lowercase.

## 4. INITCAP()

**Purpose:** Converts the first letter of each word into uppercase.

```sql
SELECT
    account,
    INITCAP(account) AS formatted_name
FROM sales_pipeline;
```

**Business question:** Standardize account names into title case.

## 5. TRIM()

**Purpose:** Removes leading and trailing spaces.

```sql
SELECT
    TRIM(account) AS cleaned_account
FROM sales_pipeline;
```

**Business question:** Clean unnecessary spaces from account names.

## 6. LTRIM()

**Purpose:** Removes spaces from the left side.

```sql
SELECT
    LTRIM(account) AS cleaned_account
FROM sales_pipeline;
```

**Business question:** Remove unwanted spaces before account names.

## 7. RTRIM()

**Purpose:** Removes spaces from the right side.

```sql
SELECT
    RTRIM(account) AS cleaned_account
FROM sales_pipeline;
```

**Business question:** Remove unwanted spaces after account names.

## 8. BTRIM()

**Purpose:** Removes specified characters from both ends of a string.

```sql
SELECT
    BTRIM('***Sales Team***', '*') AS cleaned_text;
```

**Business question:** Remove unwanted symbols from text.

## 9. REPLACE()

**Purpose:** Replaces a particular substring with another substring.

```sql
SELECT
    account,
    REPLACE(account, 'Inc.', 'Incorporated') AS updated_account
FROM sales_pipeline;
```

**Business question:** Replace a particular abbreviation in account names.

## 10. POSITION()

**Purpose:** Finds the position of a substring within a string.

```sql
SELECT
    account,
    POSITION('a' IN account) AS character_position
FROM sales_pipeline;
```

**Business question:** Find the position of the letter 'a' in account names.

## 11. STRPOS()

**Purpose:** Returns the position of a substring.

```sql
SELECT
    account,
    STRPOS(account, 'a') AS character_position
FROM sales_pipeline;
```

**Business question:** Identify where a particular character first appears.

## 12. SUBSTRING()

**Purpose:** Extracts a specific portion of a string.

```sql
SELECT
    account,
    SUBSTRING(account FROM 1 FOR 5) AS extracted_text
FROM sales_pipeline;
```

**Business question:** Extract the first five characters of account names.

## 13. LEFT()

**Purpose:** Extracts characters from the left side.

```sql
SELECT
    account,
    LEFT(account, 4) AS first_four_characters
FROM sales_pipeline;
```

**Business question:** Display the first four characters of every account name.

## 14. RIGHT()

**Purpose:** Extracts characters from the right side.

```sql
SELECT
    account,
    RIGHT(account, 4) AS last_four_characters
FROM sales_pipeline;
```

**Business question:** Display the last four characters of account names.

## 15. CONCAT()

**Purpose:** Combines multiple strings.

```sql
SELECT
    CONCAT(sales_agent, ' - ', account) AS agent_account
FROM sales_pipeline;
```

**Business question:** Combine sales agent names and account names into one column.

## 16. CONCAT_WS()

**Purpose:** Combines strings using a specified separator.

```sql
SELECT
    CONCAT_WS(' | ', sales_agent, account, product) AS sales_details
FROM sales_pipeline;
```

**Business question:** Combine agent, account and product information with separators.

## 17. String Concatenation Operator (||)

**Purpose:** Joins strings using the concatenation operator.

```sql
SELECT
    sales_agent || ' handles ' || account AS sales_information
FROM sales_pipeline;
```

**Business question:** Generate readable sales descriptions.

## 18. REVERSE()

**Purpose:** Reverses the characters in a string.

```sql
SELECT
    account,
    REVERSE(account) AS reversed_name
FROM sales_pipeline;
```

**Business question:** Display account names in reverse order.

## 19. REPEAT()

**Purpose:** Repeats a string a specified number of times.

```sql
SELECT
    account,
    REPEAT('*', 5) AS rating_symbol
FROM sales_pipeline;
```

**Business question:** Generate repeated symbols for simple reporting.

## 20. LPAD()

**Purpose:** Adds characters to the left side until the required length is reached.

```sql
SELECT
    account,
    LPAD(account, 20, '*') AS formatted_account
FROM sales_pipeline;
```

**Business question:** Format account names with left-side padding.

## 21. RPAD()

**Purpose:** Adds characters to the right side until the required length is reached.

```sql
SELECT
    account,
    RPAD(account, 20, '*') AS formatted_account
FROM sales_pipeline;
```

**Business question:** Format account names with right-side padding.

## 22. SPLIT_PART()

**Purpose:** Splits a string using a delimiter and extracts a particular part.

```sql
SELECT
    SPLIT_PART('John Smith', ' ', 1) AS first_name,
    SPLIT_PART('John Smith', ' ', 2) AS last_name;
```

**Business question:** Separate a full name into first and last names.

---

# Bonus: Advanced Business Query

**STRING_AGG()** combines multiple rows into one string.

```sql
SELECT
    account,
    STRING_AGG(DISTINCT sales_agent, ', ') AS sales_agents
FROM sales_pipeline
GROUP BY account;
```

**Business question:** Display all sales agents associated with each account.

---

# Important Revision

| Function | Main purpose |
|---|---|
| LENGTH() | Count characters |
| UPPER() / LOWER() | Change case |
| INITCAP() | Title case |
| TRIM() / LTRIM() / RTRIM() | Remove spaces |
| REPLACE() | Replace text |
| POSITION() / STRPOS() | Find position |
| SUBSTRING() | Extract text |
| LEFT() / RIGHT() | Extract from ends |
| CONCAT() / CONCAT_WS() | Combine strings |
| REVERSE() | Reverse text |
| LPAD() / RPAD() | Add padding |
| SPLIT_PART() | Split text |
| STRING_AGG() | Combine multiple rows |

**Practice strategy:** Execute all 22 queries in PostgreSQL, understand the output, and save this collection in your GitHub SQL portfolio.
