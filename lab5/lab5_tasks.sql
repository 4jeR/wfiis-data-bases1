-- create schema univers --
CREATE SCHEMA univers AUTHORIZATION u7dlugosz;
 

-- create domains --
CREATE DOMAIN u7dlugosz.univers.domStartUpEndNum AS TEXT
CONSTRAINT valid_value CHECK ( VALUE LIKE ~'[A-Z]%[0-9]');
 
-- domUrl --
CREATE DOMAIN u7dlugosz.univers.domUrl AS TEXT
CONSTRAINT valid_url CHECK( VALUE LIKE 'http://%.org');

 
-- domStamp --
CREATE DOMAIN u7dlugosz.univers.domStamp AS TEXT
CONSTRAINT valid_stamp CHECK(
    VALUE LIKE '____-__-__ %'
);
 
-- seqID --
CREATE SEQUENCE seqID start 1 maxvalue 5 cycle;

-- create indexes --
CREATE INDEX tabuniverse_name ON univers.tabUniverse(name);
CREATE INDEX tabmoon_name ON univers.tabMoon(name);
CREATE INDEX tabsystem_name ON univers.tabSystem(name);
CREATE INDEX tabplanet_name ON univers.tabPlanet(name);
CREATE INDEX tabsun_name ON univers.tabSun(name);
CREATE INDEX tabplanet2sun_name ON univers.tabPlanet2Sun(name);

 
-- create tables --

-- tabuniverse --
CREATE TABLE u7dlugosz.univers.tabuniverse (
    id INT PRIMARY KEY NOT NULL,
    name univers.domStartUpEndNum UNIQUE NOT NULL
);

-- tabsystem --
CREATE TABLE u7dlugosz.univers.tabsystem(
    id INT PRIMARY KEY NOT NULL,
    idUnivers INT NOT NULL REFERENCES u7dlugosz.univers.tabuniverse(id),
    name univers.domStartUpEndNum UNIQUE NOT NULL,
    discStamp univers.domStamp NOT NULL
);

-- tabsun --
CREATE TABLE u7dlugosz.univers.tabsun(
    id INT PRIMARY KEY NOT NULL,
    idSystem INT NOT NULL REFERENCES u7dlugosz.univers.tabsystem(id),
    name univers.domStartUpEndNum UNIQUE NOT NULL
);

-- tabplanet --
CREATE TABLE u7dlugosz.univers.tabplanet(
    id INT PRIMARY KEY NOT NULL,
    idSystem INT REFERENCES u7dlugosz.univers.tabsystem(id),
    name univers.domStartUpEndNum UNIQUE NOT NULL,
    period DECIMAL(5, 2),
    distance DECIMAL(10, 2),
    url univers.domUrl
);

-- tabplanet2sun --
CREATE TABLE u7dlugosz.univers.tabplanet2sun (
    idSun INT NOT NULL REFERENCES u7dlugosz.univers.tabsun(id),
    idPlanet INT NOT NULL REFERENCES u7dlugosz.univers.tabplanet(id)
);

-- tabmoon --
CREATE TABLE u7dlugosz.univers.tabmoon (
    id INT PRIMARY KEY NOT NULL,
    name univers.domStartUpEndNum UNIQUE NOT NULL,
    period DECIMAL(5, 2),
    distance DECIMAL(10, 2),
    idMoon INT REFERENCES u7dlugosz.univers.tabmoon(id),
    idPlanet INT REFERENCES u7dlugosz.univers.tabplanet(id)
);

-- fill in tables --

-- tabMoon --
INSERT INTO u7dlugosz.univers.tabMoon (id, name, period, distance, idMoon, idPlanet)
VALUES (nextval('seqID'), 'Moon_1', '10.01', '100.01', '1', '1');

INSERT INTO u7dlugosz.univers.tabMoon (id, name, period, distance, idMoon, idPlanet)
VALUES (nextval('seqID'), 'Moon_2', '30.03', '200.02', '1', null);

INSERT INTO u7dlugosz.univers.tabMoon (id, name, period, distance, idMoon, idPlanet)
VALUES (nextval('seqID'), 'Moon_3', '50.05', '300.03', '2', null);
 
INSERT INTO u7dlugosz.univers.tabMoon (id, name, period, distance, idMoon, idPlanet)
VALUES (nextval('seqID'), 'Moon_4', '70.07', '400.04', '4', '4');

INSERT INTO u7dlugosz.univers.tabMoon (id, name, period, distance, idMoon, idPlanet)
VALUES (nextval('seqID'), 'Moon_5', '90.09', '500.05', '5', '5');
 

-- tabPlanet --

INSERT INTO u7dlugosz.univers.tabPlanet (id, idSystem, name, period, distance, url)
VALUES (nextval('seqID'), null, 'Planet1', '100', '1000.01', 'http://planet1.org');

INSERT INTO u7dlugosz.univers.tabPlanet (id, idSystem, name, period, distance, url)
VALUES (nextval('seqID'), null, 'Planet2', '200', '5000.01', 'http://planet2.org'); 

INSERT INTO u7dlugosz.univers.tabPlanet (id, idSystem, name, period, distance, url)
VALUES (nextval('seqID'), null, 'Planet3', '300', '9000.01', 'http://planet3.org');

INSERT INTO u7dlugosz.univers.tabPlanet (id, idSystem, name, period, distance, url)
VALUES (nextval('seqID'), null, 'Planet4', '400', '13000.01', 'http://planet4.org');

INSERT INTO u7dlugosz.univers.tabPlanet (id, idSystem, name, period, distance, url)
VALUES (nextval('seqID'), '1', 'Planet5', '500', '17000.01', 'http://planet5.org');
 

-- tabPlanet2Sun --
INSERT INTO u7dlugosz.univers.tabPlanet2Sun (idSun, idPlanet)
VALUES ('1', '1');

INSERT INTO u7dlugosz.univers.tabPlanet2Sun (idSun, idPlanet)
VALUES ('2', '1');

INSERT INTO u7dlugosz.univers.tabPlanet2Sun (idSun, idPlanet)
VALUES ('3', '2');

INSERT INTO u7dlugosz.univers.tabPlanet2Sun (idSun, idPlanet)
VALUES ('4', '3');

INSERT INTO u7dlugosz.univers.tabPlanet2Sun (idSun, idPlanet)
VALUES ('5', '4');


-- tabSun --

INSERT INTO u7dlugosz.univers.tabSun (id, idSystem, name)
VALUES ('1', '1', 'Sun_1');

INSERT INTO u7dlugosz.univers.tabSun (id, idSystem, name)
VALUES ('2', '2', 'Sun_2');

INSERT INTO u7dlugosz.univers.tabSun (id, idSystem, name)
VALUES ('3', '2', 'Sun_3');

INSERT INTO u7dlugosz.univers.tabSun (id, idSystem, name)
VALUES ('4', '4', 'Sun_4');

INSERT INTO u7dlugosz.univers.tabSun (id, idSystem, name)
VALUES ('5', '5', 'Sun_5');


-- tabSystem --
INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('1', '1', 'System_1', '2011-01-01 7dlugosz');

INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('2', '2', 'System_2', '2012-02-01 7dlugosz');

INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('3', '3', 'System_3', '2013-03-01 7dlugosz');


INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('4', '4', 'System_4', '2014-04-01 7dlugosz');

INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('5', '5', 'System_5', '2015-05-01 7dlugosz');
 
INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('6', '1', 'System_6', '2011-01-01 7dlugosz'); 

INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('7', '2', 'System_7', '2012-02-01 7dlugosz');

INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('8', '2', 'System_8', '2013-03-01 7dlugosz');
 
INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('9', '', 'System_9', '2014-04-01 7dlugosz');

INSERT INTO u7dlugosz.univers.tabSystem (id, idUnivers, name, discStamp)
VALUES ('10', '5', 'System_10', '2015-05-01 7dlugosz');

 -- tabUniverse --


INSERT INTO u7dlugosz.univers.tabUniverse (id, name)
VALUES ('1', 'UniversA_1');
 
INSERT INTO u7dlugosz.univers.tabUniverse (id, name)
VALUES ('2', 'UniversA_2');

INSERT INTO u7dlugosz.univers.tabUniverse (id, name)
VALUES ('3', 'UniversA_3');
 
INSERT INTO u7dlugosz.univers.tabUniverse (id, name)
VALUES ('4', 'UniversA_4');

INSERT INTO u7dlugosz.univers.tabUniverse (id, name)
VALUES ('5', 'UniversA_5');