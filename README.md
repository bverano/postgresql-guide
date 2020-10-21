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
> &nbsp;&nbsp;&nbsp;&nbsp;field2,...
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
