/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
Select p.name AS ProductName, c.Name as CategoryName
From Products p 
inner join  Categories c 
ON  c.categoryid = p.categoryid
Where c.name =  "Computers"; 


 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
Select p.name, p.price, r.Rating
From products p  
Inner Join Reviews r  
on r.ProductId = p.ProductId 
Where r.rating = 5;  


 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select employees.FirstName, employees.LastName, SUM(sales.Quantity) AS total
From sales
Inner Join employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName
Order BY Total DESC LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
From departments
Inner Join categories On categories.DepartmentID = departments.DepartmentID 
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games'; 


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.name as ProductName, 
SUM (s.quantity) as TotalNumber, 
SUM *(s.quantity * p.price) AS TotalPrice
 From Sales s
 Inner Join Products p
 On s.productID = p.productID;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, products.ProductID FROM products ORDER BY products.Name DESC; /* got product ID */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment 
FROM products
Inner Join reviews ON reviews.ProductID = products.ProductID
Where products.ProductID = 857 
	AND reviews.Rating = (SELECT MIN(Rating) FROM reviews WHERE ProductID = 857);

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */




