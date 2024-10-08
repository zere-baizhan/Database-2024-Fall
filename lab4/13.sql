DELETE FROM boxes WHERE warehouse IN (SELECT code FROM warehouses WHERE location = 'New York')
RETURNING *;
