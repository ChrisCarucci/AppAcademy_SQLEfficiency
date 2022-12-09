----------
-- Step 0 - Create a Query 
----------
-- Query: Find a count of `toys` records that have a price greater than
    -- 55 and belong to a cat that has the color "Olive".

    -- Your code here

    select COUNT(*) from cat_toys
    join cats on cats.id=cat_toys.cat_id
    join toys on toys.id=cat_toys.toy_id
    where toys.price > 55 AND cats.color = 'Olive';

-- Paste your results below (as a comment):
-- 215




----------
-- Step 1 - Analyze the Query
----------
-- Query:

    -- Your code here
    explain query plan
    select COUNT(*) from cat_toys
    join cats on cats.id=cat_toys.cat_id
    join toys on toys.id=cat_toys.toy_id
    where toys.price > 55 AND cats.color = 'Olive';

-- Paste your results below (as a comment):
--SCAN cat_toys
--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)
--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)


-- What do your results mean?

    -- Was this a SEARCH or SCAN?

    -- SCAN-SEARCH-SEARCH


    -- What does that mean?

    -- What does anything mean, really?




----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):

-- Run Time: real 0.008 user 0.015625 sys 0.000000




----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

    -- Your code here
    -- CREATE INDEX toys_price ON toys(price);

-- Analyze Query:
    -- Your code here

-- Paste your results below (as a comment):


-- Analyze Results:

    -- Is the new index being applied in this query?




----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):


-- Analyze Results:
    -- Are you still getting the correct query results?
    -- Yes


    -- Did the execution time improve (decrease)?

    -- No. :(


    -- Do you see any other opportunities for making this query more efficient?
    -- no.


---------------------------------
-- Notes From Further Exploration

--EXPLAIN QUERY PLAN
--SELECT COUNT(cat_toys.id)
--FROM cat_toys
--WHERE cat_toys.toy_id IN (SELECT toys.id FROM toys WHERE toys.price > 55)
--    AND cat_toys.cat_id IN (SELECT cats.id FROM cats WHERE cats.name = 'Olive');
---------------------------------
