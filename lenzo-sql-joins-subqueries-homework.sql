-- 1. List all customers who live in Texas (use JOINs)
select first_name, last_name
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Answer:

-- Jennifer	Davis
-- Kim	Cruz
-- Richard	Mccrary
-- Bryan	Hardison
-- Ian	Still


-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id 
where payment.amount > 6.99;

-- Too many to list but there are 28 payments above $6.99

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	where amount > 175);

-- Answer: Mary Smith and Douglass Graf

-- 4. List all customers that live in Nepal (use the city table)

select first_name, last_name, country.country
from customer
full join address
on customer.address_id = address.address_id 
full join city
on city.city_id = address.city_id 
full join country
on country.country_id = city.country_id 
where country.country = 'Nepal';

--- Answer: Kevin Schuler 

-- 5. Which staff member had the most transactions?
select first_name, last_name
from staff 
where staff_id in (
	select staff_id
	from payment
	group by staff_id 
	order by count(staff_id) desc
	limit 1
	);

--- Answer: Jon Stephens


-- 6. How many movies of each rating are there?

	select rating, count(rating)
	from film
	group by rating
	order by rating;
	
-- 		G		178
-- 		PG		194
--		PG-13	223
--		R		196
--		NC-17	209

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
	select first_name, last_name
	from customer
	where customer_id in (
		select customer_id
		from payment
		where amount > 6.99 
		group by payment.customer_id 
		having count(customer_id) = 1
	)  
	
	-- Answer:
-- Harold	Martino
-- Douglas	Graf
-- Alvin	Deloach
-- Alfredo	Mcadams
	
	
-- 8. How many free rentals did our stores give away? 
	select count(rental_id)
	from payment
	where amount = 0;

-- The stores gave away zero (0) free rentals.

	