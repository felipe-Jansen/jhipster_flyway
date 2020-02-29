alter table job add column task_id bigint;
alter table job add foreign key (task_id) references task
