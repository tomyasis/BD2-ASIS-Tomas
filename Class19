#1
create user 'data_analyst'@'localhost' identified by 'tomyasis';

#2
grant select, update, delete on sakila.* to 'data_analyst'@'localhost';

#3
create table tabla_practica
(id int auto_increment primary key);
-- ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'tabla_practica'

#4
update film
set title = 'EL-MAS-GRANDE' where film_id = 10;
-- Query OK, 1 row affected (0.03 sec) Rows matched: 1  Changed: 1  Warnings: 0

#5
revoke update on sakila.* from 'data_analyst'@'localhost';
-- Query OK, 0 rows affected, 1 warning (0.00 sec)

#6
update film 
set title = 'RIVER-PLATE' where film_id = 20;
-- ERROR 1142 (42000) UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'


#ASIS TOMAS 7C
