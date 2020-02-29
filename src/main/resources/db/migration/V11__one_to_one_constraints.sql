alter table country add column region_id bigint;
alter table country add foreign key (region_id) references region;

alter table location add column region_id bigint;
alter table location add foreign key (region_id) references region;
alter table location add column country_id bigint;
alter table location add foreign key (country_id) references country;

alter table department add column location_id bigint;
alter table department add foreign key (location_id) references location;

alter table job_history add column job_id bigint;
alter table job_history add foreign key  (job_id) references job;
alter table job_history add column department_id bigint;
alter table job_history add foreign key (department_id) references department;
alter table job_history add column employee_id bigint;
alter table job_history add foreign key (employee_id) references employee;
alter table job_history add column region_id bigint;
alter table job_history add foreign key (region_id) references region;


