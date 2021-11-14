WITH RECURSIVE path_cte (to_node2, _path) AS 
  (SELECT DISTINCT from_node, 'S'
  FROM road
  WHERE from_node = 'S'
  UNION ALL 
  SELECT to_node,
    departure._path || ',' || arrival.to_node
  FROM road AS arrival
    INNER JOIN path_cte AS departure
      ON departure.to_node2 = arrival.from_node
        WHERE NOT departure._path LIKE '%' || to_node ||'%'
        AND NOT departure.to_node2 = 'Y' )
SELECT * FROM path_cte WHERE to_node2 = 'Y';