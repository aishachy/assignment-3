
create table users (
  user_id serial primary key,
  name varchar(100) not null,
  email varchar(100) unique not null,
  password varchar(100) not null,
  phone varchar(20)  not null,
  role varchar(20) not null check (role in ('admin', 'customer'))
);


create table vehicles (
  vehicle_id serial primary key,
  name varchar(100) not null,
  type varchar(50) not null,
  model varchar(20) not null,
  registration_number varchar(100) not null,
  rental_price int,
  status varchar(50) not null check (status in ('available', 'rented', 'maintenance'))
);


create table bookings (
  booking_id serial primary key,
  user_id int references users (user_id),
  vehicle_id int references vehicles(vehicle_id),
  start_date date not null,
  end_date date not null,
  status varchar(50) not null check (status in ('pending', 'confirmed', 'completed', 'cancelled')),
  total_cost int
);


-- join
select bookings.booking_id, users.name as customer_name, vehicles.name as vehicle_name, bookings.start_date, bookings.end_date, bookings.status
from bookings
join users on bookings.user_id = users.user_id
join vehicles on bookings.vehicle_id = vehicles.vehicle_id

-- exists
select * from vehicles
where not exists ( select bookings.booking_id from bookings where bookings.vehicle_id = vehicles.vehicle_id)

-- where
select * from vehicles 
where vehicles.type = 'car' and vehicles.status = 'available'

-- group by and having
select vehicles.name as vehicle_name, count(*) as total_bookings from bookings
join vehicles on bookings.vehicle_id = vehicles.vehicle_id
group by vehicle_name
having count(*) > 2
