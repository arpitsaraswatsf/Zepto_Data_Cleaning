use zepto;
create table zepto(
sku_id SERIAL PRIMARY KEY,
category varchar(120),
name varchar(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQunatity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outofStock BOOLEAN,
quantity INTEGER);

use zepto;

SELECT  COUNT(*) FROM zepto;
SELECT * FROM zepto
LIMIT 20;


SELECT * FROM zepto
where name is null
or category is null
or mrp is null
or discountPercent is null
or availableQuantity is null
or discountSellingPrice is null
or weightInGms is null
or outofStock is null
or quantity is null;

SELECT distinct category
FROM zepto
ORDER BY category;

SELECT outOfStock, COUNT(sku_id)
	FROM zepto
	group by outOfStock;
     
     SELECT name, count(sku_id) as "Number of SKUs"
     FROM zepto
     GROUP BY name
     HAVING count(sku_id) > 1
     order by count(sku_id) DESC;
     
     SELECT * FROM zepto
     WHERE mrp = 0 OR discountSellingPrice = 0;
     
     UPDATE zepto
     SET mrp = mrp/100.0,
     discountSellingPrice = discountSellingPrice/100.0;	
     
     SELECT mrp, discountSellingPrice FROM zepto;
     
     -- find the best value to top 10 product based on discount percentage.
     
     Select distinct name, mrp, DiscountPercent
     from zepto
     order by discountPercent DESC
     LIMIT 10;	
     
     
     -- what are the product with high MRP but out of Stock.
     
     SELECT distinct name, mrp, outOfStock
     FROM zepto
     WHERE outOfStock = true and mrp>300
     ORDER BY mrp DESC;
     
     
     -- calculate Estimated Revenue for each category?
     
     SELECT category,
     SUM(discountSellingPrice * availableQuantity) AS total_revenue
     FROM zepto
     GROUP BY category
     ORDER BY total_revenue;
     
     
     -- find all the prodcut where MRP is greater than 500 and discount is Less than 10%
     
     SELECT distinct name, mrp, discountPercent
     FROM zepto
     WHERE mrp>500 and discountPercent<10
     ORDER BY mrp DESC, discountPercent DESC;
     
     -- Identify the top 5 categories offering the higest average  discount percentage.
     
     SELECT category,
     ROUND(AVG(discountpercent),2) AS avg_discount
     FROM zepto
     GROUP BY category
     ORDER BY avg_discount
     LIMIT 5;
     
     --  find the perice per gram for product above 100gm and short by best value.
     
     SELECT DISTINCT name, weightInGms, discountSellingPrice,
     ROUND(discountSellingPrice/weightInGms,2) AS price_pr_gms
     from zepto
     WHERE weightInGms >= 100
     ORDER BY price_pr_gms;
     
     -- Q7 group the product into cateogries like Low, Medium, Bulk?
     
     SELECT DISTINCT name, weightInGms,
     CASE WHEN weightInGms < 1000 THEN 'low'
     WHEN  weightInGms < 3000 THEN 'medium'
     ELSE 'Bulk'
     END AS weight_category
     FROM zepto;
     
     -- Q8 what is the total Inventory weight per category
     
     SELECT category,
     SUM(weightInGms * availableQuantity) AS total_weight
     FROM zepto
     GROUP BY category
     ORDER BY total_weight;
     
     -- Q9 
	
     
     