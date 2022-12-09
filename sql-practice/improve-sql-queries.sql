----------
-- Step 0 - Create a Query 
----------
-- Query: Select all cats that have a toy with an id of 5

    -- Your code here
SELECT cats.name FROM cat_toys
    JOIN toys ON (cat_toys.toy_id = toys.id)
    JOIN cats ON (cat_toys.cat_id = cats.id)
    WHERE toys.id = 5;

-- Paste your results below (as a comment):

-- Rachele
-- Rodger
-- Jamal

-- Run Time: real 0.003 user 0.000000 sys 0.000000




----------
-- Step 1 - Analyze the Query
----------
-- Query:

    -- Your code here

    EXPLAIN QUERY PLAN
    SELECT cats.name FROM cat_toys
    JOIN toys ON (cat_toys.toy_id = toys.id)
    JOIN cats ON (cat_toys.cat_id = cats.id)
    WHERE toys.id = 5;

-- Paste your results below (as a comment):

--             QUERY PLAN
--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
--SCAN cat_toys
--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)
--Run Time: real 0.001 user 0.000000 sys 0.000000


-- What do your results mean?

    -- Was this a SEARCH or SCAN?
    --    SEARCH-SCAN-SEARCH


    -- What does that mean?

    -- There is an index applied to the toys.id and cats.id columns
    -- There is no index on the cat_toys.id column as it used a SCAN


----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):
--Run Time: real 0.001 user 0.000000 sys 0.000000




----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

    -- Your code here
-- create index idx_cat_toys_toy_id 
-- on cat_toys(toy_id);

-- Analyze Query:
    -- Your code here
--EXPLAIN QUERY PLAN
    --SELECT cats.name FROM cat_toys
    --JOIN toys ON (cat_toys.toy_id = toys.id)
    --JOIN cats ON (cat_toys.cat_id = cats.id)
    --WHERE toys.id = 5;

-- Paste your results below (as a comment):
--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
--SEARCH cat_toys USING INDEX idx_cat_toys_toy_id (toy_id=?)
--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)



-- Analyze Results:

    -- Is the new index being applied in this query?
    -- It seems so. On oly 10k entries it is very hard to tell.




----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):
-- Run Time: real 0.001 user 0.000000 sys 0.000000


-- Analyze Results:
    -- Are you still getting the correct query results?
    -- Yes


    -- Did the execution time improve (decrease)?
    -- It seems as if it averages .001 more now.


    -- Do you see any other opportunities for making this query more efficient?
    -- Bang on the laptop and then ask nicely/pretend to not pay attention.


---------------------------------
-- Notes From Further Exploration
---------------------------------