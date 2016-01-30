###################
# SURVEY ANALYSIS #
###################

#Name: 
#Date: 
#Summary: 

#This is an R file. This is where we write our code.
#Things we write in the R file can be evaluated in the console.



#Lines beginning with "#" are not evaluated. We use these for comments to explain our code.
#Let's read in the data from the survey
survey <- read.delim("https://raw.githubusercontent.com/CUSHP-DSExplorers/DSExplore-2016Spr/master/survey/survey.csv",
                     sep=",")

#The data is stored in an object called a dataframe. 
#We can view the data in RStudio by using the View function


#If we want to know what a function does, we can use ?


#The columns of the dataframe are called variables and the rows are called observations.
#To isolate a variable from the dataframe, we use the dollar sign



#Nominal data, like these locations are stored as factors. Each category is called a level




#Ordinal data, like minutes of travel, are stored as numeric variables.




#Let's plot the data!



#Let's make a pie chart



#Some plots can be complicated
plot.ecdf(ecdf(survey$How.old.are.you.),main="How old are you?",
          xlab="age",ylab="cumulative probability")

#Sometime data requires some manipulation before it can be plotted
survey$Have.you.seen.these.movies.

hist(main="How many of these movies have you seen?",xlab="number of movies",
     colSums(
       mapply(function(i)
         as.numeric(
           unique(unlist(strsplit(as.character(survey$Have.you.seen.these.movies.),","))) %in%
             strsplit(as.character(survey$Have.you.seen.these.movies.),",")[[i]]
         ), 1:nrow(survey)
       )
     )
  )

#Some people make functions that are better than base R. We can install them!
install.packages("ggplot2")
library("ggplot2")


#We can compute summary statistics quickly!
