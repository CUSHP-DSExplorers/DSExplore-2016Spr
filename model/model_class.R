###################
#### MODELING #####
###################

#Name: 
#Date: 
#Summary: 

#Data from 
#http://www.realclearpolitics.com/epolls/2016/president/us/2016_republican_presidential_nomination-3823.html
install.packages("RCurl")
install.packages("reshape2")
install.packages("ggplot2")

library("RCurl")
library("reshape2")
library("ggplot2")

rep <- read.csv(text = getURL("https://raw.githubusercontent.com/CUSHP-DSExplorers/DSExplore-2016Spr/master/model/republican.csv"))
dem <- read.csv(text=getURL("https://raw.githubusercontent.com/CUSHP-DSExplorers/DSExplore-2016Spr/master/model/democrat.csv"))
