BestVar<-function(number,adultnum=0)
# rm(list=ls())
{
  
    
  set.seed(number)
currentpwd=getwd()
rootpwd<-dirname(currentpwd)
source(paste(rootpwd,"Classification/MinMax.R",sep="/"))
source(paste(rootpwd,"Classification/DataSplitting.R",sep="/"))
source(paste(rootpwd,"Classification/generateString.R",sep="/"))
source(paste(rootpwd,"Classification/featureSelection.R",sep="/"))
source(paste(rootpwd,"Classification/correlation_data.R",sep="/"))
adolescent<-read.csv(paste(rootpwd,"Data/WithClass/Adolescent_data_withclass.csv",sep="/"),sep="")
adult<-read.csv(paste(rootpwd,"Data/WithClass/Adult_data_withclass.csv",sep="/"),sep="")
child<-read.csv(paste(rootpwd,"Data/WithClass/Child_data_withclass.csv",sep="/"),sep="")

# iniziliazzo il factor sull'ultima colonna
adolescent$CLASS<-as.character(adolescent$CLASS)
adolescent$CLASS<-as.factor(adolescent$CLASS)
adult$CLASS<-as.character(adult$CLASS)
adult$CLASS<-as.factor(adult$CLASS)
child$CLASS<-as.character(child$CLASS)
child$CLASS<-as.factor(child$CLASS)
if (adultnum!=1)
{
# 
# 
# 
# 
# block for adolescent
Adolescent.Divided<-DataSplit(adolescent)
adolescent.Train<-data.frame(Adolescent.Divided[1])
adolescent.Test<-data.frame(Adolescent.Divided[2])


# la label dei pazienti
adolescent.TrainLabel<-adolescent.Train[1]
# rimuovo la classe all'interno di data1 e il primo label che è identificativo dei soggetti
# e la inserisco nelle y
adolescent.TrainX=adolescent.Train[,2:( length(adolescent.Train[1,])-1)]
adolescent.TrainY=adolescent.Train[,length(adolescent.Train[1,])]
adolescent.TestX=adolescent.Test[,2:( length(adolescent.Test[1,])-1)]
adolescent.TestY=adolescent.Test[,length(adolescent.Test[1,])]

# tolgo le feature con correlazione
adolescent.TrainX.withoutcorrelation<-correlationData(adolescent.TrainX);

# random forest con feature selection
# EFFETTUO IL MINMAX SU X
adolescent.TrainX.withoutcorrelation<-MinMax(adolescent.TrainX.withoutcorrelation)


adolescentResults<-featureSelection(adolescent.TrainX.withoutcorrelation,adolescent.TrainY)

adolescent.features=adolescentResults$results$Variables[3]
# print(adolescentResults)
# varie plot 
# plot(adolescentResults, type=c("g", "o"),xlim=1:20)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)
# plot(adolescentResults, type=c("g", "o"),xlim=1:100)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)
# plot(adolescentResults, type=c("g", "o"),xlim=1:600)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)

# da l'importanza di tutte le variabile in ordine decrescente
# vars=results$fit$importance
# ti da la possiilità di selezionarne un numero fisso
adolescent.selectedVars <- adolescentResults$variables
adolescent.bestVar <-adolescentResults$control$functions$selectVar(adolescent.selectedVars, adolescent.features)

adolescent.TrainX.bestVar<-adolescent.TrainX.withoutcorrelation[adolescent.bestVar]
adolescent.TestX.bestVar<-adolescent.TestX[adolescent.bestVar]

adolescent.TestX.minmax<-MinMax(adolescent.TestX.bestVar)
CLASS=adolescent.TrainY
adolescent.final.train<-cbind(adolescent.TrainX.bestVar,CLASS)
CLASS=adolescent.TestY
adolescent.final.test<-cbind(adolescent.TestX.minmax,CLASS)
write.table(adolescent.final.train,file=paste(rootpwd,"FinalTestTrainData/adolescentTrain.csv",sep="/"),row.names = FALSE)
write.table(adolescent.final.test,file=paste(rootpwd,"FinalTestTrainData/adolescentTest.csv",sep="/"),row.names = FALSE)

}
# 
# 
# 
# ####################################################################################
# block for adult
Adult.Divided<-DataSplit(adult)
adult.Train<-data.frame(Adult.Divided[1])
adult.Test<-data.frame(Adult.Divided[2])


# la label dei pazienti
adult.TrainLabel<-adult.Train[1]
# rimuovo la classe all'interno di data1 e il primo label che è identificativo dei soggetti
# e la inserisco nelle y
adult.TrainX=adult.Train[,2:( length(adult.Train[1,])-1)]
adult.TrainY=adult.Train[,length(adult.Train[1,])]
adult.TestX=adult.Test[,2:( length(adult.Test[1,])-1)]
adult.TestY=adult.Test[,length(adult.Test[1,])]

# tolgo le feature con correlazione
adult.TrainX.withoutcorrelation<-correlationData(adult.TrainX);

 adult.TrainX.withoutcorrelation<-MinMax(adult.TrainX.withoutcorrelation)
# random forest con feature selection

adultResults<-featureSelection(adult.TrainX.withoutcorrelation,adult.TrainY)
adult.features=adultResults$results$Variables[3]
# print(adultResults)
# # varie pl 
# plot(adultResults, type=c("g", "o"),xlim=1:20)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)
# plot(adultResults, type=c("g", "o"),xlim=1:100)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)
# plot(adultResults, type=c("g", "o"),xlim=1:600)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)

# da l'importanza di tutte le variabile in ordine decrescente
# vars=results$fit$importance
# ti da la possiilità di selezionarne un numero fisso
adult.selectedVars <- adultResults$variables
adult.bestVar <-adultResults$control$functions$selectVar(adult.selectedVars, adult.features)

adult.TrainX.bestVar<-adult.TrainX.withoutcorrelation[adult.bestVar]
adult.TestX.bestVar<-adult.TestX[adult.bestVar]
# EFFETTUO IL MINMAX SU X

adult.TestX.minmax<-MinMax(adult.TestX.bestVar)
CLASS=adult.TrainY
adult.final.train<-cbind(adult.TrainX.bestVar,CLASS)
CLASS=adult.TestY
adult.final.test<-cbind(adult.TestX.minmax,CLASS)
write.table(adult.final.train,file=paste(rootpwd,"FinalTestTrainData/adultTrain.csv",sep="/"),row.names = FALSE)
write.table(adult.final.test,file=paste(rootpwd,"FinalTestTrainData/adultTest.csv",sep="/"),row.names = FALSE)

# 
# 
# ##################################################################################
# block for child
if (adultnum!=1)
{
child.Divided<-DataSplit(child)
child.Train<-data.frame(child.Divided[1])
child.Test<-data.frame(child.Divided[2])


# la label dei pazienti
child.TrainLabel<-child.Train[1]
# rimuovo la classe all'interno di data1 e il primo label che è identificativo dei soggetti
# e la inserisco nelle y
child.TrainX=child.Train[,2:( length(child.Train[1,])-1)]
child.TrainY=child.Train[,length(child.Train[1,])]
child.TestX=child.Test[,2:( length(child.Test[1,])-1)]
child.TestY=child.Test[,length(child.Test[1,])]

# tolgo le feature con correlazione
child.TrainX.withoutcorrelation<-correlationData(child.TrainX);


 child.TrainX.withoutcorrelation<-MinMax(child.TrainX.withoutcorrelation)
# random forest con feature selection
childResults<-featureSelection(child.TrainX.withoutcorrelation,child.TrainY)
child.features=childResults$results$Variables[3]
# print(childResults)
# varie plot 
# plot(childResults, type=c("g", "o"),xlim=1:20)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)
# plot(childResults, type=c("g", "o"),xlim=1:100)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)
# plot(childResults, type=c("g", "o"),xlim=1:600)
# cat(sprintf('\nProgram paused. Press enter to continue.\n'))
# line <- readLines(con = stdin(),1)

# da l'importanza di tutte le variabile in ordine decrescente
# vars=results$fit$importance
# ti da la possiilità di selezionarne un numero fisso
child.selectedVars <- childResults$variables
child.bestVar <-childResults$control$functions$selectVar(child.selectedVars, child.features)

child.TrainX.bestVar<-child.TrainX.withoutcorrelation[child.bestVar]
child.TestX.bestVar<-child.TestX[child.bestVar]
# EFFETTUO IL MINMAX SU X

child.TestX.minmax<-MinMax(child.TestX.bestVar)
CLASS=child.TrainY
child.final.train<-cbind(child.TrainX.bestVar,CLASS)
CLASS=child.TestY
child.final.test<-cbind(child.TestX.minmax,CLASS)
write.table(child.final.train,file=paste(rootpwd,"FinalTestTrainData/childTrain.csv",sep="/"),row.names = FALSE)
write.table (child.final.test,file=paste(rootpwd,"FinalTestTrainData/childTest.csv",sep="/"),row.names = FALSE)

}
    print(number)
    a<-(adult.bestVar)
    
# a<-list(adolescent.bestVar,adult.bestVar,child.bestVar);
}
