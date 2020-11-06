# Hope Baldwin
# Exercise 10 Script 

library(ggplot2)
# PART 1

# Data about weight and income
incomeDat = read.table("income.txt", header=TRUE, stringsAsFactors=FALSE)

# Look at the data for males only 
incomeDatMale = incomeDat[incomeDat$gender==1,]

# Get rid of values that dont make sense (less than negative income and less than 50 pounds weight)
incomeDatMaleClean <-subset(incomeDatMale[incomeDatMale$weight > 50 & incomeDatMale$income > 0,])

# Make a scatter plot with a linear trend line to assess relationship
ggplot(incomeDatMaleClean, aes(x = weight, y = income))+
  geom_point()+stat_smooth(method="lm")


# PART 2

# Read in data from file
data = read.table("data.txt", header=TRUE, sep=",", stringsAsFactors=FALSE)

# Make barpolot of the means of the four populations 
ggplot(data, aes(x = region, y=observations)) +
  xlab("Regions") + ylab("Mean Observation")+
  stat_summary(fun = mean, geom="bar")

# Make a scatterplot of all observations
ggplot(data, aes(x=region, y=observations))+
  xlab("Regions") + ylab("Observations")+
  geom_jitter()
  

# These graphs do tell me a different story. The scatter plot shows a lot more variation in the regions
# than I expected to see based on how similar their means were. 
# Despite similar means, we can see that the Eastern population spans pretty evenly
# between about 10 and 20, with some outliers abive and below. The northern popylation
# is concentrated right around 15. The south population is split into two groups, one around
# 5 and one around 25. Finally, the West is evenly interspersed between 0 and 30