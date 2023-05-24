create table movie(
movie_id SERIAL primary key,
title VARCHAR(50) not null unique,
rating VARCHAR(5) not null
);

create table genre(
genre_id SERIAL primary key,
genre_name VARCHAR(25) not null unique
);

create table movie_genre(
movie_id INTEGER not null,
foreign key(movie_id) references movie(movie_id),
genre_id INTEGER not null,
foreign key(genre_id) references genre(genre_id)
);

create table theater(
theater_id SERIAL primary key
);

create table showtime(
showtime_id SERIAL primary key,
show_date DATE,
show_time TIME
);

create table screening(
screening_id SERIAL primary key,
movie_id INTEGER not null,
foreign key(movie_id) references movie(movie_id),
theater_id INTEGER not null,
foreign key(theater_id) references theater(theater_id),
showtime_id INTEGER not null,
foreign key(showtime_id) references showtime(showtime_id)
);

create table rewards_program(
program_id SERIAL primary key,
program_name VARCHAR(25) not null unique,
description VARCHAR(200)
);

create table customer(
customer_id SERIAL primary key,
first_name VARCHAR(25) not null,
last_name VARCHAR(25) not null,
date_of_birth DATE not null,
email VARCHAR(50) not null
);

create table customer_rewards(
program_id INTEGER not null,
foreign key(program_id) references rewards_program(program_id),
customer_id INTEGER not null,
foreign key(customer_id) references customer(customer_id)
);

create table seat_at_screening(
seat_id SERIAL primary key,
screening_id INTEGER not null,
foreign key(screening_id) references screening(screening_id)
);

create table ticket(
ticket_id SERIAL primary key,
customer_id INTEGER not null unique,
foreign key(customer_id) references customer(customer_id),
seat_id INTEGER not null unique,
foreign key(seat_id) references seat_at_screening(seat_id)
);