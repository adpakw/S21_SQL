SELECT object_name
    FROM (
        SELECT '1' AS object_id, pizza_name object_name FROM menu
        UNION ALL
        SELECT '0', name FROM person
    )
ORDER BY object_id, object_name