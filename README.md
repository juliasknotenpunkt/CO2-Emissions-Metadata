# USING METADATA FOR BETTER READABILITY OF DATAFRAMES

# Data source
Statistics Austria — data.statistik.gv.at

Luftemissionsrechnung ab 2008 -> https://data.statistik.gv.at/web/meta.jsp?dataset=OGD_aea001_HVD_AEA_1
Creative Commons Namensnennung 4.0 International

Einkommensteuerstatistik ab 2023 nach Bundesländern, Stufen des zu versteuernden Einkommens und Geschlecht
-> https://data.statistik.gv.at/web/meta.jsp?dataset=OGD__steuer_est_ab_2023_blgesch_EST_3_4
Creative Commons Namensnennung 4.0 International

# Motivation
The aim of this repository was to create a function (decode_dataset) that 
automatically decodes encoded data frames using provided metadata information.

# Basic Description
A lot of data found on prominent open data websites has encoded headers
(e.g. C-A10-0 -> year) and encoded columns (e.g. WIRT101 -> Wirtschaft), 
presumably to make data analysis easier. The translations of these codes are 
given in separate data frames. In order to make the final frame more readable 
for the human eye, the main function of this project takes the main csv file 
and the metadata csv file(s) and returns a new decoded data frame. The code was
tested on two examples taken from the open data portal of Statistik Austria.

