create database railway_management_system;

use railway_management_system;

create table admin (
admin_id int not null unique auto_increment,
f_name varchar(50),
l_name varchar (50),
gender varchar (50),
age int not null,
contact_add int not null unique,
admin_email varchar (100) not null unique,
admin_pass varchar (200) not null,
constraint pk_admin_id primary key (admin_id)
);

create table passanger (
passenger_id int not null unique auto_increment,
f_name varchar (50),
l_name varchar (50),
gender varchar (50) not null,
age int not null,
contact_add varchar(200) not null,
passenger_email varchar (100) not null unique,
passenger_pass varchar (200) not null,
constraint pk_passenger_id primary key (passenger_id)
);

create table transaction_type (
transty_id int not null unique auto_increment,
trans_name varchar(100),
constraint pk_transty_id primary key (transty_id)
);

create table train_ticket (
ticket_id int not null unique auto_increment,
ticket_num int not null unique,
date_avail date not null,
date_flight date not null,
time_depart timestamp not null,
time_land datetime not null,
destination varchar (100) not null,
constraint pk_ticket_id primary key (ticket_id)
);

create table reservation (
res_id int not null auto_increment unique,
pass_id int,
admin_id int,
ticket_id int,
date_reserve datetime,
date_accom datetime,
constraint pk_res_id primary key(res_id),
constraint fk_res_pass_id foreign key(pass_id) references passanger(passenger_id),
constraint fk_res_admin_id foreign key (admin_id) references admin (admin_id),
constraint fk_res_ticket_id foreign key (ticket_id) references train_ticket (ticket_id)
);

create table transaction (
trans_id int not null unique auto_increment,
pass_id int,
admin_id int,
transty_id int,
res_id int,
trans_date datetime,
constraint pk_trans_id primary key(trans_id),
constraint fk_trans_pass_id foreign key(pass_id) references passanger(passenger_id),
constraint fk_trans_admin_id foreign key (admin_id) references admin (admin_id),
constraint fk_trans_transty_id foreign key (transty_id) references transaction_type (transty_id),
constraint fk_trans_res_id foreign key (res_id) references reservation (res_id)
);

create table report (
report_id int not null unique auto_increment,
trans_id int,
res_id int,
report_date datetime,
constraint pk_report_id primary key (report_id),
constraint fk_rep_trans_id foreign key (trans_id) references transaction (trans_id),
constraint fk_rep_res_id foreign key (res_id) references reservation (res_id)
);