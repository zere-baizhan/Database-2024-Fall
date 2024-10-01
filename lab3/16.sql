UPDATE departments SET budget = budget * 0.90 WHERE code = (SELECT code FROM departments WHERE budget = (SELECT MIN(budget) FROM departments));
