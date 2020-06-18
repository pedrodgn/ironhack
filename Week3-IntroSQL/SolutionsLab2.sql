--## Challenge 1 - Who Have Published What At Where?

--In this challenge you will write a PostgreSQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

--* `AUTHOR ID` - the ID of the author
--* `LAST NAME` - author last name
--* `FIRST NAME` - author first name
--* `TITLE` - name of the published titlec  
--* `PUBLISHER` - name of the publisher where the title was published

--Your output will look something like below:

SELECT * from titleauthor
--If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`.
SELECT authors.au_id,
		au_lname,
		au_fname,
		pub_name,
		title
	from titleauthor
		inner join
		titles
	on titleauthor.title_id=titles.title_id
	INNER JOIN 
	authors
	on authors.au_id=titleauthor.au_id
	INNER JOIN
	publishers
	on publishers.pub_id=titles.pub_id
----## Challenge 2 - Who Have Published How Many At Where?

--Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Order your output by the title count in descending order. Your output should look something like below:

--To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.

--*Hint: In order to count the number of titles published by an author, you need to use [COUNT](https://www.w3resource.com/PostgreSQL/postgresql-count-function.php). Also check out [Group By](https://www.w3resource.com/PostgreSQL/postgresql-group-by.php) because you will count the rows of different groups of data.*

SELECT COUNT(title) as number_of_titles,
 	Author_per_publisher_title.au_id,
	author_per_publisher_title.au_lname,
	author_per_publisher_title.au_fname,
	author_per_publisher_title.pub_name
From (SELECT authors.au_id,
		au_lname,
		au_fname,
		pub_name,
		title
	from titleauthor
		inner join
		titles
	on titleauthor.title_id=titles.title_id
	INNER JOIN 
	authors
	on authors.au_id=titleauthor.au_id
	INNER JOIN
	publishers
	on publishers.pub_id=titles.pub_id) as Author_per_publisher_title
	GROUP BY Author_per_publisher_title.au_id,
	author_per_publisher_title.au_lname,
	author_per_publisher_title.au_fname,
	author_per_publisher_title.pub_name
	ORDER BY number_of_titles DESC;


--## Challenge 3 - Best Selling Authors

--Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

--Requirements:

--* Your output should have the following columns:
--	* `AUTHOR ID` - the ID of the author
--	* `LAST NAME` - author last name
--	* `FIRST NAME` - author first name
--	* `TOTAL` - total number of titles sold from this author
--* Your output should be ordered based on `TOTAL` from high to low.
--* Only output the top 3 best selling authors.

--## Challenge 4 - Best Selling Authors Ranking

--Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.