create database Bank_Analysis_Project;
use Bank_Analysis_Project;
select * from finance_1;
select * from finance_2;
select count(*) from finance_1;
#kpi1
select year(issue_d) as year_issue,sum(loan_amnt) as Total_loan_amnt from finance_1 
group by year_issue order by year_issue;

#kpi2
select grade,sub_grade,sum(revol_bal) as Total_revol_bal from finance_1
 join finance_2 on (finance_1.id = finance_2.id)
 group by grade , sub_grade order by grade , sub_grade ;
 
 #kpi3
 select verification_status, sum(total_pymnt) as total_payment
from finance_1 join finance_2 
on (finance_1.id = finance_2.id)
group by verification_status having  verification_status in ( 'Not verified' , 'Verified');

#kpi4

SELECT
    addr_state,
    monthname(last_pymnt_d)  AS Pay_Month,
    loan_status,
    COUNT(*) AS Loan_Count
FROM
    finance_1
INNER JOIN
    finance_2 ON (finance_1.id = finance_2.id)
GROUP BY
    addr_state,
    monthname(last_pymnt_d) ,
    loan_status
ORDER BY
    addr_state,
    monthname(last_pymnt_d);

 #kpi5

select year(last_pymnt_d) ,monthname(last_pymnt_d),home_ownership,count(home_ownership)
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id) where home_ownership = 'own'
group by
 year(last_pymnt_d) ,
 monthname(last_pymnt_d),
 home_ownership
 order by
 year(last_pymnt_d);
