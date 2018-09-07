/*Step 1 Data Preparation*/
use AdventureWorks
go
select PersonType,FirstName, LastName, sales.SalesOrderHeader.TerritoryID, SubTotal, TaxAmt, Comment, OrderQty, UnitPrice, UnitPriceDiscount, LineTotal, EmailPromotion
from sales.SalesOrderDetail
inner join  sales.SalesOrderHeader
on SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
inner join sales.PersonCreditCard
on SalesOrderHeader.CreditCardID = PersonCreditCard.CreditCardID
right join Person.Person
on person.BusinessEntityID = PersonCreditCard.BusinessEntityID
where PersonType = 'IN'
order by FirstName,LastName
/*It's okay to get more than 58k values, unigue order details of each customer is represented*/

/*Step 2: Select our best attributes you want to include in your model*/
use AdventureWorks
go
select PersonType,FirstName, LastName, sales.SalesOrderHeader.TerritoryID, SubTotal, TaxAmt, Comment, OrderQty, UnitPrice, UnitPriceDiscount, LineTotal, EmailPromotion
from sales.SalesOrderDetail
inner join  sales.SalesOrderHeader
on SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
inner join sales.PersonCreditCard
on SalesOrderHeader.CreditCardID = PersonCreditCard.CreditCardID
right join Person.Person
on person.BusinessEntityID = PersonCreditCard.BusinessEntityID
where PersonType = 'IN'
order by EmailPromotion Desc

/*split our data into training and testing data sets*/
select * into dbo.testing from dbo.dataset TABLESAMPLE(20 percent)
select * into dbo.training from dbo.dataset TABLESAMPLE(80 percent)
commit tran;

/*Training NB model over the training */