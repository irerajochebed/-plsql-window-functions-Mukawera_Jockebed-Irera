hospitality=# --Ranking window function
hospitality=# -- Top N customers by revenue
hospitality=# SELECT   c.customer_id,   c.name,   SUM(t.amount) AS total_revenue,  ROW_NUMBER() OVER (ORDER BY SUM(t.amount) DESC) AS row_num,  RANK() OVER (ORDER BY SUM(t.amount) DESC) AS rank,  DENSE_RANK() OVER (ORDER BY SUM(t.amount) DESC) AS dense_rank,  PERCENT_RANK() OVER (ORDER BY SUM(t.amount) DESC) AS percent_rank FROM   customers c JOIN   transactions t ON c.customer_id = t.customer_id GROUP BY   c.customer_id, c.name ORDER BY   total_revenue DESC;

hospitality=# --Aggregate window function implementation
hospitality=# -- Running totals & trends
hospitality=# SELECT   t.sale_date,   t.amount,  SUM(t.amount) OVER (ORDER BY t.sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_rows,  SUM(t.amount) OVER (ORDER BY t.sale_date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_range,  AVG(t.amount) OVER (ORDER BY t.sale_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS moving_avg,  MIN(t.amount) OVER (ORDER BY t.sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS min_amount,  MAX(t.amount) OVER (ORDER BY t.sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_amount FROM   transactions t ORDER BY   t.sale_date;

hospitality=# --Navigation window function implementation
hospitality=# -- Period-to-period analysis
hospitality=# SELECT   t.sale_date,   t.amount,  LAG(t.amount) OVER (ORDER BY t.sale_date) AS prev_amount,  t.amount - LAG(t.amount) OVER (ORDER BY t.sale_date) AS growth,  LEAD(t.amount) OVER (ORDER BY t.sale_date) AS next_amount,  ROUND((t.amount - LAG(t.amount) OVER (ORDER BY t.sale_date)) / LAG(t.amount) OVER (ORDER BY t.sale_date) * 100, 2) AS growth_pct FROM   transactions t ORDER BY   t.sale_date;

hospitality=# --Distribution window function implementation
hospitality=# SELECT   c.customer_id,   c.name,   SUM(t.amount) AS total_revenue,  NTILE(4) OVER (ORDER BY SUM(t.amount) DESC) AS revenue_quartile,  CUME_DIST() OVER (ORDER BY SUM(t.amount) DESC) AS cumulative_distribution FROM   customers c JOIN   transactions t ON c.customer_id = t.customer_id GROUP BY   c.customer_id, c.name ORDER BY   total_revenue DESC;
