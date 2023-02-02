
with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])


select stays_in_week_nights+stays_in_weekend_nights from hotels

--add rows stays-in weekend_nights and stays_in_week_nights

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])

select stays_in_week_nights+stays_in_weekend_nights from hotels

--multiplying the stays by the average daily rates  to find the revenue

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])

select (stays_in_week_nights+stays_in_weekend_nights)* adr from hotels

--rename the column

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])

select (stays_in_week_nights+stays_in_weekend_nights)* adr as Revenue from hotels

--Including the date/year of arrival

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])

select
arrival_date_year,
(stays_in_week_nights+stays_in_weekend_nights)* adr as Revenue from hotels

--Group by Year and Hotel

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])

select
arrival_date_year,
hotel,
sum((stays_in_week_nights+stays_in_weekend_nights)* adr) as Revenue from hotels
group by arrival_date_year,hotel

--Round off

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])

select
arrival_date_year,
hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)* adr),2) as Revenue from hotels
group by arrival_date_year,hotel

--Running the market segment Query

select* from dbo.market_segment$

--joining hotels to market segment dataset to market segment column

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])


select * from hotels
left join [dbo].[market_segment$]
on hotels.market_segment = dbo.market_segment$.market_segment 

--Join the meal dataset to the other data

with hotels as(
SELECT * FROM[dbo].['2018$']
union
SELECT * FROM[dbo].['2019$']
union
SELECT * FROM[dbo].['2020$'])


select * from hotels
left join [dbo].[market_segment$]
on hotels.market_segment = dbo.market_segment$.market_segment 
left join dbo.meal_cost$
on meal_cost$.meal = hotels.meal
