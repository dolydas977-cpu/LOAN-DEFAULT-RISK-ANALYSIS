use banking_case;

select count(*) from borrower_profiles;
select count(*) from loan_applications;

--1.What is the overall default rate?
select 
 count(*) as total_loan,
 sum(cast(defaulted as int)) as total_default,
 round(sum(cast(defaulted as int))*100/count(*),2) as default_percent
 from loan_applications;


 --2.how does it break down by credit score range(eg.520-599,600-649,650-699,700-749,750+)

 select credit_score_buckets,
        count(*) as total_loan,
        sum(cast(defaulted as int)) as total_default,
        round(sum(cast(defaulted as int))*100/count(*),2) as default_percent
   from
   
   (select 
   la.defaulted,
     case
       when bp.credit_score between 520 and 599 then '520-599'
       when bp.credit_score between 600 and 649 then '600-649'
       when bp.credit_score between 650 and 699 then '650-699'
       when bp.credit_score between 700 and 749 then '700-749'
       when bp.credit_score >=750 then '750+'
       else 'Below 520'
   end as credit_score_buckets
   from loan_applications la
 join borrower_profiles bp
 on la.borrower_id=bp.borrower_id) t
 group by credit_score_buckets
 order by default_percent desc;


 --3.Is there any relationship between borrower's debt to income (DTI) ration and the likelihood of defaulting?

select dti_ratio_bucket,
       count(*) as total_loan,
        sum(cast(defaulted as int)) as total_default,
        round(sum(cast(defaulted as int))*100/count(*),2)  as default_percent
        from
(select defaulted,
  case
  when dti_ratio <20 then '0-19'
  when dti_ratio between 20 and 29 then '20-29'
  when dti_ratio between 30 and 39 then '30-39'
  when dti_ratio between 40 and 49 then '40-49'
  else '50+'
  end as dti_ratio_bucket  
  from loan_applications
  )t
  group by dti_ratio_bucket
  order by dti_ratio_bucket;


--4.which loan purposes have the highest default rate?

select loan_purpose,
count(*) as total_loan,
sum(cast(defaulted as int)) as total_default,
round(sum(cast(defaulted as int))*100/count(*),2)  as default_percent
from loan_applications
group by loan_purpose
order by default_percent desc;

--5.Does the average loan amount differ significantly between defaulted and non-defaulted loans?

select 
defaulted,
count(*) as total_loan,
round(avg(loan_amount),0) as Average_loan_amount,
min(loan_amount) as min_loan_amount,
max(loan_amount) as max_loan_amount
from loan_applications
group by defaulted; 

--6.How does employment status effect default risk?

select bp.employment_status,
count(*) as total_loan,
sum(cast(la.defaulted as int)) as total_default,
round(sum(cast(la.defaulted as int))*100/count(*),2)  as default_percent

from   loan_applications la
join borrower_profiles bp
on la.borrower_id=bp.borrower_id
group by employment_status
order by default_percent desc;

--7.How does years employed affects default risk?
select employment_tenure,
count(*) as total_loan,
sum(cast(defaulted as int)) as total_default,
round(sum(cast(defaulted as int))*100/count(*),2)  as default_percent
from
(select la.defaulted,
case 
    when bp.years_employed<2 then '<2 years'
    when bp.years_employed between 2 and 5 then '2-5 years'
    when bp.years_employed between 6 and 10 then '6-10 years'
    else '10+ years'
end as employment_tenure
from   loan_applications la
join borrower_profiles bp
on la.borrower_id=bp.borrower_id)t

group by employment_tenure 
order by 
    case employment_tenure
    when '<2 years' then 1
    when '2-5 years' then 2
    when '6-10 years' then 3
    when '10+ years' then 4
    else 5  
    end asc;


--8.Are borrowers with less than 2years of employment more likely to default?
select employment_group,
count(*) as total_loan,
sum(cast(defaulted as int)) as total_default,
round(sum(cast(defaulted as int))*100/count(*),2)  as default_percent
from
(select la.defaulted,
    case
    when bp.years_employed<2 then '<2 years'
    else '2+ years'
    end as employment_group
    from loan_applications la
    join borrower_profiles bp
   on la.borrower_id=bp.borrower_id)t
group by employment_group
order by employment_group;


 