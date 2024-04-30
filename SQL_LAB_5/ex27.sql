-- 27. Минимальные суммы поездки в один город и обратно

SELECT dep, dest, MIN(total_cost) AS min_total_cost
FROM (
    SELECT outbound.dep, outbound.dest, (outbound.price + return_trip.price) AS total_cost
    FROM routes outbound
    JOIN routes return_trip ON outbound.dest = return_trip.dep AND outbound.dep = return_trip.dest
) AS total_costs
WHERE dep > dest
GROUP BY dep, dest;
