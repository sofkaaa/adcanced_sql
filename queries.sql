
SELECT sum(quantity)
FROM orders;

SELECT product_id, sum(quantity) as product_total
FROM orders
GROUP BY product_id;

SELECT products.product_id, products.name, sum(orders.quantity)
FROM products LEFT JOIN orders
ON products.product_id == orders.product_id
GROUP BY products.product_id;


SELECT customers.first_name, customers.last_name, customers.email, orders.quantity
FROM customers INNER JOIN orders
ON customers.customer_id == orders.customer_id



SELECT orders.order_id, products.name,products.price , sum(orders.quantity) as quantity, sum(orders.quantity)* products.price as total_price
FROM products JOIN orders
ON products.product_id == orders.product_id
GROUP BY products.product_id
ORDER BY name;



SELECT category, min(total_q)
FROM
	(SELECT products.category, sum(orders.quantity) as total_q
	FROM products JOIN orders
	ON products.product_id == orders.product_id
	GROUP BY products.category);



SELECT avg(total_price) FROM
(SELECT orders.order_id, products.name,products.price , sum(orders.quantity) as quantity, sum(orders.quantity)* products.price as total_price
FROM products JOIN orders
ON products.product_id == orders.product_id
GROUP BY products.product_id
ORDER BY name);



UPDATE products SET price = price*1.1
WHERE category = 'Electronics';

SELECT price, category
FROM products