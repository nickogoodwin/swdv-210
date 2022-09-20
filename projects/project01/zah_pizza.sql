-- Active: 1661148601560@@127.0.0.1@3306@zah_pizza

-- Active: 1661148601560@@127.0.0.1@3306

DROP DATABASE zah_pizza;

CREATE DATABASE zah_pizza DEFAULT CHARACTER SET = 'utf8mb4';

USE zah_pizza;

CREATE TABLE
    IF NOT EXISTS employees(
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        position VARCHAR(255) NOT NULL,
        PRIMARY KEY(id)
    );

CREATE TABLE
    IF NOT EXISTS visits (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        phone VARCHAR(15),
        message VARCHAR(255),
        newsletter BOOLEAN NOT NULL,
        date DATETIME NOT NULL,
        employee_id INT,
        PRIMARY KEY(id),
        FOREIGN KEY(employee_id) REFERENCES employees(id)
    );

INSERT INTO
    employees (name, position)
VALUES ('Garald Ramas', 'Manager'), (
        'Waldemar Acland',
        'Assistant Manger'
    ), (
        'Piper Southouse',
        'Supervisor'
    ), (
        'Shanda Spender',
        'Team Member'
    ), ('Sollie Ross', 'Team Member');

insert into
    visits (
        name,
        email,
        phone,
        message,
        newsletter,
        date,
        employee_id
    )
values (
        'Marybeth D''Elia',
        'mdelia0@admin.ch',
        '440-367-8017',
        'Total scalable strategy',
        false,
        '2022-03-10 06:33:57',
        3
    ), (
        'Cathee Basnett',
        'cbasnett1@google.nl',
        '366-244-6171',
        'Proactive zero administration implementation',
        true,
        '2021-10-22 03:47:02',
        4
    ), (
        'Tan Riddiford',
        'triddiford2@springer.com',
        '183-522-2434',
        'Organized eco-centric application',
        true,
        '2022-05-25 10:46:46',
        3
    ), (
        'Shay Skarman',
        'sskarman3@blog.com',
        '802-874-6346',
        'Devolved zero defect conglomeration',
        false,
        '2022-07-31 13:13:56',
        2
    ), (
        'Percival Greeve',
        'pgreeve4@dyndns.org',
        '688-340-0527',
        'Down-sized even-keeled superstructure',
        false,
        '2022-06-08 13:42:54',
        1
    ), (
        'Lia Chrystal',
        'lchrystal5@webnode.com',
        '758-890-0365',
        'Fully-configurable neutral superstructure',
        true,
        '2022-01-04 21:15:39',
        2
    ), (
        'Roman Moulton',
        'rmoulton6@infoseek.co.jp',
        '998-883-3433',
        'Progressive executive product',
        false,
        '2022-06-30 20:46:35',
        3
    ), (
        'Eudora Caldayrou',
        'ecaldayrou7@marriott.com',
        '117-626-8422',
        'Realigned 24/7 pricing structure',
        false,
        '2021-11-28 17:06:49',
        null
    ), (
        'Brose Roll',
        'broll8@simplemachines.org',
        '696-256-4052',
        'Exclusive content-based collaboration',
        true,
        '2021-10-15 17:43:55',
        4
    ), (
        'Winny Aleksich',
        'waleksich9@mozilla.org',
        '587-817-9237',
        'Public-key scalable access',
        true,
        '2022-05-30 09:38:39',
        5
    ), (
        'Heidie De Cruce',
        'hdea@etsy.com',
        '952-633-4578',
        'Compatible 5th generation synergy',
        false,
        '2022-04-16 12:23:45',
        4
    ), (
        'Lorne Grinstead',
        'lgrinsteadb@ustream.tv',
        '910-176-1681',
        'Open-architected asymmetric knowledge user',
        true,
        '2022-08-07 22:43:11',
        3
    ), (
        'Guntar Evanson',
        'gevansonc@businessweek.com',
        '963-692-6695',
        'Phased real-time time-frame',
        true,
        '2022-01-24 03:18:57',
        5
    ), (
        'Quintina Vain',
        'qvaind@hc360.com',
        '742-591-7054',
        'Polarised zero defect success',
        false,
        '2022-01-10 10:00:27',
        4
    ), (
        'Rubie Wasielewicz',
        'rwasielewicze@drupal.org',
        '469-492-2578',
        'Cross-platform 24/7 definition',
        false,
        '2021-11-12 10:29:28',
        2
    ), (
        'Gina Powelee',
        'gpoweleef@lulu.com',
        '374-857-1510',
        'Business-focused well-modulated monitoring',
        false,
        '2021-11-17 04:12:40',
        3
    ), (
        'Dyna Greensall',
        'dgreensallg@sbwire.com',
        '185-388-1126',
        'Optimized human-resource implementation',
        true,
        '2022-08-17 17:58:45',
        null
    ), (
        'Esme Clapshaw',
        'eclapshawh@noaa.gov',
        '773-716-8155',
        'Assimilated even-keeled collaboration',
        true,
        '2022-07-04 12:50:30',
        3
    ), (
        'Demetris Lanphere',
        'dlanpherei@apple.com',
        '270-156-1603',
        'Re-engineered bifurcated contingency',
        false,
        '2022-02-15 03:35:58',
        2
    ), (
        'Avictor Caulket',
        'acaulketj@omniture.com',
        '761-339-0112',
        'Assimilated bandwidth-monitored hardware',
        true,
        '2022-02-17 15:04:16',
        3
    );

CREATE VIEW ASSIGNED_EMPLOYEE_VISITS 
	AS
	SELECT
	    visits.date,
	    visits.name AS visitor_name,
	    visits.message,
	    employees.name AS employee_name
	FROM visits
	    LEFT JOIN employees ON visits.employee_id = employees.id
	WHERE
	    visits.employee_id IS NOT NULL
	ORDER BY visits.date DESC
; 

CREATE VIEW UNASSIGNED_EMPLOYEE_VISITS AS 
	SELECT
	    visits.date,
	    visits.name AS visitor_name,
	    visits.message,
	    employees.name AS employee_name
	FROM visits
	    LEFT JOIN employees ON visits.employee_id = employees.id
	WHERE
	    visits.employee_id IS NULL
	ORDER BY visits.date DESC
; 