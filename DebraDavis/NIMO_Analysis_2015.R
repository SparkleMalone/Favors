rm(list=ls())

#install.packages("vegan") # Installs the library for you
library(vegan) # calls the library

setwd('~/git/Favors/DebraDavis') # Update directory
nimo <- read.csv('NIMO_2015.csv') # Import Datafile

source("http://bioconductor.org/biocLite.R") # Install package
biocLite("bioDist")
library(bioDist)


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

# Spearman.distances shows the liklihood of occurrence between species.

nimo.m <- as.matrix(nimo[,16:60])
nimo.dist<- cor(nimo.m, method = 'spearman')

nimo.dist2 <- 1-nimo.dist

test.1 <- spearman.dist(nimo.m)
head(test.1, 800)
