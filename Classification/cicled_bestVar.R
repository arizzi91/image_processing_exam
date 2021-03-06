# CREAZIONE TABELLA FINALE CON feature ordinate con frequenza maggiore di 50
rm(list=ls())

currentpwd=getwd()
rootpwd<-dirname(currentpwd)
source(paste(rootpwd,"Classification/MinMax.R",sep="/"))
source(paste(rootpwd,"Classification/DataSplitting.R",sep="/"))

# sorted >50
Sorted<-read.table("FeatureValuesSorted.txt")
Sorted50<-Sorted[as.logical(Sorted[,2]>45),]

adult<-read.csv(paste(rootpwd,"Data/WithClass/Adult_data_withclass.csv",sep="/"),sep="")
adult$CLASS<-as.character(adult$CLASS)
adult$CLASS<-as.factor(adult$CLASS)

adult<-adult[-1]
adultY=adult[,length(adult[1,])]
adult<-adult[-length(adult[1,])]
adult.minmax<-MinMax(adult)
ca<-as.character(Sorted50[,1])
adult.filter<-adult.minmax[ca]
CLASS=adultY
adult.total<-cbind(adult.filter,CLASS)
OKOKO










































































































































































































































































































































































































































Adult.Divided<-DataSplit(adult.total)
adult.Train<-data.frame(Adult.Divided[1])
adult.Test<-data.frame(Adult.Divided[2])
write.table(adult.Train,file=paste(rootpwd,"FinalTestTrainData/AdultCicled/adultTrain.csv",sep="/"),row.names = FALSE)
write.table(adult.Test,file=paste(rootpwd,"FinalTestTrainData/AdultCicled/adultTest.csv",sep="/"),row.names = FALSE)

# AdultTrain<-read.csv(paste(rootpwd,"FinalTestTrainData/adultTrain.csv",sep="/"),sep="")
# AdultTest<-read.csv(paste(rootpwd,"FinalTestTrainData/adultTest.csv",sep="/"),sep="")
# AdoTrain<-read.csv(paste(rootpwd,"FinalTestTrainData/adolescentTrain.csv",sep="/"),sep="")
# AdoTest<-read.csv(paste(rootpwd,"FinalTestTrainData/adolescentTest.csv",sep="/"),sep="")
# ChiTrain<-read.csv(paste(rootpwd,"FinalTestTrainData/childTrain.csv",sep="/"),sep="")
# ChiTest<-read.csv(paste(rootpwd,"FinalTestTrainData/childTest.csv",sep="/"),sep="")
