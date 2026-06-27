library(tidyverse)
source("code/functions.R")

df_emissions_main <- read_csv2("data/emissions/OGD_aea001_HVD_AEA_1.csv")
df_emissions_header <- read_csv2("data/emissions/OGD_aea001_HVD_AEA_1_HEADER.csv")
df_emissions_year <- read_csv2("data/emissions/OGD_aea001_HVD_AEA_1_C-A10-0.csv")
df_emissions_wirt <- read_csv2("data/emissions/OGD_aea001_HVD_AEA_1_C-WIRT0-0.csv")

lookups_emissions <- list(
  "C-A10-0" = df_emissions_year,
  "C-WIRT0-0" = df_emissions_wirt
)

df_emissions_main_new <- decode_dataset(df_emissions_main, lookups_emissions, df_emissions_header)

setwd("~/Desktop/Job Preparation/Programming/SA CO2 Emissionen/CO2-Emissions")
write.csv(df_emissions_main_new, "results/CO2_emissions.csv", row.names = FALSE)

# -------------------------------------------------------------------------------------------------

df_finance_main <- read_csv2("data/finance/OGD__steuer_est_ab_2023_blgesch_EST_3_4.csv")
df_finance_header <- read_csv2("data/finance/OGD__steuer_est_ab_2023_blgesch_EST_3_4_HEADER.csv")
df_finance_year <- read_csv2("data/finance/OGD__steuer_est_ab_2023_blgesch_EST_3_4_C-A10-0.csv")
df_finance_sex <- read_csv2("data/finance/OGD__steuer_est_ab_2023_blgesch_EST_3_4_C-GESCHL-0.csv")
df_finance_state <- read_csv2("data/finance/OGD__steuer_est_ab_2023_blgesch_EST_3_4_C-BLD2_EXT-0.csv")
df_finance_age <- read_csv2("data/finance/OGD__steuer_est_ab_2023_blgesch_EST_3_4_C-ESTUF_13-0.csv")

lookups_finance <- list(
  "C-A10-0" = df_finance_year,
  "C-ESTUF_13-0" = df_finance_age,
  "C-BLD2_EXT-0" = df_finance_state,
  "C-GESCHL-0" = df_finance_sex
)

df_finance_main_new <- decode_dataset(df_finance_main, lookups_finance, df_finance_header)
View(df_finance_main_new)

write.csv(df_finance_main_new, "results/payment_taxes.csv", row.names = FALSE)
