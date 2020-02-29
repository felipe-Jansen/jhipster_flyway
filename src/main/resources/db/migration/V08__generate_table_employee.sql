create table employee(
     id bigint not null constraint employee_pkey primary key,
     first_name varchar(255),
     last_name varchar(255),
     email varchar(255),
     phone_number varchar(255),
     hire_date timestamp,
     salary bigint,
     commission_pct bigint
);
