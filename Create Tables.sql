DROP TABLE Skill       CASCADE CONSTRAINTS;
DROP TABLE Training    CASCADE CONSTRAINTS;
DROP TABLE Department  CASCADE CONSTRAINTS;
DROP TABLE Employee    CASCADE CONSTRAINTS;
DROP TABLE Client      CASCADE CONSTRAINTS;
DROP TABLE Project     CASCADE CONSTRAINTS;
DROP TABLE Assignment  CASCADE CONSTRAINTS;

CREATE TABLE Skill
(Code           Char(4),
 Name           Varchar2(20),
 Category       Varchar2(20),
 CONSTRAINT Skill_Code_PK PRIMARY KEY (Code));

CREATE TABLE Department
(Dept_Code      Char(4),
 Name           Varchar2(25) NOT NULL,
 Location       Varchar2(20),
 Phone          Char(12) UNIQUE,
 Manager_ID     Number(6),
 CONSTRAINT Department_DeptCode_PK  PRIMARY KEY (Dept_Code));

CREATE TABLE Employee
(Emp_Num        Number(6),
 LName          Varchar2(20),
 FName          Varchar2(20),
 DOB            Date,
 Hire_Date      Date DEFAULT SYSDATE,
 Super_ID       Number(6),
 Dept_Code      Char(4),
 CONSTRAINT Employee_EmpNum_PK  PRIMARY KEY (Emp_Num),
 CONSTRAINT Employee_SuperID_FK  FOREIGN KEY (Super_ID) REFERENCES Employee (Emp_Num),
 CONSTRAINT Employee_DeptCode_FK FOREIGN KEY (Dept_Code) REFERENCES Department (Dept_Code));




CREATE TABLE Training
(Train_Num      Number(6),
 Code           Char(4),
 Emp_Num        Number(6),
 Name           Varchar2(25),
 Date_Acquired  Date DEFAULT SYSDATE,
 Comments       Varchar2(50),
 CONSTRAINT Training_TrainNum_PK PRIMARY KEY (Train_Num),
 CONSTRAINT Training_Code_FK     FOREIGN KEY (Code) REFERENCES Skill (Code),
 CONSTRAINT Training_EmpNum_FK   FOREIGN KEY (Emp_Num) REFERENCES Employee (Emp_Num));



CREATE TABLE Client
(Client_ID      Number(6),
 Name           Varchar2(20) NOT NULL,
 Street         Varchar2(40),
 City           Varchar2(25),
 State          Char(2),
 Zip            Char(5), 
 Industry       Varchar2(25),
 Web_Address    Varchar2(60) UNIQUE,
 Phone          Char(12) UNIQUE,
 ContactName    Varchar2(30), 
 CONSTRAINT  Client_ClientID_PK  PRIMARY KEY (Client_ID),
 CONSTRAINT Client_WebAddress_CK CHECK (LOWER(Web_Address) LIKE 'http%://www.%.%'));




CREATE TABLE Project
(Proj_Number    Number(6),
 Name           Varchar2(40) NOT NULL,
 Start_Date     Date DEFAULT SYSDATE,
 Total_Cost     Number(10,2),
 Dept_Code      Char(4),
 Client_ID      Number(6),
 Code           Char(4),
 CONSTRAINT Project_ProjNumber_PK  PRIMARY KEY (Proj_Number),
 CONSTRAINT Project_DeptCode_FK    FOREIGN KEY (Dept_Code) REFERENCES Department (Dept_Code),
 CONSTRAINT Project_ClientID       FOREIGN KEY (Client_ID) REFERENCES Client (Client_ID),
 CONSTRAINT Project_Code_FK        FOREIGN KEY (Code) REFERENCES Skill (Code),
 CONSTRAINT Project_TotalCost_CK   CHECK (Total_Cost IS NULL OR Total_Cost >= 0));





CREATE TABLE Assignment
(Assign_Num     Number(6),
 Proj_Number    Number(6),
 Emp_Num        Number(6),
 Date_Assigned  Date DEFAULT SYSDATE,
 Date_Ended     Date,
 Hours_Used     Number(3),
 CONSTRAINT Assignment_AssigNum_PK      PRIMARY KEY (Assign_Num),
 CONSTRAINT Assignment_ProjNumber_FK    FOREIGN KEY (Proj_Number) REFERENCES Project (Proj_Number),
 CONSTRAINT Assignment_EmpNum_FK        FOREIGN KEY (Emp_Num) REFERENCES Employee (Emp_Num),
 CONSTRAINT assignment_date_ck  CHECK   (Date_Ended IS NULL OR (EXTRACT (month FROM Date_Ended) = EXTRACT (month FROM Date_Assigned))),
 CONSTRAINT assignment_date_ck2 CHECK (Date_Ended IS NULL OR (Date_Ended - Date_Assigned <= 25)),
 CONSTRAINT assignment_date_ck3 CHECK (Date_Ended IS NULL OR (Date_Ended >= Date_Assigned)),
 CONSTRAINT assignemnt_hour_ck  CHECK (Hours_Used IS NULL OR Hours_Used > 0));



---Alter---
ALTER TABLE Department
ADD CONSTRAINT Department_ManagerID_FK 
    FOREIGN KEY (Manager_ID) REFERENCES Employee (Emp_Num);