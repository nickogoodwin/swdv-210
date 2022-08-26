/*
 Nicko Goodwin
 8/26/2022
 */

DROP DATABASE IF EXISTS ap;

--changed "EXITS" to "EXISTS"

CREATE DATABASE ap;

--changed "DATA BASE" to "DATABASE"

USE ap;

CREATE TABLE
    IF NOT EXISTS vendors (
        vendorID INT NOT NULL AUTO_INCREMENT,
        vendorName VARCHAR(45) NOT NULL UNIQUE,
        vendorAddress VARCHAR(45) NOT NULL,
        vendorCity VARCHAR(45) NOT NULL,
        vendorState VARCHAR(45) NOT NULL,
        vendorZipCode VARCHAR(10) NOT NULL,
        vendorPhone VARCHAR(20) NOT NULL PRIMARY KEY (vendorID)
    );

--changed "CREATE TABLE IF EXISTS" to "CREATE TABLE IF NOT EXISTS"

CREATE TABLE
    IF NOT EXISTS invoices (
        invoiceID INT NOT NULL AUTO INCREMENT,
        vendorID INT NOT NULL,
        invoiceNumber VARCHAR(45) NOT NULL,
        invoiceDate DATETIME NOT NULL,
        invoiceTotal DECIMAL NOT NULL,
        paymentTotal DECIMAL,
        PRIMARY KEY (invoiceID)
    );

CREATE TABLE
    IF NOT EXISTS lineItems (
        lineItemID INT NOT NULL AUTO_INCREMENT,
        invoiceID INT NOT NULL,
        description VARCHAR(45) NOT NULL,
        quantity INT NOT NULL,
        price INT NOT NULL,
        lineItemTotal DECIMAL NOT NULL,
        PRIMARY_KEY (lineItemID)
    );

CREATE INDEX vendorID ON invoices;

CREATE INDEX invoiceNumber ON invoiceNumber;

CREATE INDEX invoiceID ON invoiceID.lineItems;

GRANT SELECT TO mgs_user IDENTIFIED BY 'pa55word';