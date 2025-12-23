
create type user_role as enum('Customer', 'Admin')

-- users table
create table
  users (
    user_id int primary key,
    name varchar(50) not null,
    email varchar(150) unique not null,
    password varchar(200) not null,
    phone varchar(20),
    role user_role not null
  )

insert into
  users (user_id, name, email, password, phone, role)
values
  (
    3,
    'Charle',
    'charlie@gmail.com',
    '123456',
    '1234567890',
    'Customer'
  )


-- vehicles table
create table
  vehicles (
    vehicle_id int primary key,
    name varchar(100) not null,
    type
      varchar(20) not null check (
        type
          in ('car', 'bike', 'truck')
      ),
      model varchar(30) not null,
      registration_number varchar(100) unique not null,
      rental_price decimal(10, 2) not null,
      status varchar(30) default 'available' check (status in ('available', 'rented', 'maintenance'))
  )
insert into
  vehicles (
    vehicle_id,
    name,
    type
,
      model,
      registration_number,
      rental_price,
      status
  )
values
  (
    4,
    'Ford F-150',
    'bike',
    2020,
    'JKL-123',
    100,
    'maintenance'
  )


-- bookings table
create table
  bookings (
    booking_id int primary key,
    user_id int references users (user_id) not null,
    vehicle_id int references vehicles (vehicle_id) not null,
    start_date date not null,
    end_date date not null,
    status bookingStatus not null default 'pending',
    total_cost decimal(10, 2) not null default 0.00
  )
insert into
  bookings (
    booking_id,
    user_id,
    vehicle_id,
    start_date,
    end_date,
    status,
    total_cost
  )
values
  (
    4,
    1,
    1,
    '2023-12-10',
    '2023-12-12',
    'pending',
    100
  )

-- query one
select
  booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  start_date,
  end_date,
  b.status
from
  bookings b
  inner join users u on b.user_id = u.user_id
  inner join vehicles v on b.vehicle_id = v.vehicle_id

-- query two
SELECT
  *
FROM
  vehicles v
WHERE
  NOT EXISTS (
    SELECT
      1
    FROM
      bookings b
    WHERE
      b.vehicle_id = v.vehicle_id
  );

-- query three
select
  *
from
  vehicles
where
type
  = 'car'
  and status = 'available'
create type
  bookingStatus as enum('pending', 'confirmed', 'completed', 'cancelled');

-- query four
select
  vehicles.name
from
  bookings
  inner join vehicles on bookings.vehicle_id = vehicles.vehicle_id
select
  name as vehicle_name,
  count(b.booking_id) as total_bookings
from
  vehicles v
  inner join bookings b on v.vehicle_id = b.vehicle_id
group by
  v.vehicle_id
having
  count(b.booking_id) > 2