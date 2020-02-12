CREATE SEQUENCE sequence_generator START 1050 INCREMENT 50 ;

create table jhi_user
(
	id bigint not null
		constraint jhi_user_pkey
			primary key,
	login varchar(50) not null
		constraint ux_user_login
			unique,
	password_hash varchar(60) not null,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(191)
		constraint ux_user_email
			unique,
	image_url varchar(256),
	activated boolean not null,
	lang_key varchar(10),
	activation_key varchar(20),
	reset_key varchar(20),
	created_by varchar(50) not null,
	created_date timestamp,
	reset_date timestamp,
	last_modified_by varchar(50),
	last_modified_date timestamp
);

alter table jhi_user owner to jhipster_flyway;

create table jhi_authority
(
	name varchar(50) not null
		constraint jhi_authority_pkey
			primary key
);

alter table jhi_authority owner to jhipster_flyway;

create table jhi_user_authority
(
	user_id bigint not null
		constraint fk_user_id
			references jhi_user,
	authority_name varchar(50) not null
		constraint fk_authority_name
			references jhi_authority,
	constraint jhi_user_authority_pkey
		primary key (user_id, authority_name)
);

alter table jhi_user_authority owner to jhipster_flyway;

create table jhi_persistent_audit_event
(
	event_id bigint not null
		constraint jhi_persistent_audit_event_pkey
			primary key,
	principal varchar(50) not null,
	event_date timestamp,
	event_type varchar(255)
);

alter table jhi_persistent_audit_event owner to jhipster_flyway;

create index idx_persistent_audit_event
	on jhi_persistent_audit_event (principal, event_date);

create table jhi_persistent_audit_evt_data
(
	event_id bigint not null
		constraint fk_evt_pers_audit_evt_data
			references jhi_persistent_audit_event,
	name varchar(150) not null,
	value varchar(255),
	constraint jhi_persistent_audit_evt_data_pkey
		primary key (event_id, name)
);

alter table jhi_persistent_audit_evt_data owner to jhipster_flyway;

create index idx_persistent_audit_evt_data
	on jhi_persistent_audit_evt_data (event_id);


INSERT INTO public.jhi_authority (name) VALUES ('ROLE_ADMIN');
INSERT INTO public.jhi_authority (name) VALUES ('ROLE_USER');

INSERT INTO public.jhi_user (id, login, password_hash, first_name, last_name, email, image_url, activated, lang_key, activation_key, reset_key, created_by, created_date, reset_date, last_modified_by, last_modified_date) VALUES (1, 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', '', true, 'pt-br', null, null, 'system', null, null, 'system', null);
INSERT INTO public.jhi_user (id, login, password_hash, first_name, last_name, email, image_url, activated, lang_key, activation_key, reset_key, created_by, created_date, reset_date, last_modified_by, last_modified_date) VALUES (2, 'anonymoususer', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', 'Anonymous', 'User', 'anonymous@localhost', '', true, 'pt-br', null, null, 'system', null, null, 'system', null);
INSERT INTO public.jhi_user (id, login, password_hash, first_name, last_name, email, image_url, activated, lang_key, activation_key, reset_key, created_by, created_date, reset_date, last_modified_by, last_modified_date) VALUES (3, 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@localhost', '', true, 'pt-br', null, null, 'system', null, null, 'system', null);
INSERT INTO public.jhi_user (id, login, password_hash, first_name, last_name, email, image_url, activated, lang_key, activation_key, reset_key, created_by, created_date, reset_date, last_modified_by, last_modified_date) VALUES (4, 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', '', true, 'pt-br', null, null, 'system', null, null, 'system', null);

INSERT INTO public.jhi_user_authority (user_id, authority_name) VALUES (1, 'ROLE_ADMIN');
INSERT INTO public.jhi_user_authority (user_id, authority_name) VALUES (1, 'ROLE_USER');
INSERT INTO public.jhi_user_authority (user_id, authority_name) VALUES (3, 'ROLE_ADMIN');
INSERT INTO public.jhi_user_authority (user_id, authority_name) VALUES (3, 'ROLE_USER');
INSERT INTO public.jhi_user_authority (user_id, authority_name) VALUES (4, 'ROLE_USER');
