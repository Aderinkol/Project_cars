create schema Motors 
create table motors.automobiles
(symboling varchar (20),
normalised varchar (20),
make varchar(20),
fuel_type varchar (20),
 aspiration varchar (20),
 number_of_doors varchar(20),
 body_style varchar (20),
 drive_whell char (20),
engine_location varchar (20),
 wheel_base char (20),
 lenght float ,
 width float ,
 height float ,
 curb_weight int ,
 engine_weight varchar(20), 
 number_of_cylinders varchar (20),
 engine_size int ,
 fuel_system varchar (20),
 bore varchar (20),
 stroke varchar (20),
 compressio_ratio varchar (20),
 horse_power int ,
 peak_rpm varchar (20),
 city_mpq varchar (20),
 highway_mpg varchar (20),
 price int )
 
 select * from motors.automobiles 
 
 2. In a different code cell, write and run another query that returns the first 
     five rows of the facts table in the database
	 
select * from motors.automobiles
limit 5;
 
 3--Write a single query that returns the following:

a. Minimum of 5 numerical variables
b. Maximum of 5 numerical variables
c. Minimum height
d. Maximum width
a.
 select make,
 min(lenght) as minimum_lenght,
 min (height) as minimum_height,
 min (curb_weight) as minimmum_curb,
 min (engine_size) as minimum_engine_size,
 min (price) as Minimum_price
 from motors.automobiles
 group by make 
 
 b. 
 select make, 
 max(lenght) as maximum_lenght,
 max (height) as maximum_height,
 max (curb_weight) as maximmum_curb,
 max (engine_size) as maximum_engine_size,
 max (price) as Maximum_price
 from motors.automobiles
 group by make 
 
 c. 
select min(height) as minimum_height
from motors.automobiles

 c. 
 select min (height)
from motors.automobiles; 
 
 d.
 select max(width)
  from motors.automobiles
 
  d. 
 select max (width) as maximun 
   from motors.automobiles;
 
4. a.  Write a query that returns the cars with the minimum horsepower.
 b. Write a query that returns the cars with the maximum horsepower.
 
a. 
 select make , min (horse_power) from motors.automobiles
 group by make 
 
 b.
 select make, max(horse_power) from motors.automobiles 
 group by make 
 
 
5.  Recompute the summary statistics you found earlier while excluding the row for the whole car. 
 Include the following:

Minimum of 5 numerical variables
Maximum of 5 numerical variables
Minimum height
Maximum width

 5a 
 select min(lenght) as minimum_lenght,
 min (height) as minimum_height,
 min (curb_weight) as minimmum_curb,
 min (engine_size) as minimum_engine_size,
 min (price) as Minimum_price
 from motors.automobiles

 

 5b 
 select max(lenght) as maximum_lenght,
 max (height) as maximum_height,
 max (curb_weight) as maximmum_curb,
 max (engine_size) as maximum_engine_size,
 max (price) as Maximum_price
 from motors.automobiles
 
 5c
 select min (height)
 from motors.automobiles
 
 5d 
 select max (width)
 from motors.automobiles
 
6.  In a different code cell, calculate the average value for the following columns:
a. price
b. length

 6a 
 select avg (price ) as average_price 
 from motors.automobiles 
 
 6b
 select avg (lenght) as average_lenght
 from motors.automobiles
 
7.  Write a query that finds all cars meeting both of the following criteria:
The price is above average.
The price is below average
 
7a
select make, price 
 from motors.automobiles
 where price  > 11445.72 
 
  7b 
 select make, price 
 from motors.automobiles
 where price  < 11445.72
 
 select* from motors.automobiles
 
 8.compute using windows fuctions, joins and case statements 10 different analysis from the data and explaing
your findings.
 
 a. Window function 
 SELECT
         make,
         number_of_cylinders,
         price,
    SUM(price) OVER (PARTITION BY make ORDER BY number_of_cylinders) AS total_price
from motors.automobiles
 
 
 SELECT 
    make,
    fuel_type,
    body_style,
    price,
    CASE 
        WHEN price > 10000 THEN 'Luxury cars'
        ELSE 'economy cars'
    END AS car_clasification 
from motors.automobiles
    
    select  
    make,
    fuel_type,
    body_style,
    horse_power,
    case  
    when horse_power > 100 then 'super fast cars'
    else ' fast cars'
    end as  car_out_put
from motors.automobiles

 select * from 
      (select height, sum(price) as total_cost from  motors.automobiles as a
       group by height) as b
 join 
 (select avg(height) as avg_lenght 
 from( select height, sum(price) as total_cost from motors.automobiles as a
group by height) as c) as d
on b.height > d.avg_lenght 

 select * from motor.automobiles 