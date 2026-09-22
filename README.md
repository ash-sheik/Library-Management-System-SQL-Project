# 📚 Library Management System (SQL Project)

## 🧾 Overview
This SQL project implements a **Library Management System** to store and manage information about books, employees, branches, and customers. It tracks which books are available, issued, and returned.

---

## 🏗️ Database Schema
**Database Name:** `library`

### Tables:
1. **Branch**
   - `Branch_no` (PK)
   - `Manager_Id`
   - `Branch_address`
   - `Contact_no`

2. **Employee**
   - `Emp_Id` (PK)
   - `Emp_name`
   - `Position`
   - `Salary`
   - `Branch_no` (FK → Branch.Branch_no)

3. **Books**
   - `ISBN` (PK)
   - `Book_title`
   - `Category`
   - `Rental_Price`
   - `Status`
   - `Author`
   - `Publisher`

4. **Customer**
   - `Customer_Id` (PK)
   - `Customer_name`
   - `Customer_address`
   - `Reg_date`

5. **IssueStatus**
   - `Issue_Id` (PK)
   - `Issued_cust` (FK → Customer.Customer_Id)
   - `Issued_book_name`
   - `Issue_date`
   - `Isbn_book` (FK → Books.ISBN)

6. **ReturnStatus**
   - `Return_Id` (PK)
   - `Return_cust`
   - `Return_book_name`
   - `Return_date`
   - `Isbn_book2` (FK → Books.ISBN)

---

## 💻 SQL Queries Implemented

| No | Description |
|----|--------------|
| 1 | Retrieve available book details |
| 2 | List employees by salary (descending) |
| 3 | List books and customers who issued them |
| 4 | Count books by category |
| 5 | Employees earning above ₹50,000 |
| 6 | Customers registered before 2022 and not issued books |
| 7 | Count employees per branch |
| 8 | Customers who issued books in June 2023 |
| 9 | Books containing the word "history" |
| 10 | Branches with more than 5 employees |
| 11 | Managers and their branch addresses |
| 12 | Customers who issued books priced above ₹25 |

---

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download or clone this repository.
3. Open `Library_Management_System_SQL.sql` in MySQL Workbench.
4. Execute the script to create the database, tables and sample records.
5. Run the included queries to explore the analysis.

---

## 👩‍💻 Author

**Ashiba B**  
Data Analyst | SQL | Power BI | Excel | Python  

[LinkedIn](https://www.linkedin.com/in/ashiba-data-analyst) | [Email](mailto:ashibab23@gmail.com)
