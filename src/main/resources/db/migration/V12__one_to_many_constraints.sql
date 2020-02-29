alter table job add column employee_id bigint;
alter table job add foreign key (employee_id) references job;

alter table department add column employee_id bigint;
alter table department add foreign key (employee_id) references employee;
