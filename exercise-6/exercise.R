# Exercise 6: DPLYR join introduction

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
install.packages("nycflights13")
install.packages("dplyr")

library(nycflights13)
library(dplyr)

View(flights)
View(airports)


# Create a dataframe of the average arrival delay for each destination, then use left_join
# to join on the "airports" dataframe, which has the airport info
average.delay <- flights %>% group_by(dest) %>% 
  summarise(avg.delay = mean(arr_delay, na.rm = TRUE)) %>% 
  left_join(airports, by = c('dest' = 'faa')) %>% 
  arrange(-avg.delay)

# Create a dataframe of the average arrival delay for each airline, then use left_join
# to join on the "airlines" dataframe, which has the airline info
airline.delay <- flights %>% group_by(carrier) %>% 
  summarise(avg.delay = mean(arr_delay, na.rm = TRUE)) %>% 
  left_join(airlines, by = c('carrier' = 'carrier')) %>%
  arrange(-avg.delay)


### Bonus ###
# Calculate the average delay by city AND airline, then merge on the city and airline information


# If you're running into sorting issues:
# http://stackoverflow.com/questions/26555297/dplyr-arrange-a-grouped-df-by-group-variable-not-working