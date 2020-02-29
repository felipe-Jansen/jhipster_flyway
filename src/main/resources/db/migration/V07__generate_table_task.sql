create table task(
    id bigint not null constraint task_pkey primary key,
    title varchar(255),
    description varchar(255)
);
