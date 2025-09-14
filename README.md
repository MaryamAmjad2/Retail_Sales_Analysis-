Here’s a polished **README.md** you can put in your GitHub repo for the project 👇

---

# Retail Sales Analysis (SQL)

This repository contains SQL scripts for cleaning, transforming, and analyzing a retail sales dataset. The goal is to prepare the data for analysis, perform exploratory queries, and extract meaningful business insights such as sales trends, customer behavior, and top-performing categories.

---

## 📂 Contents

1. **Data Cleaning & Preparation**

   * Changing column datatypes (`DATE`, `TIME`, `FLOAT`)
   * Adding and renaming primary key columns
   * Checking for `NULL` values

2. **Exploratory Data Analysis (EDA)**

   * Filtering sales by date and category
   * Counting monthly sales
   * Listing distinct categories
   * Identifying high-value transactions

3. **Sales Insights**

   * Category-wise total sales and orders
   * Average customer age per category
   * Gender-wise category distribution
   * Ranking best-selling months per year
   * Customer-level total spending
   * Unique customer counts per category

4. **Time-Based Analysis**

   * Extracting hours from `sale_time`
   * Grouping sales into shifts (Morning, Evening, Night)

---

## 🛠️ Example Queries

### Change column datatypes

```sql
ALTER TABLE retail
MODIFY sale_date DATE,
MODIFY sale_time TIME,
MODIFY total_sale FLOAT,
MODIFY price_per_unit FLOAT;
```

### Check for missing values

```sql
SELECT * FROM retail
WHERE sale_date IS NULL 
   OR sale_time IS NULL 
   OR customer_id IS NULL
   OR category IS NULL
   OR total_sale IS NULL;
```

### Sales by category

```sql
SELECT 
    category,
    SUM(quantiy) AS Total_Orders,
    SUM(total_sale) AS Total_Sales
FROM retail
GROUP BY category;
```

### Best-selling month of each year

```sql
SELECT 
    Sale_Year,
    Sale_Month,
    avg_sale,
    sale_rank
FROM (
    SELECT 
        YEAR(sale_date) AS Sale_Year,
        EXTRACT(MONTH FROM sale_date) AS Sale_Month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date) 
            ORDER BY AVG(total_sale) DESC
        ) AS sale_rank
    FROM retail
    GROUP BY YEAR(sale_date), EXTRACT(MONTH FROM sale_date)
) AS ranked
ORDER BY Sale_Year, sale_rank;
```

### Sales by shift

```sql
SELECT 
    CASE
        WHEN HOUR(sale_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Evening'
        WHEN HOUR(sale_time) BETWEEN 18 AND 23 THEN 'Night'
    END AS Shift,
    COUNT(transaction_id) AS Total_Orders
FROM retail
GROUP BY Shift
ORDER BY Shift;
```

---

## 📊 Insights You Can Derive

* Which product categories generate the most sales
* How customer demographics affect buying behavior
* Monthly sales trends across years
* Peak sales periods during the day (morning, evening, night)
* High-value customers contributing the most revenue

---

## 🚀 Usage

* Run queries in **MySQL Workbench** (or any SQL client).
* Update table/column names if your dataset differs.
* Use results for reporting, dashboards, or further ML/BI analysis.

---

Would you like me to also add a **sample ER diagram (schema)** to the README (generated as an image), so your repo looks more professional?
