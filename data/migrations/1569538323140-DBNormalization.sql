CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255)); 
  --this query will create a second table in the lab14_normal database named bookshelves


INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
  --This query will use a simple subquery to retrieve unique bookshelf values from the books table and insert each one into the bookshelves table in the name column. 

ALTER TABLE books ADD COLUMN bookshelf_id INT;
  --This query will add a column to the books table named bookshelf_id. This will connect each book to a specific bookshelf in the other table.

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
  --This query will prepare a connection between the two tables. It works by running a subquery for every row in the books table. The subquery finds the bookshelf row that has a name matching the current book’s bookshelf value. The id of that bookshelf row is then set as the value of the bookshelf_id property in the current book row.

ALTER TABLE books DROP COLUMN bookshelf;
  --This query will modify the books table by removing the column named bookshelf

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
  --This query will modify the data type of the bookshelf_id in the books table, setting it as a foreign key which references the primary key in the bookshelves table. Now PostgreSQL knows HOW these 2 tables are connected.