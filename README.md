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

## LIKE

It is useful when we want to filter records which selected column **contains** a piece of information.  
For example, if we have a table with user's emails and we want to filter the ones who have a ".com" sufix email, we should use the **LIKE** keyword.

Command:

- Data with a suffix

  > SELECT \* FROM table_name WHERE column_name LIKE '%anything';

- Data with a prefix

  > SELECT \* FROM table_name WHERE column_name LIKE 'anything%';

- Data with something in the middle

  > SELECT \* FROM table_name WHERE column_name LIKE '%anything%';

- Data with a number of characters before or after
  > SELECT \* FROM table_name WHERE column_name LIKE '\_\_\_anything%';\
  > <small>One undersocre means one character and you can put them at any place you want.</small>

## ILIKE

Does the same thing that **LIKE**, but it doesn't care about if the parameter is in lower or uppercase.

Command:

> SELECT \* FROM table_name WHERE column_name ILIKE '%anYtHiNg';

## GROUP BY

Imagine that you work for a travel agency and you have customers all around the world. Some day, you want to know the distribution of your customers based on their country of birth, so you can redistribute your sales force in proportion of that.
In order to solve that we can use the **GROUP BY** keyword along with the **COUNT** function.

Command:

> SELECT column_name, AGGREGATE_FUNC(\*) FROM table_name GROUP BY column_name;

If you want to add a restriction to your query, for example in the case proposed lines up, you want to get the countries that have more than 100 customers of your store, so you can focus on them, you can use the **HAVING** keyword.

Command:

> SELECT column_name, AGGREGATE_FUNC(\*) FROM table_name GROUP BY column_name HAVING AGGREGATE_FUNC(\*) > number;

Solving the examples:

<small>Get the count of customers grouped by country of birth, ordered by that count descendingly</small>

> SELECT country_of_birth, COUNT(\*) FROM customers GROUP BY country_of_birth ORDER BY COUNT(\*) DESC;

<small>Get the countries where you have more than 100 customers.</small>

> SELECT country_of_birth, COUNT(\*) FROM customers GROUP BY country_of_birth HAVING COUNT(\*) \> 100 ORDER BY COUNT(\*) DESC;

## MAX, MIX and AVG

When you have a trable with some numerical column, you may want to ask for the maximun, minimum or even the average value of all of them. For this purposes we could use de **MAX, MIN or AVG** keywords.

Command:

> SELECT MAX(column_name) FROM table_name;
> SELECT MIN(column_name) FROM table_name;
> SELECT AVG(column_name) FROM table_name;

## ROUND

If you are using the **AVG** operator , you may want to limit the decimals of the result.
This could be done with the **ROUND** operator.

Command:

> SELECT ROUND(AVG(column_name), num_of_decimals) FROM table_name;

<small>If you don't specify a number of decimals, it would take it's default value: 0</small>

## GROUP BY with MAX / MIN / AVG

Imagine that you work for a Rent a Car Company and you have a table with all the cars you offer and their prices. This table has the make, model and price of the cars.
Some day, you want to add a VIP line of cars with every make you have available. So you want to ask your database for the most expensive prices you have for every make.
This could be easily done combining the **MAX** operator with a **GROUP BY** one.

Solution:

> SELECT make, MAX(price) FROM car GROUP BY make;

On a general form, we could have something like this.

Command:

> SELECT column_name, OPERATOR(numerical_column_name) FROM table_name GROUP BY column_name;

## SUM

It helps you to sum all the numerical values of a column and send it to you as a response.

Command:

> SELECT SUM(column_name) FROM table_name;

It works similar to **MAX, MIN and AVG** when you want to group data with **GROUP BY**.

## ARITMETHIC OPERATORS

Imagine that you work in a supermarket and you are on the black friday's season. So all your products should be at half price. If you want to ask your database for the new prices, maybe for creating new labels for the products or something like that, you should use the multiply operator:

> SELECT column_name, ROUND(price \* 0.5) FROM products;

You can use this operators:

- \- (subtraction)
- \+ (adition)
- \* (multiplication)
- / (division)
- % (module)

## ALIAS

When we are using operators, the columns of their results on the response are not the best. So we can assign them a new one using the **AS** keyword.

Command:

> SELECT ROUND(column_name \* 0.5) AS new_value from table_name;

<small>Psdt: It could be use with any response, not only for operators.</small>
