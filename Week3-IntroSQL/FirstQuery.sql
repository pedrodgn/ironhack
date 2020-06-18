SELECT * from public.data;
--**1. What are the different genres?**
SELECT DISTINCT(prime_genre) FROM public.data;
--**2. Which is the genre with the most apps rated?**
--The count of ratings an app has received is in the rating_count_tot column.
SELECT prime_genre,
COUNT (rating_count_tot) AS NumberAppsRated
FROM public.data
WHERE rating_count_tot != 0
GROUP BY prime_genre
ORDER BY NumberAppsRated DESC
LIMIT 1;

--**3. Which is the genre with most apps?**
SELECT prime_genre,
COUNT (*) AS NumberApps
FROM public.data
GROUP BY prime_genre
ORDER BY NumberApps DESC
LIMIT 1;

--**4. Which is the one with least?**
SELECT prime_genre,
COUNT (*) AS NumberApps
FROM public.data
GROUP BY prime_genre
ORDER BY NumberApps ASC
LIMIT 1;

--**5. Find the top 10 apps most rated.**
SELECT prime_genre,
COUNT (rating_count_tot) AS NumberAppsRated
FROM public.data
WHERE rating_count_tot != 0
GROUP BY prime_genre
ORDER BY NumberAppsRated DESC
LIMIT 10;

--**6. Find the top 10 apps best rated by users.**
SELECT track_name, prime_genre, user_rating
FROM public.data
ORDER BY user_rating DESC
LIMIT 10;
--**7. How could you take the top 3 regarding both user ratings and number of votes?**
SELECT track_name, prime_genre, user_rating, rating_count_tot 
FROM public.data
ORDER BY user_rating desc, rating_count_tot DESC
LIMIT 3;
--**8. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT AVG(rating_count_tot)
FROM public.data
WHERE price=0;

SELECT AVG(rating_count_tot)
FROM public.data
WHERE price>0;

SELECT AVG(rating_count_tot)
FROM public.data
WHERE price>3;
/*The first query show that on average a free app is rated 19.749 times. The second query
shows that paid apps are rated 4.048 times on average. And apps that have a price bigger than 3
are rated 2885 times on average. In conclusion, the bigger the price, less rates. So we can assume
that users care about the price*/

--**Bonus: Find the total number of games available in more than 1 language.**
SELECT COUNT(track_name)
FROM public.data
WHERE "lang.num">1 and prime_genre='Games';
--**Bonus2: Find the number of free vs paid apps**
SELECT COUNT(track_name) as Number_of_apps,
	CASE 
		When data.price=0 then 'Free'
		WHEN data.price>0 then 'Paid'
		ELSE 'Invalid'
		END AS Paid_or_Free
	FROM public.data
	GROUP BY Paid_or_Free;
--**Bonus3: Find the number of free vs paid apps for each genre**
SELECT COUNT(track_name) as Number_of_apps,
	prime_genre,
	CASE 
		When data.price=0 then 'Free'
		WHEN data.price>0 then 'Paid'
		ELSE 'Invalid'
		END AS Paid_or_Free
	FROM public.data
	GROUP BY Paid_or_Free, prime_genre
	ORDER BY prime_genre;