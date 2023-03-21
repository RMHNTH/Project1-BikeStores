--ALTER TABLE sales.customers
--ADD full_names varchar(50)
--
--UPDATE  sales.customers
--SET full_names = CONCAT(first_name, ' ',last_name)

--ALTER TABLE sales.staffs
--ADD sales_rep varchar(50)

--UPDATE  sales.staffs
--SET sales_rep = CONCAT(first_name, ' ',last_name)

-- COLLECT AND GATHER DATA
SELECT
	ord.order_id,
	cus.full_names,
	cus.city,
	cus.state,
	ord.order_date, 
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	sta.sales_rep
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id 
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN sales.stores sto 
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
GROUP BY
    ord.order_id,
	cus.full_names,
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	sta.sales_rep

	SELECT @@SERVERNAME
--