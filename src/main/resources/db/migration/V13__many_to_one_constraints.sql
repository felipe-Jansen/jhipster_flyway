alter table employee add column employee_id bigint;
alter table employee add foreign key (employee_id) references employee
