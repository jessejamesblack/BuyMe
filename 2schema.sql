CREATE DATABASE IF NOT EXISTS `BuyMe`;
USE `BuyMe`;


DROP TABLE IF EXISTS `Account`;
CREATE TABLE Account(
	username VARCHAR(20) PRIMARY KEY,
    email VARCHAR(40) NOT NULL,
    pwd VARCHAR(20) NOT NULL,
    accountType CHAR(1) NOT NULL);

DROP TABLE IF EXISTS `Auction`;
CREATE TABLE Auction(
	auction_number INTEGER(255)auto_increment,
    item_class VARCHAR(20),
    item_manufacturer VARCHAR(50),
    item_name VARCHAR(20),
    date_time_close datetime,
    reserve DOUBLE,
    init_price DOUBLE,
    increment DOUBLE,
    seller_name VARCHAR(20),
    FOREIGN KEY(seller_name) REFERENCES Account(username) ON DELETE CASCADE,
    primary key (auction_number));
    
CREATE TABLE Alert(
	alert_number INTEGER(255)auto_increment,
    item_class VARCHAR(20),
    item_manufacturer VARCHAR(50),
    item_name VARCHAR(20),
    alert_triggered BOOLEAN,
    user VARCHAR(20),
    FOREIGN KEY(user) REFERENCES Account(username) ON DELETE CASCADE,
    primary key (alert_number));

CREATE TABLE Email(
	eid INTEGER auto_increment,
	`from` VARCHAR(20),
    `to` VARCHAR(20),
    subject VARCHAR(30) DEFAULT "NO SUBJECT",
    date_time DATETIME,
    content TEXT(500),
    PRIMARY KEY(eid),
    FOREIGN KEY(`from`) REFERENCES Account(username),
    FOREIGN KEY(`to`) REFERENCES Account(username));


CREATE TABLE Bid(
	bid_number INTEGER auto_increment,
    bid_amount DOUBLE NOT NULL,
    maxBid DOUBLE,
    username VARCHAR(20) NOT NULL,
    auction_number INTEGER(255) NOT NULL,
    FOREIGN KEY(username) REFERENCES Account(username) ON DELETE CASCADE,
    FOREIGN KEY(auction_number) REFERENCES Auction(auction_number) ON DELETE CASCADE,
    primary key(bid_number));

CREATE TABLE Question(
	questionID INTEGER auto_increment,
    subject VARCHAR(25),
    question TEXT,
    answer TEXT,
    asker VARCHAR(20),
    answerer VARCHAR(20),
    FOREIGN KEY(asker) REFERENCES Account(username),
    FOREIGN KEY(answerer) REFERENCES Account(username),
    primary key(questionID));

CREATE TABLE Warning(
	wID INTEGER auto_increment PRIMARY KEY,
    item_name VARCHAR(20),
    seller_name VARCHAR(20),
    FOREIGN KEY(seller_name) REFERENCES Account(username));
