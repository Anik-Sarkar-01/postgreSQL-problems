-- when we create a view , we virtually create a table/data
-- we can reuse this whenever we need, calling it by its name

-- advantages of view
    -- simplifying complex queries
    -- improved security
    -- enhanced data collection

CREATE View dept_avg_salary
AS
SELECT department_name, avg(salary) FROM employees2 GROUP BY department_name;

SELECT * FROM dept_avg_salary