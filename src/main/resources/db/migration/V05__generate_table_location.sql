create table location(
     id bigint not null constraint location_pkey primary key,
     street_address varchar(255),
     postal_code varchar(255),
     city varchar(255),
     state_province varchar(255)
);
