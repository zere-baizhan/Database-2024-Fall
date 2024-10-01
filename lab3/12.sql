SELECT name,lastname FROM employees WHERE department = ( SELECT code FROM departments WHERE budget=(SELECT MIN(budget) FROM departments));



