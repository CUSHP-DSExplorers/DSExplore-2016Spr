###################
#### SAMPLING #####
###################

#Name: 
#Date: 
#Summary: 


#Let's download the data and clean it first
# https://data.cityofnewyork.us/Public-Safety/NYPD-Motor-Vehicle-Collisions/h9gi-nx95

#In R, load the data using GUI or type in something like:
# NYPD_Motor_Vehicle_Collisions <- read.csv("~/Downloads/NYPD_Motor_Vehicle_Collisions.csv")

#We can first try to list all the column names 

#We wan to study the accidents in a whole year, so we will focus on year 2013, 2014, and 2015
#Here are some codes to clean the data

date <- as.Date(NYPD_Motor_Vehicle_Collisions$V1,format="%m/%d/%Y")
table(date < as.Date("01/01/2016",format="%m/%d/%Y"))

df1 <- NYPD_Motor_Vehicle_Collisions[
  which(
    date < as.Date("01/01/2016",format="%m/%d/%Y") &
      date > as.Date("12/31/2012",format="%m/%d/%Y")
  ),]

temp <-
  cut(as.Date(df1$DATE,format="%m/%d/%Y"),
      as.Date(paste("01/01/",2013:2016,sep=""),format="%m/%d/%Y"),
      include.lowest=TRUE)

summary(temp)

#We've got a large dataset, but many times the actual information we need is only a subset


#When NA or empty entries are present, it's called massing data
#There are many ways to deal with missing data
#Technically it's simplest to just throw away entries with missing data
#In practice, it needs more contemplation
df2.clean <- df2[!apply((is.na(df2) | df2==""), 1, any),]

#Now df2.clean is cleaned. We assign it back to df2
df2 <- df2.clean


#Get the total number of population


#Calculate the total number of injured people


#Calculate the total number of killed people


#Calculate the probability of injury

#Calculate the probability of death


#Calculate the probability of injury given borough is Manhattan
levels(df2$BOROUGH)



#Calculate the probability of injury given borough is Bronx


#Sampling
#Suppose we want to investigate if the probability of accident due to Backing Unsafely
#is significantly high
