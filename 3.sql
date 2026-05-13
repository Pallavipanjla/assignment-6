CREATE TABLE Student (
    Rn INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Marks INT,
    DOB DATE,
    Batch_Code INT,
    Trainer_ID INT
);

CREATE TABLE Batch (
    Batch_Code INT PRIMARY KEY,
    Batch_Name VARCHAR(50),
    Duration VARCHAR(30),
    Description VARCHAR(100)
);

CREATE TABLE Fees (
    Fees_Paid DECIMAL(10,2),
    Date_Paid DATE,
    Rn INT
);

CREATE TABLE Trainer (
    Trainer_ID INT PRIMARY KEY,
    Trainer_Name VARCHAR(50),
    Address VARCHAR(100),
    Qualification VARCHAR(50),
    Experience INT,
    Domain VARCHAR(50)
);

ALTER TABLE Student
ADD CONSTRAINT fk_batch
FOREIGN KEY (Batch_Code) REFERENCES Batch(Batch_Code);

ALTER TABLE Student
ADD CONSTRAINT fk_trainer
FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID);

ALTER TABLE Fees
ADD CONSTRAINT fk_student
FOREIGN KEY (Rn) REFERENCES Student(Rn);

INSERT INTO Batch VALUES
(101, 'Java', '6 Months', 'Core Java'),
(102, 'Python', '4 Months', 'Python Full Course');

INSERT INTO Trainer VALUES
(1, 'Amit', 'Delhi', 'MCA', 5, 'Java'),
(2, 'Neha', 'Noida', 'B.Tech', 4, 'Python');

INSERT INTO Student VALUES
(1, 'Pallavi', 'Gurgaon', 85, '1999-10-18', 101, 1),
(2, 'Payal', 'Delhi', 78, '2000-05-20', 102, 2),
(3, 'Aman', 'Noida', 90, '2001-07-15', 101, 1);

INSERT INTO Fees VALUES
(25000, '2026-05-01', 1),
(20000, '2026-05-03', 2),
(25000, '2026-05-05', 3);

-- Q-1
SELECT s.Name, s.Address, b.Batch_Code, b.Batch_Name,
t.Trainer_Name, b.Duration
FROM Student s
JOIN Batch b ON s.Batch_Code = b.Batch_Code
JOIN Trainer t ON s.Trainer_ID = t.Trainer_ID;

-- Q-2
SELECT s.Name, f.Fees_Paid, f.Date_Paid
FROM Student s
JOIN Fees f ON s.Rn = f.Rn;

-- Q-3
SELECT DISTINCT b.Batch_Code,b.Batch_Name,t.*
FROM Batch b
JOIN Student s ON b.Batch_Code=s.Batch_Code
JOIN Trainer t ON s.Trainer_ID=t.Trainer_ID;