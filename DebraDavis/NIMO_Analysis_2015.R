rm(list=ls())

#install.packages("vegan") # Installs the library for you
library(vegan) # calls the library

setwd('~/Desktop/DebraDavis') # Update directory
nimo <- read.csv('NIMO_2015.csv') # Import Datafile



# Plot some Environmental Variables
par(mfrow=c(2,2))
plot(nimo$Nitrite, ylab="Nitrite")
plot(nimo$Salinity, ylab="Salinity")
plot(nimo$Sulphide, ylab="Sulphide")
plot(nimo$Soil.Temp, ylab="Soil Temperature")

# What are we doing here?
plot(nimo$Nitrite[nimo$X4 == 1], ylab="Nitrite")

test <- aggregate(nimo[,8:15], by=list(as.factor(nimo[, 23])), FUN=mean, na.rm=TRUE, na.action=NULL)

na.action
