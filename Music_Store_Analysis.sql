
-- Question Set 1 - Easy 

-- Q1: Who is the senior most employee based on job title? 
Select title, last_name, first_name 
from employee
Order by levels Desc
Limit 1;

-- Q2: Which countries have the most Invoices?
Select Count(*) as c, billing_country 
from invoice
Group by billing_country
Order by  c Desc;

-- Q3: What are top 3 values of total invoice?
Select * from invoice
order by total Desc
Limit 3  ;

-- Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals
Select billing_city,SUM(total) as InvoiceTotal
from invoice
Group by billing_city
Order by InvoiceTotal Desc
Limit 1;

--  Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.
Select customer.customer_id, first_name, last_name, SUM(total) as total_spending
from customer
Join invoice ON customer.customer_id = invoice.customer_id
Group by customer.customer_id
Order by total_spending Desc
Limit 1;


-- Question Set 2 - Moderate
-- Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A
Select Distinct email as Email,first_name as FirstName, last_name as LastName, genre.name AS Name
from customer
Join invoice ON invoice.customer_id = customer.customer_id
Join invoice_line ON invoice_line.invoice_id = invoice.invoice_id
Join track ON track.track_id = invoice_line.track_id
Join genre ON genre.genre_id = track.genre_id
Where genre.name Like 'Rock'
Order by email;

-- Q2: Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

Select name , milliseconds from track
Where milliseconds > (
	Select AVG(milliseconds) as avg_track_length
	from track )
Order by milliseconds Desc;


--  Question Set 3 - Advance

--  Q1: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
-- with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
-- the maximum number of purchases is shared return all Genre
With popular_genre as 
(
    Select COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name, genre.genre_id, 
	ROW_NUMBER() Over(PARTITION BY customer.country Order by COUNT(invoice_line.quantity) DESC) AS RowNo 
    From invoice_line 
	Join invoice ON invoice.invoice_id = invoice_line.invoice_id
	Join customer ON customer.customer_id = invoice.customer_id
	Join track ON track.track_id = invoice_line.track_id
	Join genre ON genre.genre_id = track.genre_id
	Group by 2,3,4
	Order by 2 Asc, 1 Desc
)
Select * From popular_genre Where RowNo <= 1;

--  Q2: Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount.
With Customter_with_country as (
		Select customer.customer_id,first_name,last_name,billing_country,SUM(total) as total_spending,
	    Row_number() Over(PARTITION BY billing_country Order by SUM(total) Desc) as RowNo 
		from invoice
		Join customer ON customer.customer_id = invoice.customer_id
		Group by 1,2,3,4
		Order by 4 Asc,5 Desc)
Select * From Customter_with_country Where RowNo <= 1;




