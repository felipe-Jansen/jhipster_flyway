create table job_history(
    id bigint not null constraint job_history_pkey primary key,
    start_date timestamp,
    end_date timestamp,
    language varchar(255)
);

