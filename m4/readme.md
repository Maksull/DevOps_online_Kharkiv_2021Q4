After installing ***mysql*** on the station I *need to login*, I used:  
```
mysql -u root
```
I wanted to login using password, so I **changed the password**:  
```
mysqladmin -u root password 'write_password'
```
After that I can use:  
```
mysql -p
```
To display **mysql status**, I used:  
```
status;
\s
```
![MYSQL status](screenshots/mysql_status.png)  
In order to ***see the existing databases***, I used:  
```
SHOW DATABASES;
```
![Show databases](screenshots/show_databases.png)  
Then I created a new database and display the result of it: 
```
CREATE DATABASE test;
SHOW DATABASES;
```
![Create database](screenshots/create_database.png)  
After creating database I needed to ***use*** it:  
![Use database](screenshots/use_database.png)  
To ***create table*** and display the result of it, I used:  
```
CREATE TABLE users (id INT(5) AUTO_INCREMENT PRIMARY KEY, name VARCHAR(64), surname VARCHAR(64), age TINYINT(3), 
email VARCHAR(64), status VARCHAR(128)) DEFAULT CHARACTER SET UTF8;

SHOW TABLES;
```
![Show tables](screenshots/show_tables.png)  
Then I decided to check the table:  
```
DESCRIBE users;
```
![Describe table](screenshots/describe_table.png)  
After finding out that everything is fine, I began to ***fill in the table***:  
```
INSERT INTO users VALUES ('1', 'Maksym', 'Yuhov' '17', 'kyrkyrkyr99@gmail.com', 'work');
SELECT * FROM users
```
![Fill in the table](screenshots/insert_select.png)  
Then I added some new users and display the result:  
```
INSERT INTO users VALUES (NULL, 'Oleksii', 'Oko' '23', 'oo.oko@gmail.com', 'vacation');
INSERT INTO users VALUES (NULL, 'Kirill', 'Suskorov' '20', 'k.suskorov@gmail.com', 'work');
INSERT INTO users VALUES (NULL, 'Dima', 'Kolo' '18', 'd.kolo@gmail.com', 'business trip');
SELECT * FROM users
```
![Some inserts](screenshots/after_some_inserts.png)  
To see pesons over 18 years old, I used ***WHERE***:  
```
SELECT * FROM users WHERE age > 18;
```
![SQL WHERE](screenshots/sql_where.png)  
In order to count the number of people of a certain age, I used ***GROUP BY***:
```
SELECT age, COUNT(*) as count FROM users WHERE age > 16 GROUP BY age;
```
![SQL GROUP BY](screenshots/sql_group_by.png)  
To sort persons by age, I used ***ORDER BY***:
```
SELECT * FROM users WHERE id > 0 ORDER BY age;
```
![SQL ORDER BY](screenshots/sql_order_by.png)  



