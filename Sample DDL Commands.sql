create database bsit;
drop database bsit;

use bsit;

create table customers(
	ID int NOT NULL,
	Name varchar(100) NOT NULL,
	Age int,
	Address varchar(255),
	Salary decimal(18,2),

	constraint pk_id primary key (ID)
);

drop table customers;

alter table customers add email varchar(20);
alter table customers drop column email;
alter table customers alter column age int;

/*constraint */
NOT NULL
alter table customers alter column age char not null;

/*DEFAULT*/
alter table customers 
add constraint d_salary default 5000.00 for salary;

insert into customers (ID, Name, Age, Address)
values (1, 'Cardo Dalisay', 20, 'Lopez');

select * from customers

/* unique*/
alter table customers
add constraint u_age unique (age);

insert into customers (ID, Name, Age, Address)
values (2, 'Aliana Dalisay', 20, 'Lopez');


/* drop constraint*/
alter table customers drop constraint u_age;
alter table customers drop constraint pk_id;
alter table orders drop constraint fk_id;

/* add pk */

alter table customers
add constraint pk_id primary key (ID);

/* new table*/
create table orders(
	ID int not null,
	ORID int not null,
	date datetime,
	amount decimal(18,2),

	constraint pk_orid primary key (ORID),
	constraint fk_id foreign key (ID) references customers (ID)

);

/* alter add foreign key*/
alter table orders
add constraint fk_id foreign key (ID) references
customers (ID);

/* alter check constraint*/

alter table customers
add constraint chk_slaray CHECK (salary >= 5000);

insert into customers
values (3, 'President ', '5', 'Lopez', 10000);
