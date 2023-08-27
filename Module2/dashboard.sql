SELECT SUM(sales) as sum_sales
FROM public.orders;

SELECT SUM(profit) as sum_profit
FROM public.orders;

SELECT SUM(profit) / SUM(sales) as profit_ratio
FROM public.orders;

SELECT order_id, SUM(profit) / SUM(sales) as profit_per_order
FROM public.orders
group by order_id;

SELECT customer_id, customer_name, SUM(profit) / SUM(sales) as profit_per_order
FROM public.orders
group by customer_id, customer_name;

SELECT SUM(discount * sales) / SUM(sales) as avg_discount
FROM public.orders;

SELECT order_date, SUM(Sales) AS total_sales
FROM public.orders
GROUP BY order_date;

SELECT DATE_TRUNC('month', order_date) AS month, segment , 
    ROUND(SUM(Sales)) AS monthly_sales_by_segment
FROM public.orders
GROUP BY month, segment
order by month, monthly_sales_by_segment desc;

SELECT DATE_TRUNC('month', order_date) AS month, category , 
    ROUND(SUM(Sales)) AS monthly_sales_by_product_category
FROM public.orders
GROUP BY month, category
order by month, monthly_sales_by_product_category desc;

SELECT DATE_TRUNC('day', order_date) AS day, category , 
    ROUND(SUM(sales)) AS sales_by_product_category_over_time
FROM public.orders
GROUP BY day, category
order by day, sales_by_product_category_over_time desc;

SELECT customer_id, customer_name, SUM(sales) as Sales_sum, SUM(profit) as profit_sum
FROM public.orders
group by customer_id, customer_name
order by Profit_sum desc;

SELECT  customer_id, customer_name, rank () over (
order by SUM(profit) desc
)
FROM public.orders
group by customer_id, customer_name;

SELECT region, ROUND(SUM(Sales)) AS total_sales
FROM public.orders
GROUP BY region
order by total_sales desc;
