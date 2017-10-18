-- a) Papildykite autorių lentelę įrašais.
INSERT INTO Authors (name) VALUES ('John Davis');
INSERT INTO Authors (name) VALUES ('Greg Williams');
INSERT INTO Authors (name) VALUES ('Garry White');

-- b) Papildykite knygų lentelę, įrašais apie knygas, kurių autorius įrašėte prieš tai.
INSERT INTO Books (authorId, title, year) VALUES (8, 'SQL for beginners', 1996);
INSERT INTO Books (authorId, title, year) VALUES (9, 'JAVA for beginners', 2006);
INSERT INTO Books (authorId, title, year) VALUES (10, 'PHP for advanced users', 2011);

-- c) Išrinkite knygų informaciją prijungdami autorius iš autorių lentelės.
SELECT Books.*, Authors.name FROM Books INNER JOIN Authors ON Books.authorId = Authors.authorId;

-- d) Pakeiskite vienos knygos autorių į kitą.
UPDATE Authors INNER JOIN Books ON Authors.authorId = Books.authorId AND Books.bookId = 11 SET Authors.name = 'John Davis';

-- e) Suskaičiuokite kiek knygų kiekvieno autoriaus yra duomenų bazėje (įtraukdami autorius kurie neturi knygų, bei neįtraukdami šių autorių).
SELECT TRIM(name) AS Authors, COUNT(bookId) AS Book_COUNT FROM Authors LEFT JOIN Books ON Authors.authorId = Books.authorId GROUP BY Authors.name;
SELECT TRIM(name) AS Authors, COUNT(bookId) AS Book_COUNT FROM Authors INNER JOIN Books ON Authors.authorId = Books.authorId GROUP BY Authors.name;

-- f) Pašalinkite jūsų įrašytus autorius. (pagal ID)
DELETE FROM Authors WHERE authorId = 8;
DELETE FROM Authors WHERE authorId = 9;
DELETE FROM Authors WHERE authorId = 10;

-- g) Pašalinkite knygas, kurios neturi autorių.
DELETE Books.* FROM Books LEFT JOIN Authors ON Books.authorId = Authors.authorId WHERE Authors.authorId IS NULL;