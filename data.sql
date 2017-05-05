set collation_connection=utf8_general_ci;
set collation_database=utf8_general_ci;
set collation_server=utf8_general_ci;

create database oda;
use oda;
create table game(id varchar(64) primary key, aId varchar(64), bId varchar(64), aScore int, bScore int, winnerId varchar(64), date bigint);
create table player(id varchar(64) primary key, name varchar(64), teamId varchar(64), number int, icon varchar(255));
create table team(id varchar(64) primary key,name varchar(64), win int, lose int, draw int, finalWin int, icon varchar(255));
create table personal(id varchar(64) primary key,gameId varchar(64), playerId varchar(64), score int, rebound int, assist int, steal int, blockShoot int);
create table new(id varchar(64) primary key, address varchar(255), addressUrl varchar(255), contact text,teamIds text, date bigint);
create index game_index on game (id, aId, bId);
create index player_index on player (id, name, teamId, number);
create index team_index on team(id);
create index personal_index on personal (id, gameId, playerId);
create index new_index on new(id, date);

