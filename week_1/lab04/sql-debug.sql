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
        vendorPhone VARCHAR(20) NOT NULL,
        PRIMARY KEY (vendorID)
    );

--changed "CREATE TABLE IF EXISTS" to "CREATE TABLE IF NOT EXISTS"

--PRIMARY KEY statement moved to new line, separated by comma

CREATE TABLE
    IF NOT EXISTS invoices (
        invoiceID INT NOT NULL AUTO_INCREMENT,
        vendorID INT NOT NULL,
        invoiceNumber VARCHAR(45) NOT NULL,
        invoiceDate DATETIME NOT NULL,
        invoiceTotal DECIMAL NOT NULL,
        paymentTotal DECIMAL,
        PRIMARY KEY (invoiceID),
        FOREIGN KEY (vendorID) REFERENCES vendors(vendorID)
    );

--AUTO_INCREMENT was missing the dash "_"

--Added FOREIGN KEY statement to reference the vendors table

CREATE TABLE
    IF NOT EXISTS lineItems (
        lineItemID INT NOT NULL AUTO_INCREMENT,
        invoiceID INT NOT NULL,
        description VARCHAR(45) NOT NULL,
        quantity INT NOT NULL,
        price INT NOT NULL,
        lineItemTotal DECIMAL NOT NULL,
        PRIMARY KEY (lineItemID),
        FOREIGN KEY (invoiceID) REFERENCES invoices(invoiceID)
    );

--removed the dash "_" from PRIMARY_KEY

--Added FOREIGN KEY statement to reference the invoices table

CREATE INDEX vendorID ON invoices(vendorID);

--'vendorID' column was not selected in invoices table

CREATE INDEX invoiceNumber ON invoices(invoiceNumber);

--'invoices' table was not selected

CREATE INDEX invoiceID ON lineItems(invoiceID);

--changed invoiceID.lineItems to lineItems(invoiceID)

GRANT SELECT ON ap.* TO mgs_user IDENTIFIED BY 'pa55word';

--added 'ON ap.*' to grant SELECT access to the correct db

SHOW GRANTS FOR mgs_user;

--just making sure it worked :)