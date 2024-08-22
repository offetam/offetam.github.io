#Sketch out the process you’d use to calculate the rate for table2 and table3. You will need to perform four operations:

# Extract the number of TB cases per country per year.
# Extract the matching population per country per year.
# Divide cases by population, and multiply by 10000.
# Store back in the appropriate place.

#table2 |> 
# modify last 2 columns to be cases/population and their count
# grab cases per year and population per year
# mutate to find the rate (divide cases by population and multiple by 10000)
# store into new column, "rate"


#table3 |> 
# split the rate column into 2 separate columns called cases and population
# grab cases per year and population per year
# mutate to find the rate (divide cases by population and multiple by 10000)
# store into new column, "rate"

# Why did we use pivot longer to tidy the data? 
# Instead of having each song with 76 weeks following the song each in its own column, we place it in a new column called "week" 
# because we want to see more easily how many weeks songs hit the billboard for.
billboard_longer <- billboard |> 
  pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank",
    values_drop_na = TRUE
  ) |> 
  mutate(
    week = parse_number(week)
  )
#mutate here is parsing the week column so that we can more easily use it for data as numbers are more useful than (wk1, wk2)...

billboard_longer |> 
  ggplot(aes(x = week, y = rank, group = track)) + 
  geom_line(alpha = 0.25) + 
  scale_y_reverse()