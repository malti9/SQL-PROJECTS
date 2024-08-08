create database ems;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    HireDate DATE,
    DepartmentID INT,
    JobTitleID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (JobTitleID) REFERENCES Job_Titles(JobTitleID));
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50));
CREATE TABLE Job_Titles (
    JobTitleID INT PRIMARY KEY AUTO_INCREMENT,
    JobTitleName VARCHAR(50),
    JobDescription TEXT);
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID));

CREATE TABLE Performance_Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ReviewDate DATE,
    ReviewerName VARCHAR(50),
    PerformanceScore INT,
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID));

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID));

INSERT INTO Departments (DepartmentName) VALUES ('HR'), ('Finance'), ('IT');

INSERT INTO Job_Titles (JobTitleName, JobDescription) VALUES ('Manager', 'Manages team'), ('Developer', 'Develops software'), ('Accountant', 'Handles accounts');

INSERT INTO Employees (FirstName, LastName, DateOfBirth, Email, PhoneNumber, HireDate, DepartmentID, JobTitleID) VALUES
('John', 'Doe', '1985-05-15', 'john.doe@example.com', '1234567890', '2010-01-01', 1, 1),
('Jane', 'Smith', '1990-08-25', 'jane.smith@example.com', '0987654321', '2015-07-15', 2, 3);

INSERT INTO Salaries (EmployeeID, SalaryAmount, EffectiveDate) VALUES (1, 60000, '2020-01-01'), (2, 50000, '2021-01-01');

INSERT INTO Performance_Reviews (EmployeeID, ReviewDate, ReviewerName, PerformanceScore, Comments) VALUES
(1, '2022-06-15', 'Alice Johnson', 4, 'Good performance'),
(2, '2022-06-15', 'Bob Brown', 5, 'Excellent performance');

INSERT INTO Attendance (EmployeeID, Date, Status) VALUES
(1, '2022-08-01', 'Present'),
(2, '2022-08-01', 'Absent');

-- Query to find all employees in the 'IT' department:
SELECT e.FirstName, e.LastName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

select * from Employees;
select * from Departments;
select * from job_titles;
select * from salaries;
select * from Performance_Reviews;
select * from attendance;

-- Query to find the average salary in each department:
SELECT d.DepartmentName, AVG(s.SalaryAmount) AS AverageSalary
FROM Salaries s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Query to get the performance review of a specific employee:
SELECT e.FirstName, e.LastName, pr.ReviewDate, pr.ReviewerName, pr.PerformanceScore, pr.Comments
FROM Performance_Reviews pr
JOIN Employees e ON pr.EmployeeID = e.EmployeeID
WHERE e.EmployeeID = 1;

-- Stored procedure to give a salary increment:
DELIMITER //
CREATE PROCEDURE GiveSalaryIncrement(IN empID INT, IN incrementAmount DECIMAL(10, 2))
BEGIN
    UPDATE Salaries
    SET SalaryAmount = SalaryAmount + incrementAmount
    WHERE EmployeeID = empID;
END //
DELIMITER ;

-- Trigger to update employee's status when a record is inserted in the Attendance table:
DELIMITER //
CREATE TRIGGER AfterAttendanceInsert
AFTER INSERT ON Attendance
FOR EACH ROW
BEGIN
    DECLARE empStatus VARCHAR(20);
    SET empStatus = (CASE WHEN NEW.Status = 'Present' THEN 'Active' ELSE 'Inactive' END);
    UPDATE Employees
    SET Status = empStatus
    WHERE EmployeeID = NEW.EmployeeID;
END //
DELIMITER ;






    
