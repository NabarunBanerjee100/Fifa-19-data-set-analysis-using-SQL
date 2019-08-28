create table players1(ID int(11), name1 varchar(255),Age int(3),Nationality varchar(255),Overall int(11),Potential int(11) ,Club	 varchar(255),Value1 int(11)	,Wage int(11),PreferredFoot enum('Right','Left')  ,JerseyNumber	 int(11) ,Joined  date	,Height varchar(255)	,Weight int(11)	,Penalties int(11));
desc players1;
/*
+---------------+----------------------+------+-----+---------+-------+
| Field         | Type                 | Null | Key | Default | Extra |
+---------------+----------------------+------+-----+---------+-------+
| ID            | int(11)              | YES  |     | NULL    |       |
| name1         | varchar(255)         | YES  |     | NULL    |       |
| Age           | int(3)               | YES  |     | NULL    |       |
| Nationality   | varchar(255)         | YES  |     | NULL    |       |
| Overall       | int(11)              | YES  |     | NULL    |       |
| Potential     | int(11)              | YES  |     | NULL    |       |
| Club          | varchar(255)         | YES  |     | NULL    |       |
| Value1        | int(11)              | YES  |     | NULL    |       |
| Wage          | int(11)              | YES  |     | NULL    |       |
| PreferredFoot | enum('Right','Left') | YES  |     | NULL    |       |
| JerseyNumber  | int(11)              | YES  |     | NULL    |       |
| Joined        | date                 | YES  |     | NULL    |       |
| Height        | varchar(255)         | YES  |     | NULL    |       |
| Weight        | int(11)              | YES  |     | NULL    |       |
| Penalties     | int(11)              | YES  |     | NULL    |       |
+---------------+----------------------+------+-----+---------+-------+
*/
show databases;
show tables;
LOAD DATA  INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\fifa19-1559720901170.csv" 

INTO TABLE players1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
IGNORE 1 LINES;
desc fifa19;
/*select * from fifa19 limit 20;
use nabarun;
drop table  players1;
ALTER TABLE players1 MODIFY COLUMN name1 VARCHAR(255)
    CHARACTER SET latin2 COLLATE latin2_general_ci  NOT NULL;
    
    CREATE DATABASE fifa CHARACTER SET utf8;
    use fifa;
    ALTER TABLE players1 CONVERT TO CHARACTER SET utf8mb4;
    show tables;
    ALTER TABLE players1 MODIFY COLUMN name1 VARCHAR(255)  
    CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
    describe players1;
    ALTER TABLE players1 MODIFY name1 varchar(255) NULL;
    ALTER TABLE players1 CONVERT TO CHARACTER SET utf8mb4;*/
    SET NAMES utf8mb4; # setting the connection encoding
/*ALTER DATABASE fifa CHARACTER SET = latin1 COLLATE = latin1_general_ci;
SHOW VARIABLES WHERE Variable_name LIKE 'character\_set\_%' OR Variable_name LIKE 'collation%';*/
SET NAMES utf8;
select * from players1 limit 5;
/*
# ID, name1, Age, Nationality, Overall, Potential, Club, Value1, Wage, PreferredFoot, JerseyNumber, Joined, Height, Weight, Penalties
158023, L. Messi, 31, Argentina, 94, 94, FC Barcelona, 110500000, 565000, Left, 10, 2004-07-01, 5'7, 159, 75
20801, Cristiano Ronaldo, 33, Portugal, 94, 94, Juventus, 77000000, 405000, Right, 7, 2018-07-10, 6'2, 183, 85
190871, Neymar Jr, 26, Brazil, 92, 93, Paris Saint-Germain, 118500000, 290000, Right, 10, 2017-08-03, 5'9, 150, 81
193080, De Gea, 27, Spain, 91, 93, Manchester United, 72000000, 260000, Right, 1, 2011-07-01, 6'4, 168, 40
192985, K. De Bruyne, 27, Belgium, 91, 92, Manchester City, 102000000, 355000, Right, 7, 2015-08-30, 5'11, 154, 79

*/

# count no of players from the table
select count(ID) from players1;

# no.of nationalities in the data set
select count(distinct Nationality) from players1;

# total wage given to all the players
select sum(Wage) from players1;
/*| sum(Wage) |
+-----------+
| 160073000 |
+-----------+*/
# calculating sum, average and standard deviation of wage
 select sum(Wage) as totalwage ,avg(Wage) as average, std(Wage) as std from players1;
/*+-----------+-----------+--------------------+
| totalwage | average   | std                |
+-----------+-----------+--------------------+
| 160073000 | 9618.0376 | 22262.850062074485 |
+-----------+-----------+--------------------+*/

# from the standard deviation we can infer some players have very high or very low wages
#checking which nationality consists of most players in the data and displaying the top three results
select count(ID) as count,Nationality from players1 group by Nationality order by count desc limit 3;
/*
+-------+-------------+
| count | Nationality |
+-------+-------------+
|  1475 | England     |
|  1151 | Germany     |
|   974 | Spain       |
+-------+-------------+
3 rows in set (0.03 sec)*/

#finding out which player gets the max wage
select max(Wage), name1 from players1; 

# max(Wage), name1
#'565000', 'L. Messi'

# finding out the name of the player with best overall rating
select name1 from players1 where Overall=(select max(Overall) from players1);
/* name1
L. Messi
'Cristiano Ronaldo'*/

#from the results we can infer that there are two players whose overall rating is same

# distribution of players according to their preferred foot

select count(*) as freq ,PreferredFoot from players1 group by PreferredFoot;
/* freq, PreferredFoot
    3820, Left
    12823, Right */
    
    #from the output we can infer that right is the preferred foot of most of the players
    
    # lets try to find out which jersey number which a player adorns is considered luckiest among all
    # we can assume that a player adorning a jersey is considered to be the luckiest if he gets the maximum wage,though  
    # in this question there may be other factors which may have an impact in answering this question
select JerseyNumber,max(Wage) as max,name1 from players1;

/*
# JerseyNumber, max, name1
           10, 565000, L. Messi
           */
  
  # now lets try to find out the  frequency of players with nationality whose club name starts with "M"
  select count(*) as freq, Nationality from players1 where Club like 'M%' group by Nationality order by freq  desc limit 5;
/*
# freq, Nationality
140, England
34, France
33, Australia
32, Mexico
30, Spain
*/
# from the output we can infer that England has maximum players whose club starts with "M"

# checking the frequency of players in a particular timeline
select count(*) from players1 where joined >='2018-05-20' and joined<='2019-04-10';
/* # count(*)
       4543     */
       
#  checking the number of players who joined each day and maximum joinees in a particular day
select count(*) as freq ,date(Joined) from players1  group by date(Joined) order by freq desc limit 3;      
/*
# freq, Joined
1538, 2018-07-01
1133, 2017-07-01
635, 2018-01-01
*/
# maximum number of players had joined on the date 2018-07-01 followed by the players who
#joined on 2017-07-01 and so on.

#checking in which year there were maximum player joinees
select count(*) as freq, year(Joined) from players1 group by year(Joined) order by freq desc limit 3;
/*
# freq, year(Joined)
6566, 2018
4305, 2017
2245, 2016

*/







