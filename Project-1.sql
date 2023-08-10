select * from album2;
select * from artist;
select * from customer;
select * from employee;
select * from genre;
select * from invoice;
select * from invoice_line;
select * from media_type;
select * from playlist;
select * from playlist_track;
select * from track;


Q1. who is the senior most employee based on job title?

select *from employee
order by levels Desc
limit 1;

Q2. Which country has the most invoices?

select count(billing_country) as Counts, billing_country from invoice
group by billing_country
order by Counts DESC;

Q3. what are top 3 values of total invioces?

select billing_country, SUM(total) as Total_amount from invoice
group by billing_country
order by Total_amount desc
limit 3;


Q4. which city has the best customer ? we would like to see a promotional music festival in the city where we made
the most money. write a query that return one city that has the highest sum of total invoices. Return
the both city name  & sum of all total invoices?

select billing_city, sum(total) as Total_amount from invoice
group by billing_city
order by Total_amount desc
limit 1;
--best customer is from parague.

Q5. who is the best customer ? The customer who has spend most money will be declared the best customer.
write a quey that return the person who has spend most money.


select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as TOTAL from customer
group by customer.customer_id
order by TOTAL desc
limit 1;

Q6. write query to return all email, first_name, last_namae, genre of all rock music listener . return
your list ordered alphabatically  by email starting with A?

select first_name, last_name, email from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (select track_id from track
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock');

order by email;


Q7. write a query to invite the artist who have written the most rock music in our data set. need to show artist name
 and total top 10 rock band?
 
select artist.artist_id, MAX(artist.name) as artist_name, count(artist.artist_id) as Count_of_songs from artist
join album2 on artist.artist_id = album2.artist_id
join track on album2.album_id = track.album_id 
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'
group by artist.artist_id 
order by Count_of_songs desc
limit 10;


Q8. Return all the track name that have a song length longer than the average  song length . return the length and millisecond of each track.
order by the song length with the longest first?

SELECT track_id, name, milliseconds
FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) as Avg_length FROM track)
ORDER BY milliseconds DESC;







-- alter table album2 modify album_id int primary key;
-- alter table album2 modify artist_id int primary key;
-- alter table artist modify artist_id int primary key;
-- alter table customer modify customer_id int primary key;
-- alter table employee modify employee_id int primary key;
-- alter table genre modify genre_id int primary key;
-- alter table invoice modify invoice_id int primary key;
-- alter table invoice modify customer_id int primary key;
-- alter table invoice_line modify invoice_id int primary key;
-- alter table invoice_line modify track_id int primary key;
-- alter table media_type modify media_type_id int primary key;
-- alter table playlist modify playlist_id int primary key;
-- alter table playlist_track modify playlist_id int primary key;
-- alter table playlist_track modify track_id int primary key;
-- alter table track modify track_id int primary key;
-- alter table track modify album_id int primary key;
-- alter table track modify media_type_id int primary key;
-- alter table track modify genre_id int primary key;


