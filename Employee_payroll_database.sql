CREATE DATABASE EmployeePayrollDB;

USE EmployeePayrollDB;

#Employee Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    DepartmentID INT,
    Phone VARCHAR(15)
);

#Department Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    ManagerName VARCHAR(50)
);

#Salary Table
CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    BasicSalary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    Deduction DECIMAL(10,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

#Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    WorkingDays INT,
    LeaveDays INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

#Insert Department Data
INSERT INTO Departments VALUES
(1, 'HR', 'Anjali'),
(2, 'IT', 'Rahul');

#Insert Employee Data
INSERT INTO Employees VALUES
(101, 'Ravi', 25, 'Male', 1, '9876543210'),
(102, 'Priya', 24, 'Female', 2, '9876543211');

#Insert Salary Data
INSERT INTO Salary VALUES
(1, 101, 30000, 5000, 1000),
(2, 102, 35000, 4000, 500);

#Insert Attendance Data
INSERT INTO Attendance VALUES
(1, 101, 26, 2),
(2, 102, 25, 1);


SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Salary;

#Employee Payroll Details
SELECT Employees.Name,
Departments.DepartmentName,
Salary.BasicSalary,
Salary.Bonus,
Salary.Deduction
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
JOIN Salary ON Employees.EmployeeID = Salary.EmployeeID;

#Total Salary Expense
SELECT SUM(BasicSalary + Bonus - Deduction) AS Total_Expense
FROM Salary;