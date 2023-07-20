SELECT 
	ord.order_id,
	CONCAT(cus.First_name,' ',cus.Last_name) as 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	Sum(quantity) as 'total_units',
	Sum(ite.quantity*ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	stor.store_name,
	CONCAT(sta.first_name, ' ',sta.last_name) as 'sales_rep'
FROM sales.orders ord
Join sales.customers cus
on ord.customer_id = cus.customer_id
Join sales.order_items ite
on ord.order_id = ite.order_id
Join Production.products pro
on  ite.product_id = pro.product_id 
Join Production.categories cat
on pro.category_id = cat.category_id
Join sales.stores stor
on ord.store_id = stor. store_id
Join sales.staffs sta
on ord.staff_id = sta.staff_id
GROUP BY
    ord.order_id,
    CONCAT(cus.First_name, ' ', cus.Last_name),
    cus.city,
    cus.state,
    ord.order_date,
	pro.product_name,
	cat.category_name,
	stor.store_name,
	CONCAT(sta.first_name, ' ',sta.last_name) 
	