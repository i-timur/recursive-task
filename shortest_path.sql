WITH RECURSIVE path_cte (to_node2, _path, _weight) AS 
  (SELECT DISTINCT from_node, 'S',0
  FROM road
  WHERE from_node = 'S'
  UNION ALL 
  SELECT to_node,
    departure._path || ',' || arrival.to_node,
    departure._weight + arrival.road_weight
  FROM road AS arrival
    INNER JOIN path_cte AS departure
      ON departure.to_node2 = arrival.from_node
        WHERE NOT departure._path LIKE '%' || to_node ||'%'
        AND NOT departure.to_node2 = 'Y' )

SELECT _path, _weight
FROM (SELECT * FROM path_cte WHERE to_node2 = 'Y') AS paths
  WHERE 
    _weight = (
      SELECT MIN(_weight)
      FROM (SELECT * FROM path_cte WHERE to_node2 = 'Y') AS paths
    );