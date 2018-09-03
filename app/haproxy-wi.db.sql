CREATE TABLE IF NOT EXISTS `user` (`id`	INTEGER NOT NULL AUTO_INCREMENT,`username`	VARCHAR ( 64 ) UNIQUE,`email`	VARCHAR ( 120 ) UNIQUE,	`password`	VARCHAR ( 128 ),`role`	VARCHAR ( 128 ),`groups` VARCHAR ( 120 ), PRIMARY KEY(`id`) );
INSERT INTO `user` (username, email, password, role, groups) VALUES ('admin','admin@localhost','admin','admin','1');
INSERT INTO `user` (username, email, password, role, groups) VALUES ('editor','editor@localhost','editor','editor','1');
INSERT INTO `user` (username, email, password, role, groups) VALUES ('guest','guest@localhost','guest','guest','1');
CREATE TABLE IF NOT EXISTS `servers` (`id`	INTEGER NOT NULL AUTO_INCREMENT,`hostname`	VARCHAR ( 64 ) UNIQUE,`ip`	VARCHAR ( 64 ) UNIQUE,`groups`	VARCHAR ( 64 ), type_ip INTEGER NOT NULL DEFAULT 0, enable INTEGER NOT NULL DEFAULT 1, master INTEGER NOT NULL DEFAULT 0, cred INTEGER NOT NULL DEFAULT 1, alert INTEGER NOT NULL DEFAULT 0, metrics INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(`id`) );
CREATE TABLE IF NOT EXISTS `role` (`id`	INTEGER NOT NULL AUTO_INCREMENT,`name`	VARCHAR ( 80 ) UNIQUE,`description`	VARCHAR ( 255 ),PRIMARY KEY(`id`) );
INSERT INTO `role` (name, description) VALUES ('admin','Can do everything');
INSERT INTO `role` (name, description) VALUES ('editor','Can edit configs');
INSERT INTO `role` (name, description) VALUES ('guest','Read only access');
CREATE TABLE IF NOT EXISTS `groups` (`id`	INTEGER NOT NULL AUTO_INCREMENT,`name`	VARCHAR ( 80 ) UNIQUE,`description`	VARCHAR ( 255 ),PRIMARY KEY(`id`));
INSERT INTO `groups` (name, description) VALUES ('All','All servers enter in this group');	
CREATE TABLE IF NOT EXISTS `servers` (`id`	INTEGER NOT NULL AUTO_INCREMENT,`hostname`	VARCHAR ( 64 ) UNIQUE,`ip`	VARCHAR ( 64 ) UNIQUE,`groups`	VARCHAR ( 64 ),	PRIMARY KEY(`id`));
CREATE TABLE IF NOT EXISTS `uuid` (`user_id` INTEGER NOT NULL, `uuid` varchar ( 64 ),`exp` DATETIME default '0000-00-00 00:00:00');
CREATE TABLE IF NOT EXISTS `cred` (`id` integer primary key AUTO_INCREMENT,`enable`	INTEGER NOT NULL DEFAULT 1, `username`	VARCHAR ( 64 ) NOT NULL, `password` VARCHAR ( 64 ) NOT NULL );
CREATE TABLE IF NOT EXISTS `token` (`user_id` INTEGER, `token` varchar(64), `exp` timestamp default '0000-00-00 00:00:00');
CREATE TABLE IF NOT EXISTS `cred` (`id` integer primary key AUTO_INCREMENT, `name` VARCHAR ( 64 ) UNIQUE, `enable` INTEGER NOT NULL DEFAULT 1, `username` VARCHAR ( 64 ) NOT NULL, `password` VARCHAR ( 64 ) NOT NULL, groups INTEGER NOT NULL DEFAULT 1 );
CREATE TABLE IF NOT EXISTS `telegram` (`id` integer primary key auto_increment, `token` VARCHAR ( 64 ), `chanel_name` INTEGER NOT NULL DEFAULT 1, `groups` INTEGER NOT NULL DEFAULT 1);
CREATE TABLE IF NOT EXISTS `metrics` (`serv` varchar(64), curr_con INTEGER, cur_ssl_con INTEGER, sess_rate INTEGER, max_sess_rate INTEGER,`date`  DATETIME default '0000-00-00 00:00:00');
CREATE TABLE IF NOT EXISTS `settings` (`param` varchar(64) UNIQUE, value varchar(64), section varchar(64), `desc` varchar(100));