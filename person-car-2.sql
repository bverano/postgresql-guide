CREATE TABLE car (
  car_uid UUID NOT NULL PRIMARY KEY,
  make VARCHAR(100) NOT NULL,
  model VARCHAR(100) NOT NULL,
  price NUMERIC(19, 2) NOT NULL CHECK (price > 0)
);

CREATE TABLE person (
  person_uid UUID NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(6) NOT NULL,
  email VARCHAR(100),
  date_of_birth DATE NOT NULL,
  country_of_birth VARCHAR(50) NOT NULL,
  car_uid UUID REFERENCES car(car_uid),
  UNIQUE(car_uid),
  UNIQUE(email)
);

insert into person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Scotty', 'MacCarter', 'Male', 'smaccarter4@nbcnews.com', '2020-07-24', 'Philippines');
insert into person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Wittie', 'Bowcher', 'Male', 'wbowcher5@google.co.uk', '2020-05-12', 'Russia');
insert into person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Gianina', 'Jouandet', 'Female', 'gjouandet6@google.it', '2020-04-16', 'Philippines');
insert into person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth) values (uuid_generate_v4(), 'Jacob', 'Smith', 'Male', 'jacob@nbcnews.com', '2020-07-25', 'Brazil');

insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Mazda', 'RX-8', '91129.72');
insert into car (car_uid, make, model, price) values (uuid_generate_v4(), 'Geo', 'Storm', '11293.86');