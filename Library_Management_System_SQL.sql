CREATE DATABASE library;
USE library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch VALUES
(1, 101, 'MG Road, Bangalore', '9876543210'),
(2, 102, 'Anna Nagar, Chennai', '8765432109'),
(3, 103, 'Park Street, Kolkata', '9988776655');

INSERT INTO Employee VALUES
(201, 'Ravi Kumar', 'Manager', 70000, 1),
(202, 'Sita Devi', 'Assistant', 40000, 1),
(203, 'Arjun Singh', 'Manager', 65000, 2),
(204, 'Meena Joshi', 'Clerk', 30000, 3),
(205, 'Raj Patel', 'Librarian', 55000, 2);

INSERT INTO Books VALUES
(111, 'History of India', 'History', 30, 'yes', 'Bipin Chandra', 'Oxford'),
(112, 'Modern Physics', 'Science', 40, 'yes', 'H.C. Verma', 'Pearson'),
(113, 'Python Basics', 'Programming', 50, 'no', 'John Zelle', 'Wiley'),
(114, 'World History', 'History', 35, 'yes', 'Norman Lowe', 'McGraw Hill'),
(115, 'Database Systems', 'Technology', 60, 'no', 'Ramez Elmasri', 'Pearson');

INSERT INTO Customer VALUES
(301, 'Anjali Sharma', 'Delhi', '2021-12-20'),
(302, 'Vikram Rao', 'Mumbai', '2022-03-15'),
(303, 'Sneha Iyer', 'Chennai', '2020-11-10'),
(304, 'Amit Das', 'Kolkata', '2023-06-12');

INSERT INTO IssueStatus VALUES
(401, 302, 'Python Basics', '2023-06-05', 113),
(402, 304, 'World History', '2023-06-20', 114);

INSERT INTO ReturnStatus VALUES
(501, 302, 'Python Basics', '2023-07-10', 113);

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE b.Rental_Price > 25;
