WITH RECURSIVE TourCTE AS (
    SELECT 
        point1 AS start_node,
        point2 AS end_node,
        cost AS total_cost,
        1 AS depth,
        point1 || ',' || point2 AS tour
    FROM paths
    WHERE point1 = 'a'
    
    UNION ALL
    
    SELECT 
        p.point1 AS start_node,
        p.point2 AS end_node,
        t.total_cost + p.cost AS total_cost,
        t.depth + 1 AS depth,
        t.tour || ',' || p.point2 AS tour
    FROM TourCTE t
    JOIN paths p ON t.end_node = p.point1 AND p.point2 <> 'a' AND p.point2 <> t.start_node
    WHERE t.depth < 3
),

FinalTour AS (
    SELECT
        p.point1 AS start_node,
        p.point2 AS end_node,
        t.total_cost + p.cost AS total_cost,
        t.depth + 1 AS depth,
        t.tour || ',' || p.point2 AS tour
    FROM TourCTE t
    JOIN paths p ON t.end_node = p.point1 AND p.point2 = 'a'
)

SELECT 
    total_cost,
    '{' || tour || '}' AS tour
FROM FinalTour
WHERE end_node = 'a' AND LENGTH(tour) = 9
ORDER BY 1, 2