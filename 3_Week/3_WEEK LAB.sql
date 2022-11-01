#1)Which actor has appeared in the most films?
#Hint: group by actor_id
use sakila;

select first_name, last_name, count(actor_id) 
from actor as a
inner join film_actor as f using (actor_id) 
group by actor_id
order by count(actor_id) desc
LIMIT 1;
	
#2) Most active customer (the customer that has rented the most number of films)

select first_name, last_name, count(customer_id) 
from customer as a
inner join rental as f using (customer_id) 
group by customer_id
order by count(customer_id) desc
LIMIT 1;

#3)List number of films per category.

select category_id, name, count(film_id) 
from film_category as a
inner join category as f using (category_id) 
group by category_id
order by name asc; 

#4) Display the first and last names, as well as the address, 
#of each staff member.

select first_name, last_name, address_id, address
from address as a
inner join staff as f using (address_id) 
order by last_name asc; 

#5) get films titles where the film language is either English or italian, 
#and whose titles starts with letter "M" , sorted by title descending.

select title, name  
from film
join language using (language_Id) 
where title like"M%" and 
name like  'english' or name like 'italian'
order by title desc;

#6) Display the total amount rung up by each staff member in August of 2005.

select first_name, last_name, round(sum(amount),2) as 'total' from payment
join staff using (staff_id)
where payment_date like "2005-08%"
group by first_name, last_name; 

#7) List each film and the number of actors who are listed for that film.

select title, count(actor_id) as actors_total
from film_actor as a
inner join film as f using (film_id) 
group by title
order by actors_total desc; 

#8) Using the tables payment and customer and the JOIN command, list the total 
#paid by each customer. List the customers alphabetically by last name.

select first_name, last_name, sum(amount) as amount_total
from customer as a
inner join payment as f using (customer_id) 
group by customer_id
order by first_name asc; 

#9) Write sql statement to check if you can find any actor who never 
#particiapted in any film.

select first_name, last_name,title from actor
left join film_actor using (actor_id)
right join film using (film_id)
where title is null; 

#10) get the addresses that has NO customers, and ends with the letter "e"

select address from address
left join customer using (address_id)
where customer_id is null and address like "%e";

#11) what is the most rented film?

select film_id, count(inventory_id) as rental_total
from rental as a
inner join inventory as f using (inventory_id) 
group by inventory_id
order by rental_total desc; 

select film_id, title 
from film
WHERE film_id=772;