create database HR_Analytics;
use HR_Analytics;

create table HR
	(
    E_Id int,	
    Age	int,
    Attrition int,
	Department varchar(100),
	Gender varchar(50),
	HourlyRate int,
	JobRole varchar(50),
	MonthlyIncome int,
	TotalWorkingYears int,
	WorkLifeBalance int,
	YearsSinceLastPromotion int
    );
    
select * from hr ;

#1)Average Attrition rate for all Departments
select distinct Department ,
	concat(Round((sum(Attrition)/count(Attrition))*100,2),"%") as Attritionn_rate
    from hr
    group by Department;


#5)Job Role Vs Work life balance
select jobRole,
	Round(avg(Worklifebalance),2) as AvG_workLifeBalance
from hr
group by JobRole;

#4)Average working years for each Department
Select distinct department,
	Round(avg(TotalWorkingYears),2) as AVG_Total_Working_Year
from hr
group by department;

#2)Average Hourly rate of Male Research Scientist
Select JobRole,
	Gender,
    round(avg(HourlyRate),2)
from hr
where gender="male" and JobRole="Research Scientist"
group by JobRole;

#3)Attrition rate Vs Monthly income stats
select
	case 
		when MonthlyIncome between 0 and 10000 Then '0-10000'
        When MonthlyIncome between 10001 and 20000 Then '10001-20000'
        When MonthlyIncome between 20001 and 30000 then '20001-30000'
        when MonthlyIncome between 30001 and 40000 then '30001-40000'
        when MonthlyIncome between 40001 and 50000 Then '40001-50000'
        when MonthlyIncome between 50001 and 60000 then '50001-60000'
	End  as Monthly_Income,
    concat(Round((sum(Attrition)/count(Attrition))*100,2),"%") as Attritionn_rate
from hr
group by Monthly_Income;
    
#6)Attrition rate Vs Year since last promotion relation
select 
	Case 
		when YearsSinceLastPromotion between 0 and 5 then '0-5'
        when YearsSinceLastPromotion between 6 and 10 then '6-10'
        when YearsSinceLastPromotion between 11 and 15 then '11-15'
        when YearsSinceLastPromotion between 16 and 20 then '16-20'
        when YearsSinceLastPromotion between 21 and 25 then '21-25'
        when YearsSinceLastPromotion between 26 and 30 then '26-30'
        when YearsSinceLastPromotion between 31 and 35 then '31-35'
        when YearsSinceLastPromotion between 36 and 40 then '36-40'
	End as Years_SinceLast_Promotion,
    concat(Round((sum(Attrition)/count(Attrition))*100,2),"%") as Attritionn_rate
from hr
group by Years_SinceLast_Promotion
order by Years_SinceLast_Promotion;