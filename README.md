# etl-project

* **Introduction** 
In this project, our aim was to compile various data sources to create a data base that enables analysts to 
explore the relationships between nutrition and and health factors in countries around the world. To do this, 
we gathered data about diabetes, obesity, and COVID-19 rates. We also found a data set containing the caloric 
breakdown per food category per country. 

To replicate this project, begin by replicating our database. To do this, run the create table statements found in  etl-project_db.sql. Next, download the CSVs at the links provided and run the jupyter notebook, "Disease prevalence and diet". This notebook will import and scrape the data, clean it, and then load it into our postgres sql database.

* **E**xtract: your original data sources and how the data was formatted (CSV, JSON, pgAdmin 4, etc).
Our data came 

* Kilocalorie data-set:
https://www.kaggle.com/mariaren/covid19-healthy-diet-dataset

This data set was in CSV format. We were able to download and easily import into a jupyter notebook 
using pandas. It included caloric breakdown by food category in each country provided in the data set.
It also included prevalence of COVID-19 per country. 

* Obesity: 
https://worldpopulationreview.com/country-rankings/obesity-rates-by-country

This data set was in CSV format. We brought it into jupyter notebooks using pandas.
This data set contained obesity prevalence by country. 

* Diabetes: 
https://data.worldbank.org/indicator/SH.STA.DIAB.ZS

This data set was in CSV format. It was brought into jupyter notebooks using pandas.
It contained diabetes prevalence by country. 

* Covid-Mortality:
https://www.statista.com/statistics/1104709/coronavirus-deaths-worldwide-per-million-inhabitants/

This data set was available in html as a table on the web page provided. Using a combination of 
pandas, BeautifulSoup, and Splinter, we were able to scrape the data from the page and iterate through each page of the data. 
To extract all 150 records from the table, we needed to cycle through 13 "pages", which required automating
clicking on a "Next" button. On each page, pandas.read_html() was used to create a dataframe. 

* **T**ransform: what data cleaning or transformation was required.

For each of the datasets, certain clean up steps were required. First, each dataset was brought into jupyter notebook using pandas
so it could be manipulated as a dataframe. Next, we removed any irrelevant datafields, and renamed columns using a standard nomenclature. In each data set, we removed records where key values were missing and checked to make sure there were no duplicates.
In the case of the Covid-Mortality data set, we found a case of a country name with a superscript. We used pandas to find this record and replace it with the standard name. Standardizing these names allowed us to merge all these datasets. 

Our initial aim was to create a data set that allowed quick comparisons by country of disease prevalences. In order to do this we merged
the diabetes, obesity, and covid metrics together to create a data set with prevalence values for all these. One challenge surrounding this particular transformation is that not all countries had values for every metric, so using an inner merge would have resulted in
dropped records for countries not present in every single data set. Because of this we used a series of left merges to combine the data sets, joining on country name. Because of this, some of the countries in the final combined data set had NaN values for some of the metrics. 

* **L**oad: the final database, tables/collections, and why this was chosen.

The clean datasets were loaded into a postgres sql database called etl_project_db. It contained two tables: covid_stats and diet_kcal.
The first table contains the combined metrics produced in the previous step. The diet_kcal table contains the caloric percentage breakdown by country. These tables were loaded using SQLAlchemy inside jupyter notebook. 