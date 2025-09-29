# ABC Hotel, Marketing and Guest Relations Department, Hospitality and Tourism Industry

# ABC Hotel Data Analysis Project

# Overview

This project aims to provide data-driven insights to optimize marketing efforts for ABC Hotel. The hotel faces challenges in understanding regional preferences, customer loyalty, and effective marketing strategies, leading to inefficient resource allocation and missed opportunities.

# Key Objectives

1. Rank Room Categories by Revenue per Season: Identify premium offerings and inform dynamic pricing strategies.
2. Analyze Guest Visit Frequency: Calculate days between consecutive stays for repeat guests to understand visit frequency and identify at-risk loyal customers.
3. Segment Guests: Divide guests into "Elite," "Frequent," and "Occasional" tiers based on annual spending and stay frequency for targeted loyalty rewards and personalized marketing campaigns.

# Success Criteria

1. Top 5 Products per Region/Quarter: Identify the top 5 most popular services/packages in each region for each quarter.
2. Running Monthly Sales Totals: Track the total occupancy rates for each month, showing a running total.
3. Month-over-Month Growth: Calculate growth rate in bookings from one month to the next.
4. Customer Loyalty Quartiles: Segment customers into four quartiles based on loyalty and frequency of visits.
5. 3-Month Moving Averages: Calculate average room rate over a 3-month period to analyze long-term sales trends.

# Methodology

This project utilizes SQL window functions, such as:

- RANK(): Ranking room categories by revenue per season
- LAG(): Calculating days between consecutive stays
- NTILE(): Segmenting guests based on annual spending

# SQL Queries

Some example SQL queries used in this project include:

- RANK() OVER (PARTITION BY season ORDER BY revenue DESC)
- LAG(check_out_date) OVER (PARTITION BY customer_id ORDER BY check_in_date)
- NTILE(3) OVER (ORDER BY annual_spending DESC)

# Insights and Recommendations

This project provides insights into guest behavior, preferences, and loyalty. Based on the analysis, recommendations can be made to optimize marketing efforts and improve customer satisfaction.

Conclusion

This project demonstrates the power of data analysis in informing marketing strategies and improving customer satisfaction. By leveraging SQL window functions, we can gain valuable insights into guest behavior and preferences, ultimately driving business growth and revenue.
