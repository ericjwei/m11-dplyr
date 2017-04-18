# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
install.packages("dplyr")
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)
colnames(flights)
rownames(flights)
ncol(flights)
nrow(flights)
?flights
# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, gain = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, -gain)

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- flights %>% mutate(gain = arr_delay - dep_delay) %>% arrange(-gain)

# Make a histogram of the amount of gain using the `hist` command
hist(flights$gain)

# On average, did flights gain or lose time?
mean(flights$gain, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
seatac <- flights %>% select(gain, dest) %>% filter(dest == "SEA")

# On average, did flights to seatac gain or loose time?
mean(seatac$gain, na.rm = TRUE) #lost 11min
### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see chapter 11 section on standard evaluation
Flight <- function(from, to, interest) {
  return(flights %>% filter(origin == from, dest == to) %>% select_(interest))
}

# Retireve the air_time column for flights from JFK to SEA
air.time <- Flight("JFK", "SEA", "air_time")

# What was the average air time of those flights (in hours)?  
mean(air.time$air_time, na.rm = TRUE)

# What was the min/max average air time for the JFK to SEA flights?
min(air.time$air_time, na.rm = TRUE)
max(air.time$air_time, na.rm = TRUE)
