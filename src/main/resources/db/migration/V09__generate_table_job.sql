create table job(
    id bigint not null constraint job_pkey primary key,
    job_title varchar(255),
    min_salary bigint,
    max_salary bigint
);
