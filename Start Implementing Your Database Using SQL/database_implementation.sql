
-- =======================================
-- Company Database Implementation Script
-- =======================================

-- 1. Department
CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    DName VARCHAR(100) NOT NULL
);

-- 2. DepartmentLocations (Multivalued attribute of Department)
CREATE TABLE DepartmentLocations (
    DNUM INT,
    Location VARCHAR(100),
    PRIMARY KEY (DNUM, Location),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

-- 3. Employee
CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Gender CHAR(1),
    DNUM INT NOT NULL,
    SuperSSN INT NULL,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (SuperSSN) REFERENCES Employee(SSN)
);

-- 4. Project
CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    City VARCHAR(100),
    DNUM INT NOT NULL,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

-- 5. WorksOn (M:N relationship between Employee and Project)
CREATE TABLE WorksOn (
    SSN INT,
    PNumber INT,
    WorkingHours DECIMAL(5,2),
    PRIMARY KEY (SSN, PNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNumber) REFERENCES Project(PNumber)
);

-- 6. Dependent
CREATE TABLE Dependent (
    SSN INT,
    DependentName VARCHAR(50),
    Gender CHAR(1),
    BirthDate DATE,
    PRIMARY KEY (SSN, DependentName),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN) ON DELETE CASCADE
);

-- 7. DepartmentManager (1:1 relationship with HireDate)
CREATE TABLE DepartmentManager (
    DNUM INT PRIMARY KEY,
    SSN INT,
    HireDate DATE,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);
