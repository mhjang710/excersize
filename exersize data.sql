drop DATABASE if exists exersize;

create database exersize CHARACTER SET=utf8mb4;

use exersize;

drop table if exists users;
drop table if exists board;
drop table if exists likelist;
drop table if exists partlist;

create table `users` (
	`seq` INT AUTO_INCREMENT PRIMARY KEY,
    `userid` VARCHAR(40) NOT NULL,
    `pw` VARCHAR(40) NOT NULL,
    `nickname` VARCHAR(40) NOT NULL
)ENGINE=InnoDB;

create table `partlist` (
	`num` int AUTO_INCREMENT primary key,
    `userid` VARCHAR(40) NOT NULL,
    `part` VARCHAR(40) NOT NULL
);

create table `likelist` (
	`id` VARCHAR(100) NOT NULL PRIMARY KEY, 
	`userid` VARCHAR(40) NOT NULL
)ENGINE=InnoDB;

create table `board` (
	`num` int AUTO_INCREMENT PRIMARY KEY,
    `id` VARCHAR(30) not null,
    `title` varchar(200) not null,
    `content` text,
    `view_cnt` int default 0,
    `reg_date` timestamp default now()
    )ENGINE=InnoDB;

INSERT INTO board VALUES (0, 'yein', 'title', 'content', 1,now());

select * from board;
select * from users;
select * from likelist;
INSERT INTO users values (0, 'iasfk', 'ssafy', 'yein');
INSERT INTO likelist VALUES ('3as1234df5', 'iasfk123');
SELECT * FROM likelist inner join users ON 'userid' = 'userid' LIKE 'iasfk';