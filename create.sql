CREATE TABLE data (
  name TEXT NOT NULL,
  ply INTEGER(1) NOT NULL,
  rolls INTEGER(2) NOT NULL,
  sheets INTEGER(3) NOT NULL,
  uses INTEGER(4),
  cost REAL(2,2) NOT NULL,
  delivery REAL(1,2) NOT NULL,
  useCost REAL(4,2),
  urla TEXT,
  urlb TEXT
);
UPDATE data SET uses = ( sheets * rolls ) / ( (CASE WHEN ply = 3 THEN 3 WHEN ply = 4 THEN 2 END) );
UPDATE data SET useCost = ( cost + delivery ) / uses;

SELECT * from data ORDER BY useCost;
