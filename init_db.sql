drop table if exists users;
create table users (
  id integer primary key autoincrement,
  name text not null,
  email text not null,
  card_number text not null,
  status text not null
);
drop table if exists passwords;
create table passwords (
  id integer not null primary key,
  password text not null,
  foreign key (id) references users(id)
);
insert into users (name, email, card_number, status) values("Vasya", "vasya@vasya.vasya", "1234", "AKTIVEN");
insert into users (name, email, card_number, status) values("Pedro", "petya@vasya.vasya", "4321", "AKTIVEN");
insert into users (name, email, card_number, status) values("Aleshka", "haxxor777@vasya.vasya", "5122", "AKTIVEN");
insert into users (name, email, card_number, status) values("Mihailo", "mihanich@vasya.vasya", "4444", "AKTIVEN");
insert into users (name, email, card_number, status) values("Olga", "opapa@vasya.vasya", "5678", "NE AKTIVEN");
insert into users (name, email, card_number, status) values("Nikita", "nikitos@vasya.vasya", "2222", "NE AKTIVEN");
insert into users (name, email, card_number, status) values("Elena", "lenka@vasya.vasya", "3333", "NE AKTIVEN");
insert into passwords (id, password) values(0, "pass1");
insert into passwords (id, password) values(1, "pass2");
insert into passwords (id, password) values(2, "pass3");
insert into passwords (id, password) values(3, "pass4");
insert into passwords (id, password) values(4, "pass5");
insert into passwords (id, password) values(5, "pass6");
insert into passwords (id, password) values(6, "pass7");

