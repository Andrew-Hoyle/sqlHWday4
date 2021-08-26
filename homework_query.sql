-- List all customer who live in TEXAS (USE Joins


Select address.address_id,  customer.customer_id 
From customer
Join address
On customer.address_id = address.address_id in (
	select address.city_id, city.city_id
	FROM address
	join city
	on address.city_id = city.city_id
	WHERE city = 'Texas'
);





-- Payments above 6.99 With customers full name

select customer.customer_id, payment.amount
From customer
join payment
on customer.customer_id = payment.customer_id
Where payment.amount > 6.99
order by payment.amount asc;




-- All Customers who have made payments over 175(use subq)
Select customer.customer_id, payment.amount
From customer
where customer.customer_id = (
	select *
	from payment.amount
	where count(payment.amount) > 175
	
);


--List all customers that live in Nepal

SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
on address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


--- Which staff member had the most transactions
Select count(payment.payment_id), staff_id
From payment
group by payment.staff_id
order BY count(payment.payment_id)DESC;


-- How many movies of each rating are there

Select count(film_id), rating
from film
group by rating


-- Show All custies who made a single payment above 6.99 using subqueries
select payment.amount, payment.customer_id, customer.first_name, last_name
from payment
Full join customer
on payment.customer_id = customer.customer_id
where payment.amount > 6.99 
ORDER BY payment.customer_id ASC;


-- How many free rentals did our stores give away
select payment.staff_id, payment.amount, staff.staff_id, staff.store_id
from payment
full join staff
on payment.staff_id = staff.staff_id
Where payment.amount = 0
order by staff.store_id asc;
