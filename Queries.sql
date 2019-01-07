--Query 1--
/*Due to a change in tax regulations, the company now must charge 7% tax on all completed projects 
that have had employees assigned within the past six months (i.e., 180 days). 
Update all completed projects that have had employees assigned in the past 180 days, 
to increase the total cost by 7%. Show the update statement and the content of the project table before and after the update.*/

PDATE Project
SET Total_Cost = Total_Cost * 1.07
WHERE Proj_Number IN (SELECT a.Proj_Number pj
					  FROM Assignment a
					  WHERE SYSDATE - a.Date_Assigned <= 180
MINUS
SELECT a.Proj_Number
FROM Assignment a
WHERE a.Date_Ended IS NULL);

--Query 2--
/*Due to a recent re-organization, the company needs a list that shows who supervises who. 
List all the employees in the company clearly indicating the organizational hierarchy. 
Include the “level” of the hierarchy each employee is at and the department name of the employee.*/

SELECT LEVEL,
	   LPAD(' ', 3*(LEVEL - 1)) || Emp_Num || ' ' || Fname || ' ' || Lname "Employee",
	   e.Dept_Code, d.Name
FROM Employee e
JOIN Department d ON e.Dept_Code = d.Dept_Code
START WITH Emp_Num = 31
CONNECT BY PRIOR Emp_Num = Super_ID;

--Query 3--
/* For each employee hired last year list the name and the hire date of the employee, 
number of projects he or she has been assigned to since the hire date, 
and the number of days between the hire date and the date of first assignment.*/
SELECT e.Fname || ' ' || e.LName "Name", e.Hire_Date,
       COUNT(DISTINCT a.Proj_Number) "Project#",
       MIN(a.Date_Assigned) - e.Hire_Date "Days_Between"
FROM Employee e
LEFT JOIN Assignment a ON e.Emp_Num = a.Emp_Num
WHERE EXTRACT (YEAR FROM e.Hire_Date)  = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY e.Fname, e.Lname, e.Hire_Date;

--Query 4--
/* Who had more than one training associated with the same skill? 
List the employee’s name, employee’s department, name of the skill acquired,
number of the trainings for that skill, and number of days since the last training was taken.*/

SELECT t.Emp_Num, e.Fname || ' ' || e.Lname "Emp_Name",
       d.Name "Dept_Name", s.Name "Skill", COUNT(t.Train_Num) "Training#",
       TO_CHAR((SYSDATE - MAX(t.Date_Acquired)), '9990.9') "#Days"
FROM Training t
JOIN Skill s ON t.Code = s.Code
JOIN Employee e ON t.Emp_Num = e.Emp_Num
JOIN Department d ON e.Dept_Code = d.Dept_Code
GROUP BY t.Emp_Num, e.Fname || ' ' || e.Lname , s.Name, d.Name
HAVING COUNT(*) >= 2;

--Query 5--
/* For each project completed this year provide the following information: project name, client name, industry (represented by the client), 
project earning (i.e., assume that the project total cost is the earning at the time of completion), and the number of hours that were spent on the project. 
For each industry provide the average number of earning per project and average hours per project.*/

SELECT DECODE(proj_name, null, industry|| ' Industry Average', industry) "Industry", proj_name, client,
       TO_CHAR(AVG(earning), '$99990.99') earning,
       TO_CHAR(AVG(Hours_Used), '990.9') Hours
FROM(
SELECT c.Industry industry, p.Name Proj_Name, c.Name Client,
       p.total_cost earning,
        SUM(a.Hours_Used) Hours_Used
        FROM Project p
        JOIN Assignment a ON p.Proj_Number = a.Proj_Number
        JOIN Client c ON p.Client_ID = c.Client_ID
        WHERE p.total_cost IS NOT NULL
        HAVING EXTRACT (YEAR FROM MAX(a.Date_Ended)) = EXTRACT(YEAR FROM SYSDATE)
        GROUP BY p.Name, c.Name, c.Industry, p.Total_Cost)
GROUP BY GROUPING SETS (industry, (industry, Proj_Name, client))
ORDER BY 1, 2;

--Query 6--
/* List project(s) with at least three monthly assignment records and with no less than 60 days in the top three records/months. 
Also list the total number of days for those projects.*/

Select Proj_Number, Name, total_days
FROM (Select *
	  FROM (Select proj_number, name, assign_num, date_assigned, date_ended, hours_used,
                   RANK() OVER (PARTITION BY proj_number ORDER BY date_assigned DESC) Rank,
                   COUNT(assign_num) OVER (PARTITION BY proj_number) Count_of_records,
                   SUM(CASE WHEN date_ended IS NULL THEN SYSDATE - date_assigned
                   ELSE date_ended-date_assigned END) OVER (PARTITION BY proj_number) total_days
             FROM project JOIN assignment USING (proj_number)
             order by proj_number) table1
WHERE (table1.Count_of_records>=3 AND table1.Rank<4)
     ) table2
GROUP BY Proj_Number, Name, total_days
HAVING SUM(DECODE(date_ended, NULL, SYSDATE, date_ended) - date_assigned) > 60;

--Query 7--
/* For planning of upcoming person-hour needs, 
a manager requested a query to show how many hours were spent on projects by the employees within the past nine months in his department. 
Show department name and total number of hours charged by employees of that department during that time. Include all departments.*/

SELECT name "Dept_Name", SUM(Hours) "TTL_Hours"
FROM(
	   SELECT d.Name name,
              CASE WHEN MONTHS_BETWEEN(SYSDATE, Date_Assigned) <= 9 THEN SUM(a.Hours_Used)
              ELSE 0 END  Hours
       FROM Assignment a
       RIGHT JOIN Employee e ON a.Emp_Num = e.Emp_Num
       JOIN Department d ON e.Dept_Code = d.Dept_Code
       GROUP BY d.Name, a.Date_Assigned
     )
GROUP BY name
ORDER BY 2 DESC;

--Query 8--
/* For each project, started in the first quarter of 2016, provide the following information: 
The start date, date of the first assignment, date of completion (or display “ongoing” if not completed), 
number of employees assigned to the project, and the number of hours spent on the project.*/


SELECT p.Proj_Number, p.Name, p.Start_Date "Start_Date",
       DECODE( MIN(a.Date_Assigned), NULL, 'No assignment', MIN(a.Date_Assigned)) "1st_Assign_Date",
       CASE WHEN p.Proj_Number IN  (SELECT DISTINCT p.Proj_Number
									FROM Project p
									JOIN Assignment a ON p.Proj_Number = a.Proj_Number
									WHERE a.Date_Ended IS NULL) THEN 'ongoing'
			ELSE TO_CHAR(MAX(a.Date_Ended),'DD-MON-YYYY') END AS "Comple_Date",
       COUNT(DISTINCT a.Emp_Num) "Employee#", 
       SUM(a.Hours_Used) "TTL_Hours"
FROM Project p
JOIN Assignment a ON p.Proj_Number = a.Proj_Number
WHERE p.Start_Date BETWEEN '01-JAN-2016' AND '31-MAR-2016'
GROUP BY p.Proj_Number, p.Name, p.Start_Date;

--Query 9--
/* We are interested in what types of clients we have. Based on the “web address” information, 
group the client by the type of client (e.g. “edu” indicates an educational institution, 
“gov” a government agency, “org” a non-for-profit organization, and “com” a for-profit company) 1 and 
provide how many clients we have of each type/category and how many project from each type of client. 
If the web address does not match any of the four major types, then use “Other” for the client type. 
If we do not have a web address for a client, then the “client type” should be “Not Available”.*/

SELECT Web_Category, COUNT(DISTINCT clt) "Client#", COUNT(prj) "Project#"
FROM (SELECT p.Proj_Number prj, c.Client_ID clt,
	         CASE
             WHEN c.Web_Address IS NULL THEN 'Not Available'
             WHEN c.Web_Address LIKE '%.edu%' THEN 'Educational Institution'
             WHEN c.Web_Address LIKE '%.gov%' THEN 'Government Agency'
             WHEN c.Web_Address LIKE '%.org%' THEN 'Non-for-profit'
             WHEN c.Web_Address LIKE '%.com%' THEN 'For-profit'
             ELSE 'Other' END AS Web_Category
      FROM Client c
      LEFT JOIN project p ON c.Client_ID = p.Client_ID)
GROUP BY Web_Category;

--Query 10--
/* List names of employees who have not been working on any project within the past 30 days from current date. 
In the result, include employee’s department name and the date when the last assignment ended. 
Sort the output by department name, and employee last name. 
If an employee was never assigned (e.g., newly hired employees might not be assigned yet), 
then display “Never assigned” in the “Date” column*/

SELECT e.Emp_Num, e.FName || ' ' || e.Lname "Name", d.Name,
       CASE WHEN MAX(Date_Assigned) IS NULL THEN 'Never assigned'
            ELSE TO_CHAR(MAX(Date_Assigned),'DD-MON-YYYY') END AS "Date"
FROM Employee e JOIN Department d ON e.Dept_Code = d.Dept_Code
LEFT JOIN Assignment a ON e.Emp_Num = a.Emp_Num
WHERE e.Emp_Num in (SELECT e.Emp_Num er FROM Employee e
	                MINUS
	               (SELECT DISTINCT a.Emp_Num
	               	FROM Assignment a GROUP BY a.Emp_Num HAVING MAX(a.Date_Ended) >= (SYSDATE-30)
	               	UNION
	               	SELECT DISTINCT a.Emp_Num FROM Assignment a WHERE a.Date_Ended IS NULL))
 GROUP BY e.Fname, e.Lname, d.Name, e.Emp_Num
 ORDER BY d.Name, e.Lname;

--Query 11--
/* For the 4 most senior employees provide, the employee ID, last name, hire date, 
the name of department managed by the employee (if any), and the number of employees he or she supervises directly.*/

SELECT emp_num , Lname, hire_date, name, supervised
FROM (SELECT lev, emp_num , Fname, Lname, name, hire_date, supervised
      FROM(
      	SELECT level lev, emp_num , Fname, Lname, dept_code, hire_date,
               (Select count(emp_num)
        FROM Employee e2
        WHERE (e2.super_id = e1.emp_num)) supervised
        FROM employee e1 START WITH emp_num = 31
        CONNECT BY PRIOR emp_num = super_id) emp
      LEFT JOIN Department d ON (emp.emp_num = d.manager_id)
      ORDER BY lev, hire_date)
WHERE ROWNUM<5;

--Query 12--
/* In order to schedule training current employees the company requires information on employees 
who are not assigned on any project after March 2016. List the names of employees and their departments. 
Include the last project the employee was assigned to. Order the result by department name.*/

SELECT a.Emp_Num, e.Fname || ' ' || e.Lname "Name",
       d.Name "Department", p.Name "Project"
FROM Assignment a
JOIN Employee e ON a.Emp_Num = e.Emp_Num
JOIN Department d ON e.Dept_Code = d.Dept_Code
JOIN Project p ON p.Proj_Number = a.Proj_Number
JOIN (SELECT a.Emp_Num nu, MAX(a.Date_Ended) ma
      FROM Assignment a       
      GROUP BY a.Emp_Num) ON nu = a.Emp_Num AND ma = a.Date_Ended
GROUP BY a.Emp_Num, d.Name, p.Name, e.Fname, e.Lname
HAVING MAX(a.Date_Ended) < '01-APR-2016'
UNION
SELECT DISTINCT e.Emp_Num, e.Fname || ' ' || e.Lname "Name",
                d.Name "Department", 'never assigned'
FROM Assignment a
RIGHT JOIN Employee e ON a.Emp_Num = e.Emp_Num
JOIN Department d ON e.Dept_Code = d.Dept_Code
WHERE a.Date_Assigned IS NULL
ORDER BY 3;

--Query 13--
/* For each skill category, list number of trainings employees have had and the number of projects 
that required skills of that category. Include the grand total as last row. */
SELECT decode(category,NULL, 'Grand Total', category)"Skill_category" , 
       COUNT(unique train_num) "Trainings", COUNT(unique proj_number) "Projects"
FROM skill s 
LEFT JOIN training t ON(s.code = t.code)
LEFT JOIN project p ON (s.code = p.code)
GROUP BY grouping sets (category, ());
