ALTER TABLE users 
ALTER COLUMN isadmin drop default,
ALTER COLUMN isadmin TYPE BOOLEAN using isadmin::boolean,
ALTER COLUMN isadmin set default false;
