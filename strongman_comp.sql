drop database if exists strongman_comp;
create database strongman_comp;

use strongman_comp;

create table competitors
(
	user_id			int				primary key,
    first_name		varchar(45)		NOT NULL,
    last_name		varchar(45)		NOT NULL,
    weight_class  	varchar(45)		NOT NULL
)engine=InnoDB default charset=utf8mb4;

create table strong_men
(
	user_id		    	int				primary key,
    first_name  		varchar(45)		NOT NULL,
    last_name  		    varchar(45)		NOT NULL,
    weight_class  		varchar(45)		NOT NULL,
    log__press  		int				NOT NULL,
    Keg_carry   		int				NOT NULL,
    deadlift  		    int				NOT NULL,
    tire_flip  		    int				NOT NULL,
    stones_over_bar  	int				NOT NULL,
    grand_total		  	int				NOT NULL,
    constraint competitors_fk_strong_men
		foreign key (user_id)
		references competitors (user_id)
)engine=InnoDB default charset=utf8mb4;

create table strong_women
(
	user_id		    	int				primary key,
    first_name  		varchar(45)		NOT NULL,
    last_name  		    varchar(45)		NOT NULL,
    weight_class  		varchar(45)		NOT NULL,
    log__press  		int				NOT NULL,
    Keg_carry   		int				NOT NULL,
    deadlift  		    int				NOT NULL,
    tire_flip  		    int				NOT NULL,
    stones_over_bar  	int				NOT NULL,
    grand_total		  	int				NOT NULL,
constraint competitors_fk_strong_women
		foreign key (user_id)
		references competitors (user_id)
)engine=InnoDB default charset=utf8mb4;

insert competitors (user_id, first_name, last_name, weight_class)
values (1, 'Jamie', 'Navarro', 'Light');

insert competitors (user_id, first_name, last_name, weight_class)
values (2, 'Nadejda', 'Morrison', 'Light');

insert competitors (user_id, first_name, last_name, weight_class)
values (3, 'Katie', 'Erns', 'Middle');

insert competitors (user_id, first_name, last_name, weight_class)
values (4, 'Conchida', 'Pita', 'Middle');

insert competitors (user_id, first_name, last_name, weight_class)
values (5, 'Tawni', 'Wolfe', 'Heavy');

insert competitors (user_id, first_name, last_name, weight_class)
values (6, 'Rick', 'Johnson', 'Light');

insert competitors (user_id, first_name, last_name, weight_class)
values (7, 'David', 'Taliaferro', 'Light');

insert competitors (user_id, first_name, last_name, weight_class)
values (8, 'Karl', 'Swetnika', 'Middle');

insert competitors (user_id, first_name, last_name, weight_class)
values (9, 'Nicholas', 'Berriman', 'Middle');

insert competitors (user_id, first_name, last_name, weight_class)
values (10, 'Matthe', 'Schisano', 'Middle');

insert competitors (user_id, first_name, last_name, weight_class)
values (11, 'Trevor', 'Peterson', 'Middle');

insert competitors (user_id, first_name, last_name, weight_class)
values (12, 'Jordan', 'Koucky', 'Heavy');

insert competitors (user_id, first_name, last_name, weight_class)
values (13, 'Kealii', 'Kalawao', 'Heavy');

insert competitors (user_id, first_name, last_name, weight_class)
values (14, 'Andrew', 'Lynch', 'Heavy');

insert competitors (user_id, first_name, last_name, weight_class)
values (15, 'Gordon', 'sam', 'Heavy');

insert competitors (user_id, first_name, last_name, weight_class)
values (16, 'Richard', 'Castillo', 'Heavy');

insert competitors (user_id, first_name, last_name, weight_class)
values (17, 'Zack', 'Bunke', 'Heavy');

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (6, 'Rick', 'Johnson', 'Light', 2, 2, 2, 2, 2, 10);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (7, 'David', 'Taliaferro', 'Light', 1, 1, 1, 1, 1, 5);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (8, 'Karl', 'Swetnika', 'Middle', 0, 0, 0, 4, 2.5, 6.5);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (9, 'Nicholas', 'Berriman', 'Middle', 0, 2, 0, 2, 0, 4);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (10, 'Matthe', 'Schisano', 'Middle', 4, 4, 4, 3, 4, 19);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (11, 'Trevor', 'Peterson', 'Middle', 0, 3, 3, 1, 2.5, 9.5);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (12, 'Jordan', 'Koucky', 'Heavy', 6, 6, 6, 5.5, 6, 29.5);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (13, 'Kealii', 'Kalawao', 'Heavy', 0, 2, 0, 1, 1, 4);


insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (14, 'Andrew', 'Lynch', 'Heavy', 4.5, 4, 2, 5, 4.5, 20);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (15, 'Gordon', 'sam', 'Heavy', 2, 1, 4, 2, 2, 11);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (16, 'Richard', 'Castillo', 'Heavy', 4.5, 5, 5.5, 3, 4.5, 22.5);

insert strong_men (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (17, 'Zack', 'Bunke', 'Heavy', 3, 3, 3, 4, 3, 16);

insert strong_women (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (1, 'Jamie', 'Navarro', 'Light', 1, 2, 1, 1, 1, 6);

insert strong_women (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (2, 'Nadejda', 'Morrison', 'Light', 2, 1, 2, 2, 2, 9);

insert strong_women (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (3, 'Katie', 'Erns', 'Middle', 2, 2, 2, 2, 2, 10);

insert strong_women (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (4, 'Conchida', 'Pita', 'Middle', 1, 1, 1, 1, 1, 5);

insert strong_women (user_id, first_name, last_name, weight_class, log__press,
				   Keg_carry, deadlift, tire_flip, stones_over_bar, grand_total)
values (5, 'Tawni', 'Wolfe', 'Heavy', 1, 1, 1, 1, 1, 5);
