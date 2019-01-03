INSERT INTO Skill VALUES ('PG1', 'Java', 'Programming');
INSERT INTO Skill VALUES ('PG2', 'SQL', 'Programming');
INSERT INTO Skill VALUES ('VS1', 'Tableau', 'Visualization');
INSERT INTO Skill VALUES ('ST1', 'Minitab', 'Statistics');
INSERT INTO Skill VALUES ('PG3', 'Python', 'Programming');
INSERT INTO Skill VALUES ('VS2', 'PowerBI', 'Visualization');
INSERT INTO Skill VALUES ('ST2', 'SAS', 'Statistics');
INSERT INTO Skill VALUES ('GP1', 'Photoshop', 'Graphic');
INSERT INTO Skill VALUES ('GP2', 'Illustrator', 'Graphic');
INSERT INTO Skill VALUES ('MK1', 'Communication', 'Marketing');
INSERT INTO Skill VALUES ('MK2', 'Negotiation', 'Marketing');


INSERT INTO Department VALUES ('1', 'IT', 'Floor 1', '121-5689', NULL);
INSERT INTO Department VALUES ('2', 'Analytics', 'Floor 2', '121-2345', NULL);
INSERT INTO Department VALUES ('3', 'Administration', 'Floor 3', '121-2346', NULL);
INSERT INTO Department VALUES ('4', 'Finance', 'Floor 4', '121-2347', NULL);
INSERT INTO Department VALUES ('5', 'HR', 'Floor 5', '121-2348', NULL);
INSERT INTO Department VALUES ('6', 'Marketing', 'Floor 6', '121-2349', NULL);
INSERT INTO Department VALUES ('7', 'Research', 'Floor 7', '121-2350', NULL);
INSERT INTO Department VALUES ('8', 'Executive', 'Floor 8', '121-2351', NULL);


INSERT INTO Employee VALUES (1, 'Lee', 'Ming', '18-MAR-1963', '6-MAR-2005', NULL,'1');
INSERT INTO Employee VALUES (2, 'Tsai', 'Webber', '22-MAY-1970', '18-APR-2016', NULL,'1');
INSERT INTO Employee VALUES (3, 'Wang', 'Oscar', '28-FEB-1992', '18-JUL-2017', NULL,'1');
INSERT INTO Employee VALUES (4, 'Chiang', 'Wendy', '20-May-1992', '03-JUN-2016', NULL,'1');
INSERT INTO Employee VALUES (5, 'Lin', 'Amy', '07-DEC-1980', '20-APR-2015', NULL,'3');
INSERT INTO Employee VALUES (6, 'Ayers', 'Len', '28-NOV-1989', '20-JAN-2018', NULL,'3');
INSERT INTO Employee VALUES (7, 'Prince', 'Noelle', '25-JUN-1995', '05-DEC-2016', NULL,'2');
INSERT INTO Employee VALUES (8, 'Rivers', 'Simon', '04-OCT-1985', '17-AUG-2014', NULL,'2');
INSERT INTO Employee VALUES (9, 'Hendrix', 'Kai', '17-AUG-1990', '25-FEB-2015', NULL,'2');
INSERT INTO Employee VALUES (10, 'Crosby', 'Sebastian', '06-SEP-1975', '28-JUN-2017', NULL,'2');
INSERT INTO Employee VALUES (11, 'Sherman', 'Cora', '14-JUN-1987', '16-APR-2014', NULL,'3');
INSERT INTO Employee VALUES (12, 'Hardin', 'Forrest', '03-JAN-1993', '12-OCT-2013', NULL,'3');
INSERT INTO Employee VALUES (13, 'Hunt', 'Tad', '09-FEB-1960', '08-MAY-2015', NULL,'1');
INSERT INTO Employee VALUES (14, 'Lowe', 'Derek', '27-JUL-1973', '26-NOV-2016', NULL,'6');
INSERT INTO Employee VALUES (15, 'Walter', 'Zephania', '20-MAY-1988', '13-JAN-2014', NULL,'4');
INSERT INTO Employee VALUES (16, 'Lowery', 'Tanya', '09-SEP-1990', '08-JUN-2015', NULL,'4');
INSERT INTO Employee VALUES (17, 'Ray', 'Amos', '24-NOV-1982', '20-JUN-2017', NULL,'4');
INSERT INTO Employee VALUES (18, 'Church', 'Blaine', '05-APR-1988', '28-MAR-2018', NULL,'5');
INSERT INTO Employee VALUES (19, 'Stark', 'Ava', '27-AUG-1970', '19-JUL-2013', NULL,'5');
INSERT INTO Employee VALUES (20, 'Stevenson', 'Lev', '12-May-1978', '02-MAR-2018', NULL,'5');
INSERT INTO Employee VALUES (21, 'Sherman', 'Dale', '04-OCT-1977', '14-SEP-2015', NULL,'5');
INSERT INTO Employee VALUES (22, 'Salinas', 'Herman', '05-MAY-1994', '06-DEC-2016', NULL,'6');
INSERT INTO Employee VALUES (23, 'Bond', 'Idola', '18-MAR-1982', '06-APR-2014', NULL,'6');
INSERT INTO Employee VALUES (24, 'Arnold', 'Otto', '21-MAY-1973', '29-JUL-2013', NULL,'2');
INSERT INTO Employee VALUES (25, 'French', 'Linda', '29-MAR-1985', '30-AUG-2015', NULL,'6');
INSERT INTO Employee VALUES (26, 'Brewer', 'Eden', '13-OCT-1976', '01-OCT-2015', NULL,'4');
INSERT INTO Employee VALUES (27, 'Aguilar', 'Vernon', '03-NOV-1990', '23-APR-2018', NULL,'7');
INSERT INTO Employee VALUES (28, 'Leon', 'Mara', '01-JAN-1963', '08-JUN-2017', NULL,'7');
INSERT INTO Employee VALUES (29, 'Faulkner', 'Wesley', '08-DEC-1977', '01-NOV-2014', NULL,'3');
INSERT INTO Employee VALUES (30, 'Wyatt', 'Aquila', '02-MAY-1983', '22-OCT-2015', NULL,'7');
INSERT INTO Employee VALUES (31, 'Allen', 'Holloway', '04-Mar-1961', '13-Sep-2012', NULL,'8');



UPDATE Department SET Manager_ID = 13 WHERE Dept_Code ='1';
UPDATE Department SET Manager_ID = 24 WHERE Dept_Code = '2';
UPDATE Department SET Manager_ID = 29 WHERE Dept_Code = '3';
UPDATE Department SET Manager_ID = 26 WHERE Dept_Code = '4';
UPDATE Department SET Manager_ID = 19 WHERE Dept_Code = '5';
UPDATE Department SET Manager_ID = 14 WHERE Dept_Code = '6';
UPDATE Department SET Manager_ID = 28 WHERE Dept_Code = '7';
UPDATE Department SET Manager_ID = 31 WHERE Dept_Code = '8';


UPDATE Employee SET Super_ID = 13 WHERE EMP_NUM =1;
UPDATE Employee SET Super_ID = 4 WHERE EMP_NUM =2;
UPDATE Employee SET Super_ID = 4 WHERE EMP_NUM =3;
UPDATE Employee SET Super_ID = 13 WHERE EMP_NUM =4;
UPDATE Employee SET Super_ID = 29 WHERE EMP_NUM =5;
UPDATE Employee SET Super_ID = 29 WHERE EMP_NUM =6;
UPDATE Employee SET Super_ID = 24 WHERE EMP_NUM =7;
UPDATE Employee SET Super_ID = 24 WHERE EMP_NUM =8;
UPDATE Employee SET Super_ID = 8 WHERE EMP_NUM =9;
UPDATE Employee SET Super_ID = 8 WHERE EMP_NUM =10;
UPDATE Employee SET Super_ID = 5 WHERE EMP_NUM =11;
UPDATE Employee SET Super_ID = 5 WHERE EMP_NUM =12;
UPDATE Employee SET Super_ID = 31 WHERE EMP_NUM =13;
UPDATE Employee SET Super_ID = 31 WHERE EMP_NUM =14;
UPDATE Employee SET Super_ID = 26 WHERE EMP_NUM =15;
UPDATE Employee SET Super_ID = 17 WHERE EMP_NUM =16;
UPDATE Employee SET Super_ID = 26 WHERE EMP_NUM =17;
UPDATE Employee SET Super_ID = 21 WHERE EMP_NUM =18;
UPDATE Employee SET Super_ID = 31 WHERE EMP_NUM =19;
UPDATE Employee SET Super_ID = 19 WHERE EMP_NUM =20;
UPDATE Employee SET Super_ID = 19 WHERE EMP_NUM =21;
UPDATE Employee SET Super_ID = 14 WHERE EMP_NUM =22;
UPDATE Employee SET Super_ID = 14 WHERE EMP_NUM =23;
UPDATE Employee SET Super_ID = 31 WHERE EMP_NUM =24;
UPDATE Employee SET Super_ID = 23 WHERE EMP_NUM =25;
UPDATE Employee SET Super_ID = 31 WHERE EMP_NUM =26;
UPDATE Employee SET Super_ID = 28 WHERE EMP_NUM =27;
UPDATE Employee SET Super_ID = 31 WHERE EMP_NUM =28;
UPDATE Employee SET Super_ID = 31 WHERE EMP_NUM =29;
UPDATE Employee SET Super_ID = 27 WHERE EMP_NUM =30;



INSERT INTO Training VALUES (1, 'PG1', 1, 'Data Structures', '15-Oct-2017', 'elit, pretium');
INSERT INTO Training VALUES (2, 'PG1', 5, 'Data Structures', '16-Mar-2017', 'vulputate velit eu sem.');
INSERT INTO Training VALUES (3, 'MK1', 8, 'Speaking', '21-Oct-2015', 'sed tortor. Integer');
INSERT INTO Training VALUES (4, 'ST2', 9, 'Inferential Statistics', '18-Aug-2016', 'egestas. Aliquam nec enim. Nunc');
INSERT INTO Training VALUES (5, 'MK1', 2, 'Professional Writing', '17-Oct-2017', 'quam a felis ullamcorper');
INSERT INTO Training VALUES (6, 'PG1', 11, 'Cloud Computing', '4-Mar-2016', 'quis');
INSERT INTO Training VALUES (7, 'PG2', 5, 'Database Management', '25-Jun-2016', 'ipsum');
INSERT INTO Training VALUES (8, 'PG3', 13, 'Data Mining', '24-Sep-2016', 'nulla. Integer vulputate,');
INSERT INTO Training VALUES (9, 'GP1', 1, 'Photoshop', '15-Mar-2017', 'pede,');
INSERT INTO Training VALUES (10, 'GP1', 11, 'Photoshop', '17-Jun-2017', 'Donec sollicitudin adipiscing ligula.');
INSERT INTO Training VALUES (11, 'ST2', 1, 'Inferential Statistics', '17-Mar-2014', 'congue, elit');
INSERT INTO Training VALUES (12, 'PG2', 21, 'Database Management', '15-Jun-2018', 'malesuada fames ac');
INSERT INTO Training VALUES (13, 'PG2', 13, 'Database Management', '29-Dec-2017', 'fringilla euismod enim. Etiam');
INSERT INTO Training VALUES (14, 'VS1', 21, 'Data Visualization', '20-Sep-2016', 'venenatis a, magna. Lorem');
INSERT INTO Training VALUES (15, 'ST2', 5, 'Inferential Statistics', '6-Jan-2018', 'Nam consequat dolor vitae');
INSERT INTO Training VALUES (16, 'PG1', 5, 'Cloud Computing', '9-Mar-2018', 'cursus et, eros.');
INSERT INTO Training VALUES (17, 'MK1', 23, 'Speaking', '10-Jul-2018', 'metus eu');
INSERT INTO Training VALUES (18, 'PG1', 23, 'JavaFX', '14-Sep-2015', 'eu erat semper rutrum. Fusce');
INSERT INTO Training VALUES (19, 'PG1', 9, 'Data Structures', '30-Nov-2016', 'eu');
INSERT INTO Training VALUES (20, 'MK1', 2, 'Professional Writing', '18-Dec-2016', 'ligula. Aliquam erat volutpat.');
INSERT INTO Training VALUES (21, 'ST2', 1, 'Inferential Statistics', '6-Mar-2017', 'sodales purus, in');
INSERT INTO Training VALUES (22, 'PG2', 19, 'Database Management', '23-Mar-2018', 'commodo');
INSERT INTO Training VALUES (23, 'GP1', 9, 'Photoshop', '27-Jul-2016', 'eleifend');
INSERT INTO Training VALUES (24, 'PG2', 12, 'Database Management', '24-Mar-2014', 'Aliquam erat volutpat. Nulla dignissim.');
INSERT INTO Training VALUES (25, 'MK2', 25, 'Financial Accounting', '6-Aug-2016', 'bibendum ullamcorper. Duis cursus, diam');
INSERT INTO Training VALUES (26, 'PG2', 15, 'Database Management', '14-Mar-2017', 'non enim commodo hendrerit.');
INSERT INTO Training VALUES (27, 'MK1', 1, 'Speaking', '6-Dec-2017', 'ut');
INSERT INTO Training VALUES (28, 'PG1', 2, 'Data Structures', '20-May-2017', 'Cum sociis');
INSERT INTO Training VALUES (29, 'PG1', 22, 'Data Structures', '26-Nov-2016', 'Mauris');
INSERT INTO Training VALUES (30, 'MK1', 26, 'Speaking', '5-Nov-2016', 'eu, accumsan sed, facilisis vitae,');
INSERT INTO Training VALUES (31, 'PG1', 24, 'JavaFX', '25-Feb-2014', 'natoque');
INSERT INTO Training VALUES (32, 'ST2', 29, 'Inferential Statistics', '25-May-2016', 'enim. Etiam gravida');
INSERT INTO Training VALUES (33, 'PG3', 26, 'Data Mining', '23-Nov-2015', 'Curabitur sed tortor. Integer aliquam');
INSERT INTO Training VALUES (34, 'PG1', 23, 'Cloud Computing', '23-Jun-2017', 'placerat, augue. Sed molestie. Sed');
INSERT INTO Training VALUES (35, 'MK2', 25, 'Financial Accounting', '10-Mar-2017', 'ligula elit,');
INSERT INTO Training VALUES (36, 'MK1', 2, 'Professional Writing', '27-Feb-2017', 'semper et,');
INSERT INTO Training VALUES (37, 'ST2', 29, 'Inferential Statistics', '2-Mar-2018', 'interdum. Nunc sollicitudin');
INSERT INTO Training VALUES (38, 'PG1', 12, 'Data Structures', '10-Aug-2015', 'massa');
INSERT INTO Training VALUES (39, 'PG1', 24, 'Cloud Computing', '5-Feb-2017', 'dui. Suspendisse ac metus vitae');
INSERT INTO Training VALUES (40, 'PG1', 5, 'JavaFX', '30-Apr-2018', 'convallis, ante lectus');
INSERT INTO Training VALUES (41, 'PG1', 30, 'Cloud Computing', '9-May-2017', 'risus. In mi pede,');
INSERT INTO Training VALUES (42, 'MK1', 19, 'Speaking', '9-Mar-2018', 'imperdiet, erat');
INSERT INTO Training VALUES (43, 'PG1', 30, 'JavaFX', '2-Jun-2016', 'tincidunt, neque');
INSERT INTO Training VALUES (44, 'MK1', 30, 'Speaking', '20-Jan-2017', 'tempus, lorem fringilla ornare');
INSERT INTO Training VALUES (45, 'PG2', 2, 'Database Management', '17-Sep-2017', 'a, auctor non, feugiat nec,');
INSERT INTO Training VALUES (46, 'PG2', 8, 'Database Management', '10-May-2015', 'in, cursus et,');
INSERT INTO Training VALUES (47, 'ST2', 29, 'Inferential Statistics', '18-Jul-2017', 'senectus et netus et');
INSERT INTO Training VALUES (48, 'GP1', 19, 'Photoshop', '5-Jul-2017', 'magna. Suspendisse tristique neque venenatis');
INSERT INTO Training VALUES (49, 'GP1', 12, 'Photoshop', '30-Jan-2017', 'fringilla');


INSERT INTO Client VALUES (1,'Costco','152-6852 Magna. Ave','Tomaszów Mazowiecki', 'CA', '46261', 'Retail', 'https://www.costco.com', '396-1414', 'Emily Chiu' );
INSERT INTO Client VALUES (2,'Airbnb','Ap #541-3031 Gravida. Road','Berlin', 'PA', '61374', 'Online', 'https://www.airbnb.gov', '478-8094', 'Shelly Lin' );
INSERT INTO Client VALUES (3,'HP','2440 Accumsan Road','Baidyabati', 'NY', '16286', 'Computer Hardware', 'https://www.hp.edu', '628-2631', 'Peter Tsai' );
INSERT INTO Client VALUES (4,'Visa','7387 Ac Ave','Pescantina', 'AK', '65390', 'Finance Service', 'https://www.usa.visa.com', '750-4730', 'Barbie Weng' );
INSERT INTO Client VALUES (5,'FirstData','P.O. Box 479, 7103 Tristique Road','Haguenau', 'AZ', '86764', 'Analytics', 'https://www.FirstData.com', '468-4480', 'Kennan Contreras' );
INSERT INTO Client VALUES (6,'Amazon','Ap #747-5765 Amet Avenue','Borås', 'AR', '67959', 'Online', 'https://www.Amazon.gov', '745-8627', 'Wylie Lowe' );
INSERT INTO Client VALUES (7,'Facebook','P.O. Box 912, 3960 Nascetur Av.','LaSalle', 'CA', '96794', 'Online', 'http://www.Facebook.com', '613-5881', 'Levi Ewing' );
INSERT INTO Client VALUES (8,'Instagram','9151 Eu Rd.','Dublin', 'GA', '82549', 'Online', 'https://www.Instagram.edu', '433-9633', 'Kelly Rutledge' );
INSERT INTO Client VALUES (9,'P and G','P.O. Box 203, 304 Tellus. St.','Mazy', 'ID', '22683', 'FMCG', NULL, '363-3000', 'Bevis Sullivan' );
INSERT INTO Client VALUES (10,'Target','Ap #253-834 Nec, Avenue','Las Vegas', 'IL', '65102', 'Retail', 'https://www.Target.org', '858-2058', 'Quentin Burnett' );
INSERT INTO Client VALUES (11,'Audi','763-685 Hendrerit Road','Medemblik', 'KS', '24429', 'Retail', 'https://www.Audi.net', '671-0607', 'Phelan Baird' );


INSERT INTO Project VALUES (1,'Cras Convallis Convallis LLP','24-Sep-2016',888.43,'6',1,'MK2');
INSERT INTO Project VALUES (2,'Tristique Consulting','11-Nov-2017',3.82,'1',5,'ST2');
INSERT INTO Project VALUES (3,'Erat Inc.','13-Apr-2018',807.83,'4',1,'PG3');
INSERT INTO Project VALUES (4,'Ligula Tortor Dictum Institute','9-Dec-2016',18.21,'2',6,'GP1');
INSERT INTO Project VALUES (5,'Non Justo Proin Corp.','25-Apr-2017',479.96,'1',10,'ST2');
INSERT INTO Project VALUES (6,'Turpis Associates','5-May-2017',457.5,'2',10,'ST2');
INSERT INTO Project VALUES (7,'Cursus Associates','23-Mar-2016',167.62,'4',9,'PG3');
INSERT INTO Project VALUES (8,'Eget Corp.','3-Jan-2018',967.41,'5',6,'VS1');
INSERT INTO Project VALUES (9,'Leo Vivamus Nibh Consulting','21-Jun-2016',427.67,'6',9,'PG1');
INSERT INTO Project VALUES (10,'Sem LLP','2-Dec-2015',830.97,'2',9,'PG2');
INSERT INTO Project VALUES (11,'Nec LLP','07-Jul-2018',NULL,'5',1,'VS1');
INSERT INTO Project VALUES (12,'Instavisual Tech','12-Jul-2018',279.67,'5',10,'VS1');




INSERT INTO Assignment VALUES (1,1,25,'25-Sep-2016','30-Sep-2016',25);
INSERT INTO Assignment VALUES (2,1,25,'01-Oct-2016','15-Oct-2016',80);
INSERT INTO Assignment VALUES (3,2,1,'12-Nov-2017','25-Nov-2017',63);
INSERT INTO Assignment VALUES (4,2,2,'15-Nov-2017','29-Nov-2017',78);
INSERT INTO Assignment VALUES (5,2,3,'25-Nov-2017','30-Nov-2017',32);
INSERT INTO Assignment VALUES (6,2,3,'01-Dec-2017','07-Dec-2017',43);
INSERT INTO Assignment VALUES (7,3,26,'14-Apr-2018','28-Apr-2018',58);
INSERT INTO Assignment VALUES (8,4,9,'10-Dec-2016','25-Dec-2016',80);
INSERT INTO Assignment VALUES (9,4,8,'20-Dec-2016','25-Dec-2016',24);
INSERT INTO Assignment VALUES (10,5,1,'26-Apr-2017','30-Apr-2017',25);
INSERT INTO Assignment VALUES (11,5,1,'01-May-2017','15-May-2017',48);
INSERT INTO Assignment VALUES (12,5,2,'05-May-2017','18-May-2017',52);
INSERT INTO Assignment VALUES (13,6,9,'6-May-2017','22-May-2017',73);
INSERT INTO Assignment VALUES (14,6,8,'10-May-2017','22-May-2017',47);
INSERT INTO Assignment VALUES (15,7,26,'26-Mar-2016','31-Mar-2016',18);
INSERT INTO Assignment VALUES (16,7,26,'01-Apr-2016','15-Apr-2016',76);
INSERT INTO Assignment VALUES (17,7,16,'02-Apr-2016','13-Apr-2016',67);
INSERT INTO Assignment VALUES (18,8,21,'05-Jan-2018','28-Jan-2018',100);
INSERT INTO Assignment VALUES (19,8,19,'05-Jan-2018','16-Jan-2018',59);
INSERT INTO Assignment VALUES (20,9,23,'24-Jun-2016','30-Jun-2016',38);
INSERT INTO Assignment VALUES (21,9,23,'01-Jul-2016','15-Jul-2016',99);
INSERT INTO Assignment VALUES (22,9,25,'05-Jul-2016','22-Jul-2016',103);
INSERT INTO Assignment VALUES (23,10,8,'6-Dec-2015','31-Dec-2015',125);
INSERT INTO Assignment VALUES (24,10,8,'1-Jan-2016','25-Jan-2016',119);
INSERT INTO Assignment VALUES (25,10,24,'5-Jan-2016','28-Jan-2016',109);
INSERT INTO Assignment VALUES (26,10,24,'4-Feb-2016','28-Feb-2016',70);
INSERT INTO Assignment VALUES (27,10,9,'1-Mar-2016','20-Mar-2016',96);
INSERT INTO Assignment VALUES (28,11,21,'13-Jul-2018',NULL, NULL);
INSERT INTO Assignment VALUES (29,11,19,'15-Jul-2018','20-Jul-2018',30);
INSERT INTO Assignment VALUES (30,12,19,'14-Jul-2018','19-Jul-2018',45);



COMMIT;
