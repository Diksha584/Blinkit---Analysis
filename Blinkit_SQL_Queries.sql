
use blinkitdb;
select * from Blinkit_data;
select count(*) from Blinkit_data;

update Blinkit_data
set Item_Fat_Content=
case
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content='reg' then 'Regular'
else Item_Fat_Content
end

select distinct(Item_Fat_Content) from Blinkit_data;

select sum(Total_Sales) as Total_Sales from Blinkit_data;

select cast(sum(Total_Sales)/1000000 as decimal(10,2)) as Total_Sales_Millions from Blinkit_data;

select Avg(Total_Sales) from Blinkit_data;

select cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales  from Blinkit_data;

select count(*) No_Of_Item from Blinkit_data;

select cast(sum(Total_Sales)/1000000 as decimal(10,2)) as Total_Sales_Millions
from Blinkit_data where Item_Fat_Content='Low Fat';


select cast(sum(Total_Sales)/1000000 as decimal(10,2)) as Total_Sales_Millions
from Blinkit_data where Outlet_Establishment_Year=2022


select cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales 
from Blinkit_data where Outlet_Establishment_Year=2022


select count(*) No_Of_Item 
from Blinkit_data where Outlet_Establishment_Year=2022

select Avg(Rating) from Blinkit_data;

select cast(Avg(Rating) as decimal(10,2)) from Blinkit_data;

select Item_Fat_Content,cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales from Blinkit_data
group by Item_Fat_Content order by Total_Sales desc;



select Item_Fat_Content,cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales,
count(*) No_Of_Item ,
cast(Avg(Rating) as decimal(10,2)) as AVG_Rating from Blinkit_data
group by Item_Fat_Content order by Total_Sales desc;



select Item_Fat_Content,cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales,
count(*) No_Of_Item ,
cast(Avg(Rating) as decimal(10,2)) as AVG_Rating from Blinkit_data
where Outlet_Establishment_Year=2022
group by Item_Fat_Content order by Total_Sales desc;



select Item_Fat_Content,cast(sum(Total_Sales)/1000 as decimal(10,2)) as Total_Sales_Thousands ,
cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales,
count(*) No_Of_Item ,
cast(Avg(Rating) as decimal(10,2)) as AVG_Rating from Blinkit_data
where Outlet_Establishment_Year=2022
group by Item_Fat_Content order by Total_Sales_Thousands  desc;




select Top 5 Item_Type ,cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales,
count(*) No_Of_Item ,
cast(Avg(Rating) as decimal(10,2)) as AVG_Rating from Blinkit_data
group by Item_Type order by Total_Sales asc;



select Outlet_Location_Type,Item_Fat_Content,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales
 from Blinkit_data
group by Outlet_Location_Type,Item_Fat_Content order by Total_Sales asc;


SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;



select Outlet_Establishment_Year,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales
 from Blinkit_data
group by Outlet_Establishment_Year order by Outlet_Establishment_Year asc;


select Outlet_Establishment_Year,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales,
count(*) No_Of_Item ,
cast(Avg(Rating) as decimal(10,2)) as AVG_Rating
 from Blinkit_data
group by Outlet_Establishment_Year order by Outlet_Establishment_Year asc;


select Outlet_Location_Type,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(sum(Total_Sales) * 100.0/sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Persentage
from Blinkit_Data where Outlet_Establishment_Year=2020
group by Outlet_Location_Type order by Total_Sales desc ;


select Outlet_Type,
cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
cast(sum(Total_Sales) * 100.0/sum(sum(Total_Sales)) over() as decimal(10,2)) as Sales_Persentage,
cast(Avg(Total_Sales) as decimal(10,1)) as AVG_Sales,
count(*) No_Of_Item ,
cast(Avg(Rating) as decimal(10,2)) as AVG_Rating
from Blinkit_Data 
group by Outlet_Type order by Total_Sales desc ;