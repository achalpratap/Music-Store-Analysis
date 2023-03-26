
# Music-Store-Analysis


This repository contains data analysis of a music store dataset using SQL. The dataset contains information about the store's sales, customers, and products.

## Table of contents :
- Tools used in this project
- Prerequisites
- Instructions for how to run the project
- Schema of Database 
- List of questions for the Music Store SQL dataset
- Query for theMusic Store SQL dataset questions

## Tools used in this project :
- MySQL

##  Instructions for how to run the project

1. Install the MySQL Workbench application.
2. Download the all csv files from musicdatabase csv.
3. Import all the files into MySQL Workbench and run the tables. 
4. To get the csv dataset go to https://github.com/achalpratap/Music-Store-Analysis/tree/main/Music%20Store%20Analysis . This is the data repository for the  Music Store Analysis.
5. To get query for question set go to https://github.com/achalpratap/Music-Store-Analysis/blob/main/Music_Store_Analysis.sql . This is the data repository for the Music Store Analysis.

## Schema of Database 
<img width="520" alt="schema_diagram" src="https://user-images.githubusercontent.com/125743309/227788699-77d8dd45-2b2b-4a56-a3ad-9bb6bc2266cf.png">

## List of questions for the  Music Store SQL dataset
####  Question Set 1 - Easy 
- Who is the senior most employee based on job title? 
- Which countries have the most Invoices?
- What are top 3 values of total invoice?
- Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals.  Return both the city name & sum of all invoice totals
- Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money.

#### Question Set 2 - Moderate
- Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A
- Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first

#### Question Set 3 - Advance
 - We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genre
 -  Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.
