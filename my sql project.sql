#Create a database named LIBRARY and create following TABLES in the database: 
# 1.Branch  2.Employee  3.Customer  4.IssueStatus  5.ReturnStatus  6.Books 

create database library;
use library;

create table branch(
Branch_No INT PRIMARY KEY,
 Manager_Id INT, 
 Branch_Address VARCHAR(50),
 Contact_No INT);
 
INSERT INTO branch values(1,101,'gandinagar street',1234569);
INSERT INTO branch values(2,102,'indira nagar street',9874561);
INSERT INTO branch values(3,103,'sm street',1597532);
INSERT INTO branch values(4,104,'sm ngh street',75325648);
INSERT INTO branch values(5,105,'rose garden',12547996);
INSERT INTO branch values(6,106,'indira nagar street',9874561);
SELECT * FROM branch;

CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(20),
  Position VARCHAR(20),
  Salary INT
);
insert into Employee values(101,'ranveer','manager',40000);
insert into Employee values(102,'manjusha','assitant manager',35000);
insert into Employee values(103,'manu k','Librarian',22000);
insert into Employee values(104,'lavanya','casier',20000);
insert into Employee values(105,'veena','executive manager',35000);
insert into Employee values(106,'babu','Supervisor',25000);
SELECT*FROM Employee;

CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY ,
Customer_name VARCHAR(50),
Customer_address VARCHAR(80),
Reg_date DATETIME
);
INSERT INTO Customer VALUES(201,'karthik','indira nagar street','2020-05-10');
INSERT INTO Customer VALUES(202,'keerthana','gandinagar street','2021-07-11');
INSERT INTO Customer VALUES(203,'raju','sm street','2023-01-18');
INSERT INTO Customer VALUES(204,'vimal','sm ngh street','2020-11-25');
INSERT INTO Customer VALUES(205,'gayathri','rose garden','2022-12-10');
INSERT INTO Customer VALUES(206,'vinod','gandinagar street','2021-05-28');
SELECT*FROM Customer;

CREATE TABLE ISSUE_STATUS(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(60),
Issue_date DATE,
Isbn_book VARCHAR(50),
FOREIGN KEY(Issued_cust)REFERENCES Customer(Customer_Id),
FOREIGN KEY(Isbn_book)REFERENCES Books(Isbn)
);
INSERT INTO ISSUE_STATUS VALUES(401,201,'my fault','2020-05-25',1000);
INSERT INTO ISSUE_STATUS VALUES(402,202,'harry potter','2022-11-01',2000);
INSERT INTO ISSUE_STATUS VALUES(403,203,'alchemist','2021-01-15',3000);
INSERT INTO ISSUE_STATUS VALUES(404,204,'The Da Vinci Code','2023-02-29',4000);
INSERT INTO ISSUE_STATUS VALUES(405,205,'The Last Mughal','2021-03-15',5000);
INSERT INTO ISSUE_STATUS VALUES(406,206,'king lear','2020-12-30',6000);
SELECT*FROM ISSUE_STATUS;

CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust  INT,
Return_book_name VARCHAR(50),
Return_date DATE,
Isbn_book2 VARCHAR(50),
FOREIGN KEY(Isbn_book2)REFERENCES Books(Isbn)
);
INSERT INTO ReturnStatus values(501,201,'my fault','2020-02-27',1000);
INSERT INTO ReturnStatus values(502,202,'harry potter','2022-11-15',2000);
INSERT INTO ReturnStatus values(503,203,'alchemist','2021-01-18',3000);
INSERT INTO ReturnStatus values(504,204,'The Da Vinci Code','2023-02-30',4000);
INSERT INTO ReturnStatus values(505,205,'The Last Mughal','2021-03-20',5000);
INSERT INTO ReturnStatus values(506,206,'king lear','2021-01-01',6000);
SELECT*FROM ReturnStatus;

CREATE TABLE Books(
Isbn VARCHAR(90) PRIMARY KEY,
Book_title VARCHAR(60),
Category VARCHAR(60),
Rental_price DECIMAL(10,2)
Status VARCHAR(50),
Author VARCHAR(80),
Publisher VARCHAR(100),
);
INSERT INTO Books VALUES(1000,'my fault','love',25,'yes','Mercedes Rons','centre of literary publishing');
INSERT INTO Books VALUES(2000,'harry potter','fiction',50,'yes','J k rowling','Bloomsbury Publishing');
INSERT INTO Books VALUES(3000,'alchemist','fantacy',50,'no','paulo coelho','HarperTorch');
INSERT INTO Books VALUES(4000,'The Da Vinci Code','mystery thriller',30,'yes','Dan Brown','Doubleday');
INSERT INTO Books VALUES(5000,'The Last Mughal','historical',20,'yes','‎Penguin India','‎Penguin India');
INSERT INTO Books VALUES(6000,'king lear','tragedy',60,'no','William Shakespear','SimonSchuster');
SELCET*FROM Books;

#  1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,Category,Rental_price FROM Books WHERE Status= "yes";

# 2) List the employee names and their respective salaries in descending order of salary.
SELECT SELECT Emp_name, Salary FROM Employee ORDER BY Salary desc;

#  3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title,IssueStatus.Issued_cust FROM IssueStatus INNER JOIN Books ON  IssueStatus.Issued_book_name = Books.Book_title;

#  4. Display the total count of books in each category.
SELECT Category,COUNT(Category)FROM Books GROUP BY Category  ;

#  5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,position FROM  Employee WHERE salary>50000;

#  6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer.Customer_name,customer.reg_date FROM customer LEFT JOIN issuestatus ON Customer.customer_id = Issuestatus.issued_cust WHERE issue_id IS NULL;

#  7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no,COUNT(DISTINCT Manager_id) FROM branch GROUP BY Branch_no;

#  8. Display the names of customers who have issued books in the month of June 2023.
SELECT Customer.Customer_name,Issuestatus.Issue_date FROM customer INNER JOIN  Issuestatus ON Customer.customer_id = Issuestatus.issued_cust WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30' ;

#  9. Retrieve book_title from book table containing history.
SELECT book_title FROM Books WHERE  Category ='history' ;

#  10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT branch_no,count(Manager_id) FROM branch GROUP BY branch_no HAVING count(manager_id) >5;









  


