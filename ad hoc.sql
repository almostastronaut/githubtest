-- Employees and Projects tables
-- Target, take the 5 lowest paid emplyees who have done at least 10 projects

SELECT id

FROM(

SELECT emp.id
	, count(pro.projects_id) as p_cnt
	, emp.Salary
	, row_number() over(partition by emp.id order by emp.Salary asc) as rn
FROM Emplyees as emp
INNER JOIN Projects as pro
ON pro.employee_id = emp.id
-- WHERE pro.End_dt < CURDATE()
GROUP BY emp.id
HAVING count(pro.End_dt)>10

) a

WHERE a.rn <= 5


-- FROM-> JOIN-> WHERE-> GROUP BY-> AGG FUNCTION-> ORDER BY-> OTHER FUNCTION-> SELECT-> ORDER BY-> LIMIT
-- avg() over(partion by id order by salary rows between 1 preceding and 1 following)
-- Example,
--  select id
-- ,sum(id) over(order by id) default_sum
-- ,sum(id) over(order by id range between unbounded preceding and current row) range_sum
-- ,sum(id) over(order by id rows between unbounded preceding and current row) rows_sum
-- ,sum(id) over(order by id range between 1 preceding and 2 following) range_sum1
-- ,sum(id) over(order by id rows between 1 preceding and 2 following) rows_sum1
-- from tmp