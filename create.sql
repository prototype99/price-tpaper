CREATE TABLE data (
  name TEXT NOT NULL,
  ply INTEGER(1) NOT NULL,
  rolls INTEGER(2) NOT NULL,
  sheets INTEGER(3) NOT NULL,
  uses INTEGER(4),
  cost REAL(2,2) NOT NULL,
  useCost REAL(4,2),
  urla TEXT,
  urlb TEXT,
  key id (id)
);

LOAD DATA LOCAL INFILE './d.csv'
INTO TABLE data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE data SET uses = ( sheets * rolls ) / ( ply - 1 );
UPDATE data SET useCost = cost / uses;

SELECT * from data ORDER BY useCost;
