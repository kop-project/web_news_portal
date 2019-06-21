create sequence hibernate_sequence start 2 increment 1;

create table if not exists user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table if not exists users (
    id int8 not null,
    login varchar(255) not null,
    username varchar(255) not null,
    surname varchar(255) not null,
    password varchar(255) not null,
    primary key (id)
);

alter table if exists user_role
    add constraint user_role_user_fk
    foreign key (user_id) references users;

