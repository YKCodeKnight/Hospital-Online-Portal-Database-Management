create database db6;
use db6;

create table Category_Header(
			Cat_Code int primary key,
            Cat_Desc varchar(255)
);

insert into Category_Header(Cat_Code,Cat_Desc) 
values  (1,'super_delux'),
		(2,'delux'),
        (3,'super_fast'),
        (4,'normal');

Select*from category_header;

create table Route_Header(
			Route_Id int primary key,
            Route_No int,
            Cat_Code int,
            Origin varchar(255),
            Destination varchar(255),
            Fare int,
            Distance int ,
            Capacity int,
            Foreign key(Cat_Code) references Category_Header(Cat_Code)
);

insert into Route_Header(Route_Id, Route_No, Cat_Code, Origin, Destination, Fare, Distance, Capacity)
values  (101,33,1,'Madurai','Madras',35,250,50),
		(102,25,2,'Trichy', 'Madurai',40,159,50),
        (103,15,3,'Tanjavur','Madurai',59,140,50),
        (104,36,4,'Madras','Bangalore',79,375,50),
        (105,40,1,'Bangalore','Madras',80,375,50), 
        (106,38,2,'Madras','Madurai',39,250,50),
        (107,39,3,'Hyderabad','Madras',50,430,50), 
        (108,41,4,'Madras','Cochin',47,576,50);

Select*from Route_Header;


Create table Place_Header(
			Place_id int primary key,
            Place_name varchar(255),
            Place_address varchar(255),
            Bus_Station varchar(255)
);

insert into Place_Header(Place_id,Place_name,Place_address,Bus_Station) 
values  (1,'Madras', '10,ptc road', 'Parrys'),
		(2, 'Madurai', '21,canal bank road', 'KKNagar'),
		(3, 'Trichy', '11, first cross road', 'Bheltown'),
        (4,'Bangalore','15 first main road','CubbonPark'),
        (5,'Hyderabad','115 lake view road','Charminar'),
        (6,'Thanjavur','12 temple road','Railway Junc');

Select *from Place_Header;

Create table Fleet_Header(
			Fleet_id int primary key,
            Day date,
            Route_Id int,
            Cat_Code int,
            foreign key(Route_Id) references Route_Header(Route_Id),
            foreign key(Cat_Code) references Category_Header(Cat_Code)
);

insert into Fleet_Header(Fleet_Id, Day, Route_Id, Cat_Code)
 VALUES (1, '1996-04-10', 101, 1),
		(2, '1996-04-10', 101, 1),
        (3, '1996-04-10', 101, 1),
        (4, '1996-04-10', 102, 2),
        (5, '1996-04-10', 102, 3),
        (6, '1996-04-10', 103, 4);

Select*From Fleet_Header;

create table Ticket_Header(
    Fleet_Id int,
    Ticket_No int primary key,
    DOI date,
    DOT date,
    Time_Travel time,
    Board_Place varchar(255),
    Origin varchar(255),
    Destination varchar(255),
    Adults int,
    Children int,
    Total_Fare int,
    Route_Id int,
    foreign key(Fleet_Id) references Fleet_Header(Fleet_Id),
    foreign key(Route_Id) references Route_Header(Route_Id)
);

insert into Ticket_Header (Fleet_Id, Ticket_No, DOI, DOT, Time_Travel, Board_Place, Origin, Destination, Adults, Children, Total_Fare, Route_Id) 
values  (1, 1, '1996-04-10', '1996-05-10', '15:00:00', 'Parrys', 'Madras', 'Madurai', 1, 1, 60, 101),
		(2, 2, '1996-04-12', '1996-05-05', '09:00:00', 'KKNagar', 'Madurai', 'Madras', 2, 1, 60, 102),
		(3, 3, '1996-04-21', '1996-05-15', '21:00:00', 'Cubbon Park', 'Bangalore', 'Madras', 4, 2, 400, 101);


create table Ticket_Detail(
			Ticket_No int,
            Name varchar(255),
            Sex char(1),
            Age int,
            Fare decimal(10,2),
            Foreign key(Ticket_No) references Ticket_Header(Ticket_No)
);

insert into Ticket_Detail(Ticket_No, Name, Sex, Age, Fare)
values  (1,'Charu','F',24,14.00),
		(1,'Lathu','F',10,15.55),
        (2,'Anand','M',28,17.80),
        (2,'Gautam','M',28,16.00),
        (2,'Bala','M',9,17.65),
        (3,'Sandip','M',30,18.00);

select*from Ticket_Detail;

create table Route_Detail(
			Route_Id int,
            Place_Id int,
            Nonstop varchar(1),
            foreign key(Route_Id) references Route_Header(Route_Id),
            foreign key(Place_Id) references Place_Header(Place_Id)
);

insert into Route_Detail(Route_Id,Place_Id,Nonstop)
values  (105,1,'N'),
		(102,2,'S'),
        (106,1,'S'),
        (108,5,'N'),
        (106,2,'N');

Select*from Route_Detail;

-- Exp 5
select * from Route_Header where Origin='Madras' and Destination='Cochin';

select * from Route_Header where Origin like 'M%';

select * from Route_Header where Fare between 30 and 50;

select Fare,Origin from Route_Header where Route_No>15;

select * from Place_Header where Place_name like 'M%';

select * from Route_Header where Distance between 200 and 400;

select * from Fleet_Header where Route_Id= 102 or Route_Id=103;

select * from Route_Detail where Nonstop='N';

select * from Category_Header where Cat_Desc  like 's%t';

select * from Category_Header where Cat_Code=1 or Cat_Code=2 or Cat_Code=4;

select * from Place_Header where Bus_Station='Charminar';

select * from Route_Header where Fare<70 and Distance>120;

select * from Ticket_Detail where Sex='F' and Age>10;

select Fare+(Fare*10/100) as Incremented_Fare, Origin, Destination from Route_Header;

select * from Route_Header where Route_Id= 101 or Route_Id=105 or Route_Id=107;

select * from Route_Header where (Origin='Madras' and Distance>300) or (Destination='Madras' or Distance<300);

create table temp_MPSTME(
			place_id numeric(5) primary key, 
            place_name varchar(20) not null, 
            place_address varchar(50)
);

insert into temp_MPSTME select Place_Id, Place_Name, Place_Address from 
Place_Header where Place_Id between 1 and 4 and Place_Name like 'M%';

select*from route_header order by distance desc;

select r.route_no, r.route_id,r.origin,r.destination,r.fare,r.distance,r.capacity from route_header r
inner join category_header c on r.cat_code=c.cat_code
where c.cat_desc='delux';

select h.ticket_no, h.doi, h.dot, h.time_travel, h.board_place, h.origin, h.destination, h.total_fare, h.route_id from ticket_header h
left outer join ticket_detail d on h.ticket_no=d.ticket_no
where d.name='Charu';

select p.place_name, p.bus_station,p.place_address from place_header p natural join route_detail d where d.Nonstop='N';

select*from route_header h left outer join route_detail d on h.route_id=d.route_id;

select distinct d.route_id as 'CommonRoutes' from route_header h natural join route_detail d;

select d.name,d.sex,d.age,d.ticket_no,d.fare from ticket_detail d left join ticket_header h
on d.ticket_no=h.ticket_no where h.origin='Madurai' and h.destination='Madras';

select t1.ticket_no, t1.doi, t1.dot, t1.time_travel, t1.board_place, t1.origin, t1.destination, t1.total_fare, t1.route_id,t1.fleet_id
 from ticket_header t1, ticket_header t2 where t1.origin=t2.destination;
 
 -- Exp 6
 SELECT AVG(fare) FROM route_header;

SELECT SUM(fare) FROM route_header;

SELECT route_id, MIN(distance) FROM route_header GROUP BY distance LIMIT 1;

SELECT SUM(adult) + SUM(children) FROM ticket_header GROUP BY ticket_no;

SELECT origin, SUM(fare) FROM route_header GROUP BY origin;

SELECT origin, SUM(fare) FROM route_header WHERE origin = 'Madras';

SELECT ticket_no, AVG(total_fare) FROM ticket_header GROUP BY ticket_no;

SELECT * FROM fleet_header NATURAL JOIN route_header WHERE route_no = 33 OR route_no = 25;

SELECT sex, COUNT(sex) FROM ticket_detail GROUP BY sex;

SELECT cat_code, COUNT(route_no) FROM route_header GROUP BY cat_code HAVING cat_code != 2;

SELECT DISTINCT place_name FROM place_header NATURAL JOIN route_detail WHERE nonstop = 'N';

SELECT *
FROM Ticket_Header
WHERE Adults + Children > 2;

SELECT * FROM route_detail NATURAL JOIN route_header WHERE cat_code = (SELECT cat_code FROM route_header GROUP BY route_id HAVING MAX(distance) LIMIT 1);

SELECT DISTINCT ticket_no FROM ticket_header UNION SELECT DISTINCT ticket_no FROM ticket_detail;

SELECT ticket_no FROM ticket_header UNION ALL SELECT ticket_no FROM ticket_detail;

SELECT fleet_id FROM fleet_header WHERE fleet_id IN (SELECT fleet_id FROM ticket_header);

SELECT DISTINCT route_id FROM route_header WHERE route_id NOT IN (SELECT DISTINCT route_id FROM route_detail);

SELECT DISTINCT route_id FROM route_header UNION SELECT DISTINCT route_id FROM route_detail;

SELECT cat_code FROM category_header UNION ALL SELECT cat_code FROM route_header;

SELECT place_id FROM place_header WHERE place_id IN (SELECT place_id FROM route_detail);

SELECT ticket_no FROM ticket_detail WHERE ticket_no IN (SELECT ticket_no FROM ticket_header WHERE route_id < ALL (SELECT route_id FROM route_detail WHERE place_id = 01));

SELECT DISTINCT fleet_id FROM fleet_header WHERE fleet_id IN (SELECT fleet_id FROM ticket_header WHERE route_id > ALL (SELECT cat_code FROM route_header WHERE cat_code = 1));

DROP VIEW  route_vw;

CREATE VIEW route_vw AS SELECT route_id, origin, destination FROM route_header;

SELECT * FROM route_vw;

INSERT INTO route_vw VALUES(109, 'Mumbai', 'Banglore');

CREATE VIEW route_category_vw AS SELECT * FROM route_header WHERE cat_code IN (SELECT cat_code FROM category_header WHERE cat_desc = 'delux');

SELECT * FROM route_category_vw;

UPDATE route_vw
SET origin = 'Madurai'
WHERE route_id = 101;
