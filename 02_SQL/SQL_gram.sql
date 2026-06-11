show databases;
use hr_sys;
show tables;
select*from departments;
select*from employees;
select emp_name, job_id, salary from employees
where salary >= 2500000
order by salary desc;

# 예제1
select emp_name, job_id, salary from employees
where dept_id = 2 and salary >= 3500000
order by salary desc;

# 예제2
select emp_name, job_id, dept_id from employees
where emp_name = '조민희' or emp_name = '김상원';

# 예제3
select emp_name, salary, dept_id from employees
where salary >= 3000000.00;


# inner join
select emp_name, job_id, e.dept_id, d.dept_name
from employees e inner join departments d
on e.dept_id = d.dept_id
where emp_name in ('조민희', '김상원');


select emp_name, salary, e.dept_id, d.dept_name
from employees e inner join departments d
on e.dept_id = d.dept_id
where salary >= 3000000.00;

# 직원들의 평균 급여
select avg(salary) from employees;

-- [부서별 평균 급여 조회]
-- 전체 사원을 부서번호(dept_id)별로 그룹을 묶어서(GROUP BY),
-- 각 부서별 평균 급여(AVG)를 요약해서 보여주는 쿼리
SELECT dept_id, AVG(salary) 
FROM employees
GROUP BY dept_id;