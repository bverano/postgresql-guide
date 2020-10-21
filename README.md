# PostgreSQL Course

## psql CLI Commands:

- help: shows some available commands for the CLI.
- \q: Quit from the CLI.
- \h: Shows SQL commands.
- \?: Shows all available CLI commands.
- \l: Lists all databases.
  \d: Lists all tables on a database
- \d table_name: Shows the structure of de table queried

## Creating Databases:

Command:

> CREATE DATABASE database_name;

## Connect to Database:

Command 1 (Already in psql session):

> \c database_name

Command 2 (Beffore loggin on psql):

> psql -U username databse_name

## Deleting Database:

Command:

> DROP DATABASE database_name;

## Creating Tables:

Command:

> CREATE TABLE table_name (\
> &nbsp;&nbsp;&nbsp;&nbsp;column_name DATATYPE CONSTRAINTS, ...\
> );

Example:

> CREATE TABLE person (\
> &nbsp;&nbsp;&nbsp;&nbsp;id BIGSERIAL NOT NULL PRIMARY KEY,\
> &nbsp;&nbsp;&nbsp;&nbsp;first_name VARCHAR(50) NOT NULL,\
> &nbsp;&nbsp;&nbsp;&nbsp;last_name VARCHAR(50) NOT NULL,\
> &nbsp;&nbsp;&nbsp;&nbsp;gender VARCHAR(6) NOT NULL,\
> &nbsp;&nbsp;&nbsp;&nbsp;date_of_birth DATE NOT NULL\
> );

<small>PostgreSQL Datatypes: https://www.postgresql.org/docs/9.5/datatype.html</small>

## Deleting Tables:

Command:

> DROP TABLE table_name;

## Insert Data Into Tables:

Command:

> INSERT INTO table_name (\
> &nbsp;&nbsp;&nbsp;&nbsp;field1,\
> &nbsp;&nbsp;&nbsp;&nbsp;field2,...\
> ) VALUES (value1, value2, ...);

Example:

> INSERT INTO person (\
> &nbsp;&nbsp;&nbsp;&nbsp;first_name,\
> &nbsp;&nbsp;&nbsp;&nbsp;last_name,\
> &nbsp;&nbsp;&nbsp;&nbsp;gender,\
> &nbsp;&nbsp;&nbsp;&nbsp;date_of_birth,\
> ) VALUES ('Anne', 'Smith', 'FEMALE', DATE '1988-01-20');

<small>For inserting aleatory data: https://www.mockaroo.com/</small>
For loading data from a \*.sql file:

> \i file_path

## Querying Data from Tables:

Command:

> SELECT column_date FROM table_name;

If you want to select all columns:

> SELECT \* FROM table_name;

## ORDER BY

Helps you sort the data you have selected in a specific order.
By default it is set on ASC (ascending), but using DESC key word, you could change the sorting way.

Command:

> SELECT \* FROM table_name ORDER BY column_name ASC / DESC;

## DISTINCT

Sometimes we want to ask the database just for the unique rows of a column. For this purpose we use the **DISTINCT** keyword

Command:

> SELECT DISTICT column_name FROM table_name;

## WHERE

When we want to filter the data that the database is going to return us, based on any condition, we should use the **WHERE** keyword

Command:

> SELECT \* FROM table_name WHERE column_name = value;

If you want to add more filters to your query you can use the **AND** keyword.

Command:

> SELECT \* FROM table_name WHERE column_name1 = value1 AND column_name2 = value2;

Also you can use the **OR** keyword for adding flexibility to your query.

Command:

> SELECT \* FROM table_name WHERE column_name1 = value1 AND (column_name2 = value2 OR column_name3 = value3);

## Comparison Operators

- = Equal
- < Less than
- \> Greater than
- <= Less or equal than
- => Greater or equal than
- <> Not equal

## LIMIT

If you want to limit the length of the response from the database you can use the **LIMIT** keyword.

Command:

> SELECT \* FROM table_name LIMIT number;

## OFFSET

When you want to skip a number of rows to the response, you should use the **OFFSET** keyword.
You can combine this with **LIMIT**.
A real use case for this command is when you want to implement pagination in your applications.

Command:

> SELECT \* FROM table_name OFFSET number;

## IN

Lets suppose we have a Customers Table where we stored the names, ages and emails from a store's customers. One day the manager asks us to find in our database all the customers whose names are 'John', 'Mario', 'Carl' or 'Lewis'. We can be tempted to use a **WHERE** clause combined with some **OR** ones, but it may made our query innecesarly large.
With the **IN** keyword, we could solve this by just passing an array with the values we want to use as filter.

Command:

> SELECT \* FROM table_name WHERE column_name IN (value1, value2, value3 ...);

## BETWEEN

When we want to filter data using as constraint that some column must be between two values, we can use the **BETWEEN** keyword.

Command:

> SELECT \* FROM table_name WHERE column_name BETWEEN value1 AND value2;
