###################
#### MODELING #####
###################

#Name: 
#Date: 
#Summary: 

#Data from 
#http://www.realclearpolitics.com/epolls/2016/president/us/2016_republican_presidential_nomination-3823.html
library("RCurl")
library("reshape2")
library("ggplot2")

rep <- read.csv(text = getURL("https://raw.githubusercontent.com/CUSHP-DSExplorers/DSExplore-2016Spr/master/model/republican.csv"))
dem <- read.csv(text=getURL("https://raw.githubusercontent.com/CUSHP-DSExplorers/DSExplore-2016Spr/master/model/democrat.csv"))

ggplot(dem)+
  aes(Poll,Clinton)+
  geom_boxplot()

ggplot(dem)+
  aes(Poll,Clinton)+
  geom_boxplot() +
  coord_flip()

anova(lm(Clinton~Poll,data=dem))

ggplot(dem)+
  aes(Poll,Clinton,fill=Type)+
  geom_boxplot() +
  coord_flip()

anova(lm(Clinton~Poll+Type,data=dem))

ggplot(rep[rep$Type!="A",])+
  aes(Type,Trump) +
  geom_boxplot()

anova(lm(Trump~Type,data=rep))

ggplot(dem[dem$Type!="A",])+
  aes(Type,Sanders) +
  geom_boxplot()

anova(lm(Sanders~Type,data=dem))

rep2 <- melt(rep[,-c(2,3,4)],id=c("Poll","Type"))
colnames(rep2) <- c("Poll","Type","Candidate","Vote")

ggplot(data=rep2)+
  aes(x=Candidate,y=Vote,fill=Type) +
  geom_boxplot()
anova(lm(Vote~Candidate+Type,data=election2))

rep$Start <- as.Date(rep$Start,format="%m/%d/%y")
rep$End <- as.Date(rep$End,format="%m/%d/%y")

summary(lm(Trump~Start,data=rep))
ggplot(data=rep)+
  aes(x=Start,y=Trump)+
  geom_point() +
  geom_smooth(color="blue",se=FALSE) +
  geom_smooth(method="lm",color="red",se=FALSE)

ggplot(data=rep)+
  aes(x=Start,y=Trump)+
  geom_point() +
  geom_smooth(color="blue",se=FALSE) +
  geom_smooth(method="lm",color="red",se=FALSE,
              formula=y~poly(x,2))

ggplot(data=rep)+
  aes(x=Start,y=Trump)+
  geom_point() +
  geom_smooth(color="blue",se=FALSE) +
  geom_smooth(method="lm",color="red",se=FALSE,
              formula=y~poly(x,4))

dem$Start <- as.Date(dem$Start,format="%m/%d/%y")
dem$End <- as.Date(dem$End,format="%m/%d/%y")

ggplot(data=dem)+
  aes(x=Start,y=Clinton)+
  geom_point() +
  geom_smooth(method="lm",color="red",se=FALSE)

ggplot(data=dem)+
  aes(x=Start,y=Clinton)+
  geom_point() +
  geom_smooth(method="lm",color="red",se=FALSE,
              formula=y~poly(x,3))

ggplot(data=dem)+
  geom_point(aes(x=Start,y=Clinton),color="red") +
  geom_smooth(aes(x=Start,y=Clinton),method="lm",color="red",se=FALSE) +
  geom_point(aes(x=Start,y=Sanders),color="blue") +
  geom_smooth(aes(x=Start,y=Sanders),method="lm",color="blue",se=FALSE)

ggplot(data=dem)+
  geom_point(aes(x=Start,y=Clinton),color="red") +
  geom_smooth(aes(x=Start,y=Clinton),method="lm",color="red",se=FALSE,
              formula=y~poly(x,3)) +
  geom_point(aes(x=Start,y=Sanders),color="blue") +
  geom_smooth(aes(x=Start,y=Sanders),method="lm",color="blue",se=FALSE,
              formula=y~poly(x,3)) +
  facet_grid(Type~.)

fit.Clinton <- lm(Clinton~Start,data=dem)
fit.Sanders <- lm(Sanders~Start,data=dem)
newdata <- data.frame(Start=
                        seq(from=as.Date("2016-01-01"),to=as.Date("2016-11-01"),by="month")
)
newdata$Clinton <- predict(fit.Clinton,newdata=newdata)
newdata$Sanders <- predict(fit.Sanders,newdata=newdata)
dem2 <- rbind(newdata,dem[,c(2,6,7)])

ggplot(data=dem2)+
  geom_point(aes(x=Start,y=Clinton),color="red") +
  geom_smooth(aes(x=Start,y=Clinton),method="lm",color="red",se=FALSE) +
  geom_point(aes(x=Start,y=Sanders),color="blue") +
  geom_smooth(aes(x=Start,y=Sanders),method="lm",color="blue",se=FALSE)

fit.Clinton <- lm(Clinton~poly(Start,3),data=dem)
fit.Sanders <- lm(Sanders~poly(Start,3),data=dem)
newdata <- data.frame(Start=
    seq(from=as.Date("2016-01-01"),to=as.Date("2016-11-01"),by="month")
)
newdata$Clinton <- predict(fit.Clinton,newdata=newdata)
newdata$Sanders <- predict(fit.Sanders,newdata=newdata)

dem2 <- rbind(newdata,dem[,c(2,6,7)])
ggplot(data=dem2)+
  geom_point(aes(x=Start,y=Clinton),color="red") +
  geom_smooth(aes(x=Start,y=Clinton),method="lm",color="red",se=FALSE,
              formula=y~poly(x,3)) +
  geom_point(aes(x=Start,y=Sanders),color="blue") +
  geom_smooth(aes(x=Start,y=Sanders),method="lm",color="blue",se=FALSE,
              formula=y~poly(x,3))



