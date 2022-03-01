create table report (
report_id int not null auto_increment unique,
tran_id int,
res_id int,
report_date datetime,
constraint pk_report_id primary key (report_id),
constraint fk_report_tran_id foreign key (tran_id) references transaction (tran_id),
constraint fk_report_res_id foreign key (res_id) references reservation (res_id)
);
