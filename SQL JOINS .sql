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
Select e.name as EmployeeName, s.Quantity as SalesQuantity
From Employees e 
Inner Join Sales s 
ON e.EmployeeId = s.EmployeeId

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as DepartmentName, c.Name as CategoryName
From Categories c 
Inner Join Departments d 
On c.departmentID = d.departmentID
WHERE c.name IN('Appliances', 'Games'); 


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.name as ProductName, 
SUM (s.quantity) as TotalNumber, 
SUM *(s.quantity * p.price) AS TotalPrice
 From Sales s
 Inner Join Products p
 On s.productID = p.productID
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT  p.name as ProductName,
 rv.firstName as ReviewerFirstName,
 rv.lastName as ReviewerLastName,
 r.Rating, 
 r.Comment 
FROM Reviews r
Inner Join Products p
On r.productID = p.productID
Inner Join Reviewers rv 
ON r.reviewerID = rv.ReviewerID
Where p.name = 'Visio TV'
AND r.rating = (
SELECT MIN (r2.Rating)
From Reviews r2 
Inner JOIN Products p2
	ON r2.ProductID = p2.ProductId
    Where p2.Name = 'Visio TV'
);



