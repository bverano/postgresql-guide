CREATE TABLE car (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  make VARCHAR(100) NOT NULL,
  model VARCHAR(100) NOT NULL,
  price NUMERIC(19, 2) NOT NULL
);

CREATE TABLE person (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(6) NOT NULL,
  email VARCHAR(100),
  date_of_birth DATE NOT NULL,
  country_of_birth VARCHAR(50) NOT NULL,
  car_id BIGINT REFERENCES car(id),
  UNIQUE(car_id)
);

insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Scotty', 'MacCarter', 'Male', 'smaccarter4@nbcnews.com', '2020-07-24', 'Philippines');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Wittie', 'Bowcher', 'Male', 'wbowcher5@google.co.uk', '2020-05-12', 'Russia');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Gianina', 'Jouandet', 'Female', 'gjouandet6@google.it', '2020-04-16', 'Philippines');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth) values ('Jacob', 'Smith', 'Male', 'jacob@nbcnews.com', '2020-07-25', 'Brazil');

insert into car (make, model, price) values ('Mazda', 'RX-8', '91129.72');
insert into car (make, model, price) values ('Geo', 'Storm', '11293.86');