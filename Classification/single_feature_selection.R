rm(list=ls())
currentpwd=getwd()
rootpwd<-dirname(currentpwd)
source(paste(rootpwd,"Classification/FirstClassificationPhase.R",sep="/"))

BestVar(number=1,adultnum= 1)
BestVar(number=1,adultnum= 0)
BestVar(number=1,adultnum= 2)
