create table players1(ID int(11), name1 varchar(255),Age int(3),Nationality varchar(255),Overall int(11),Potential int(11) ,Club	 varchar(255),Value1 int(11)	,Wage int(11),PreferredFoot enum('Right','Left')  ,JerseyNumber	 int(11) ,Joined  date	,Height varchar(255)	,Weight int(11)	,Penalties int(11));
desc players1;
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
select * from players1;

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













