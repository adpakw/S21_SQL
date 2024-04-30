-- 6. Самые дорогие маршруты из одного пункта в другой. (Например, есть два маршрута Москва-Тула; один стоит 800 р., другой – 650: надо выдать первый из них).

SELECT r.*
FROM routes r
JOIN (
    SELECT dep, dest, MAX(price) AS max_price
    FROM routes
    GROUP BY dep, dest
) AS max_prices
ON r.dep = max_prices.dep 
AND r.dest = max_prices.dest 
AND r.price = max_prices.max_price
AND r.num = (
    SELECT MIN(num)
    FROM routes
    WHERE dep = r.dep AND dest = r.dest AND price = max_prices.max_price
)
ORDER BY 2, 3;
