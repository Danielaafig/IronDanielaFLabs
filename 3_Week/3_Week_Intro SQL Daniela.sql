#Review the tables in the database.
#Explore tables by selecting all columns from each table or using the in built review features for your client.
#Select one column from a table. Get film titles.
#Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
#5.1 Find out how many stores does the company have?
#5.2 Find out how many employees staff does the company have?
#5.3 Return a list of employee first names only?

select * from sakila.actor;
SELECT title FROM sakila.film;
SELECT title AS Film_list FROM sakila.film;
select * from sakila.film; 
SELECT DISTINCT NAME AS language_new FROM sakila.language;
SELECT store_id FROM sakila.store;
SELECT staff_id FROM sakila.staff;
SELECT first_name FROM sakila.staff;



