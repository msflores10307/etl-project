create table covid_stats (
country varchar,
obesity_rate int,
diabetes_prevalence int,
covid_deaths int,
confirmed_cases int,
population int
);


create table diet_kcal (
id serial primary key,
country varchar,
Alcoholic_Beverages int, 
Animal_Products int, 
Animal_fats int,
Aquatic_Products_other int, 
Cereals_Excluding_Beer int, 
Eggs int,
Fish_seafood int, 
Fruits_Excluding_Wine int, 
Meat int,
Milk_Excluding_Butter int, 
Miscellaneous int,
Offals int, 
Oilcrops int,
Pulses int, 
Spices int, 
Starchy_Roots int, 
Stimulants int, 
Sugar_Crops int,
Sugar_Sweeteners int, 
Treenuts int, 
Vegetal_Products int, 
Vegetable_Oils int,
Vegetables int
);