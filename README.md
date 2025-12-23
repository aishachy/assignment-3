Vehicle Rental System – Database Project
The Vehicle Rental System is a relational database project designed to manage vehicle rentals efficiently.
The database consists of three tables:
1) Users
Key fields:
* user_id (Primary Key)
* name
* email
* password
* phone
* role

2) Vehicles
Key fields:
* vehicle_id (Primary Key)
* name
* type
* model
* registration_number
* rental_price
* status

3) Bookings
Key fields:
* booking_id (Primary Key)
* user_id (Foreign Key → Users)
* vehicle_id (Foreign Key → Vehicles)
* start_date
* end_date
* status
* total_cost

JOIN Query:
select bookings.booking_id, users.name as customer_name, vehicles.name as vehicle_name, bookings.start_date, bookings.end_date, bookings.status
from bookings
join users on bookings.user_id = users.user_id
join vehicles on bookings.vehicle_id = vehicles.vehicle_id
Explanation:
1) Using JOIN to combine data from bookings, users, and vehicles.
2) Provides a complete view of each booking.

EXISTS Query:

select * from vehicles

where not exists ( select bookings.booking_id from bookings where bookings.vehicle_id = vehicles.vehicle_id)

Explanation:

1) Using NOT EXISTS to check for vehicles without bookings.

WHERE Clause Query
select * from vehicles 
where vehicles.type = 'car' and vehicles.status = 'available'
Explanation:
1) Filters vehicles by type and availability status.
2) Useful for customers who are searching for available cars.

GROUP BY & HAVING Query
select vehicles.name as vehicle_name, count(*) as total_bookings from bookings
join vehicles on bookings.vehicle_id = vehicles.vehicle_id
group by vehicle_name
Explanation:
1) GROUP BY is used to groups bookings by vehicle.
2) HAVING filters groups with more than two bookings.
