--modify a book’s publication year to “1950” for a book having the 
--code “0434961604” as ISBN

UPDATE BOOKS_18
SET publication_year = 1950
WHERE isbn = '0434961604';


--count all the books in bookstore database

SELECT COUNT(*)
FROM BOOKS_18;

-- return  the  ISBNs,  titles,  and  publication  years  for  all  books 
-- authored by “Antoine de Saint-Exupery” (in any role) having a price lower than 20 

SELECT B.isbn, B.title, B.publication_year
FROM BOOKS_18 AS B
INNER JOIN BOOKS_AUTHORS_18 AS BA
ON B.isbn = BA.isbn
INNER JOIN AUTHORS_18 AS A
ON A.id = BA.id
WHERE A.name = 'Antoine de Saint-Exupery'
AND B.price < 20.00 ;

-- return the ISBNs, titles, publication years, and author name for all books having 
--a price lower than 2 

SELECT BOOKS_18.isbn, BOOKS_18.title, BOOKS_18.publication_year, AUTHORS_18.name
FROM BOOKS_18
INNER JOIN BOOKS_AUTHORS_18
ON BOOKS_18.isbn = BOOKS_AUTHORS_18.isbn
INNER JOIN AUTHORS_18
ON BOOKS_AUTHORS_18.id = AUTHORS_18.id
WHERE BOOKS_18.price < 2.00;

--  return the  average  review  score  for  the  book  with  ISBN 
-- “0434961604”

SELECT AVG(ratings)
FROM REVIEWS_18
WHERE isbn = '0434961604';

-- return the ISBN and titles for all books having average review score 
-- greater than 4.5 and at least 3 reviews

SELECT BOOKS_18.isbn, BOOKS_18.title
FROM BOOKS_18
INNER JOIN RREVIEWS_18 
ON BOOKS_18.isbn = REVIEWS_18.isbn
GROUP BY BOOKS_18.isbn, BOOKS_18.title
HAVING AVG(REVIEWS_18.ratings) > 4.5 AND COUNT(REVIEWS_18.isbn) >= 3;