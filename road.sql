CREATE TABLE road (
  from_node varchar(1) references node (node_name) NOT NULL,
  to_node varchar(1) references node (node_name) NOT NULL,
  road_weight smallint NOT NULL
);

INSERT INTO road 
  VALUES ('X', 'U', 1),
  ('U', 'X', 2),
  ('V', 'Y', 2),
  ('S', 'U', 3),
  ('Y', 'S', 3),
  ('X', 'V', 4),
  ('S', 'X', 5),
  ('U', 'V', 6),
  ('X', 'Y', 6),
  ('Y', 'V', 7);