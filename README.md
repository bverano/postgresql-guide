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

## COALESCE

It helps you when you want to set a default value, when the result of a query is null.
For example, if you have an email column of a customer table and some of the rows have that field empty. You might want to see a default text instead of an empty space. For that situations you have the **COALESCE** keyword.

Command:

> SELECT COALESCE(column_name1, column_name2, ..., default_value) FROM table_name;

<small>Psdt: If the results of all the values for the columns provided on the query are null, the default_value will be show.</small>

## NULLIF

As basic math we know that we can't divide a number by 0. In Postgres, if we make a query of a division and we a zero as denominator, we will have an error. For handling this error and recieve a defaul value for this kind of query we can use the **NULLIF** operator combined with the **COALESCE** keyword.

Command:

> SELECT COALESCE(10 / NULLIF(some_result_that_could_be_zero,0), 0);

<small>NULLIF(a,b) will return null if a=b</small>

## Working with dates

We have some funciton in Postgres that help us with information about the actual date in different formats.
If we want to recieve a timestamp for the actual time we use the **NOW()** function and it will give us a result like this _2020-10-31 19:18:54.873047-05_. But if we just want the date without the time, we may want to use this expression **NOW()::DATE** and we will recieve this kind of output _2020-10-31_. Finally, if we want just the actual time and not the date, we use **NOW()::TIME** and we will recieve this kind output _19:23:33.724938_

<small>We must use a <b>SELECT</b> statement before any of those function we saw. Example: SELECT NOW()::TIME;</small>

## Adding and subtracting with dates

If, for some reason we want to know the date minus some interval of time, we can use the **INTERVAL** keyword as follows.

Command:

> SELECT NOW() - / + INTERVAL 'number period_of_time';

<small>
Period of Time parameter could have these values:
<ul>
  <li>YEAR(S)</li>
  <li>MONTH(S)</li>
  <li>WEEK(S)</li>
  <li>DAY(S)</li>
</ul>
</small>

## Extracting values from a date

If we want to extract any part of a date, we can use the **EXTRACT()** function as follows.

Command:

> SELECT EXTRACT(part_for_extraction FROM NOW());

<small>
Part for Extraction could have these values:
<ul>
  <li>YEAR</li>
  <li>MONTH</li>
  <li>WEEK</li>
  <li>DAY</li>
  <li>DOW</li>
  <li>CENTURY</li>
</ul>
</small>

## AGE

If we have a customers' table and we want to know their ages for any campaign or special data analysis, we can use the **AGE** function.

Command:

> SELECT AGE(NOW(), date_column_name) FROM table_name;

## PRIMARY KEYS

Prikary keys are use as a unique identifier for each record in our tables. The best analogy for this is the ID or the passport number, which are your unique identifier as a citizen of your country.
In Postgres we can use a combination of the **BIGSERIAL** type and the **PRIMARY KEY** constraint to create a primary key column:

> CREATE TABLE (\
> &nbsp;&nbsp;&nbsp;&nbsp;id BIGSERIAL PRIMARY KEY\
> );

We can also give a column the **PRIMARY KEY** constraint after we create a table. That could be achieved as follows:

> ALTER TABLE table_name ADD PRIMARY KEY(primary_key_column_name);

And we can also delete that **PRIMARY KEU** constraint.

> ALTER TABLE table_name DROP CONSTRAINT constraint_name;

## UNIQUE

Sometimes, in addition to the Primary Key, we want to keep some columns of our tables with non-duplicated values. For example, that would be the case for an email field, which should be related for only one person. For these cases we can add the **UNIQUE** constraint to our table as follows.

Command:

> ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE(unique_column_name);

If we want Postgres to assign the name of the constraint we can simplify the query:

> ALTER TABLE table_name ADD UNIQUE(unique_column_name);

We can also drop that constraint:

> ALTER TABLE table_name DROP CONSTRAINT constraint_name;

## CHECK

Lets imagine that we have a gender column in our customers table and for corporative reasons we just want to limit that field to 'Female' and 'Male' values, so we have to make sure that Postgres doesn't let us insert any user with a different gender. In order to achieve that we can use the **CHECK** constraint.

Command:

> ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK(column_name = value1 OR column_name - value2);

## DELETE

Sometimes we might want to delete some row(s) in our table. In order to do that we can use the **DELETE** keyword.

Command:

> DELETE FROM table_name WHERE column_name = value;

<small>WARNING: If we execute this query without setting any 'WHERE' condition, we will delete all the rows from it.</small>

## UPDATE

In order to update some rows of our tables we must use the **UPDATE** command.

Command:

> UPDATE table_name SET column_name1 = value1 WHERE column_name2 = value2;

<small>WARNING: If we execute this query without setting any 'WHERE' condition, we will update all the rows from it whit the setted value.</small>

## ON CONFLICT

The **ON CONFLICT** keyword helps us when we want to handle a possible exception on a **INSERT** query.

Command:

> INSERT INTO table_name (column_name1, column_name2, ...) VALUES (value1, value2, ...) ON CONFLICT (column_name) DO NOTHING;

<small>WARNING: We can pass columns with UNIQUE or PRIMARY KEY constraints as ON CONFLICT's parameter.</small>

## UPSERT

Sometimes we have multiple calls to our database from the same user with almost the same information. For example, on a sign up form, lets imagine that some user submitted it and few seconds later he change his mind with the email he provided us. That call might throw an exception and the data he sent us won't be updated. In that case we might want to use the and upsert statement.

Command:

> INSERT INTO table_name (column_name1, column_name2, ...) VALUES (value1, value2, ...) ON CONFLICT (column_name) DO UPDATE SET column_name = EXCLUDED.column_name;
