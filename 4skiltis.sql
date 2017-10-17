--a) Suskirstyti knygas į žanrus.
CREATE TABLE Genres
(
  genreId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);
ALTER TABLE Books ADD genreId INT NULL;


--b) Knygos gali turėti vieną ir daugiau autorių.
ALTER TABLE Authors ADD bookId INT NULL;
UPDATE Authors, Books SET Authors.bookId = Books.bookId WHERE Authors.authorId = Books.authorId;
ALTER TABLE Books DROP authorId;


--c) Sutvarkyti duomenų bazės duomenis, jei reikia papildykite naujais.
UPDATE Authors SET Authors.bookId = 2 WHERE Authors.authorId = 3;
UPDATE Authors SET Authors.bookId = 3 WHERE Authors.authorId = 5;
INSERT INTO Genres (name) VALUES ('Handbook');
INSERT INTO Genres (name) VALUES ('Scientific');
INSERT INTO Genres (name) VALUES ('Manual');
INSERT INTO Genres (name) VALUES ('History');

--d) Išrinkite visas knygas su jų autoriais. (autorius, jei jų daugiau nei vienas atskirkite kableliais)
SELECT Books.title AS Books, GROUP_CONCAT(Authors.name) AS Authors FROM Books INNER JOIN Authors ON Books.bookId = Authors.bookId GROUP BY Books.bookid;

--e) Papildykite knygų lentelę, kad galėtumėte išsaugoti originalų knygos pavadinimą. (Pavadinime išsaugokite, lietuviškas raides kaip ą,ė,š ir pan.)
ALTER TABLE Books ADD UNIQUE (title);
ALTER TABLE Books CONVERT TO CHARACTER SET latin7;
INSERT INTO Books (title, year, genreId) VALUES ('Žydi šermukšnis ąsos šešėly', 1994, 4);




