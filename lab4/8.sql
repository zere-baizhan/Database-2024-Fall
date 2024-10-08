SELECT warehouse, COUNT(*) AS number_of_boxes FROM boxes  GROUP BY warehouse HAVING COUNT(*) > 2; ;
