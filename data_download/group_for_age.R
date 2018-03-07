rm(list = ls())
maindir=getwd()
x<-read.csv("campioni.csv",header = TRUE,sep=",")
max_age<-max(x$AGE_AT_SCAN)
min_age<-min(x$AGE_AT_SCAN)
mean_age<-mean(x$AGE_AT_SCAN)
tot_camp<-x[which(x$DSM_IV_TR==1 | x$DSM_IV_TR==0),]
#print(paste(max_age,min_age,mean_age,sep = " "))
write.csv(x[which(x$DSM_IV_TR==1 | x$DSM_IV_TR==0),],file="tot_campioni.csv")
hist(tot_camp$AGE_AT_SCAN,main = "Istogramma età dei soggetti alla scansione",xlab = "età",ylab = "frequenza",xlim = c(0,60))

tot_child_camp<-tot_camp[tot_camp$AGE_AT_SCAN>=min_age & tot_camp$AGE_AT_SCAN<=12,]
tot_adolescent_camp<-tot_camp[tot_camp$AGE_AT_SCAN>12 & tot_camp$AGE_AT_SCAN<=mean_age,]
tot_adult_camp<-tot_camp[tot_camp$AGE_AT_SCAN>mean_age & tot_camp$AGE_AT_SCAN<=max_age,]
write.csv(tot_child_camp[,c("FILE_ID","DSM_IV_TR")],file = "tot_child_campioni.csv")
write.csv(tot_adolescent_camp[,c("FILE_ID","DSM_IV_TR")],file = "tot_adolescent_campioni.csv")
write.csv(tot_adult_camp[,c("FILE_ID","DSM_IV_TR")],file = "tot_adult_campioni.csv")



autistic<-x[which(x$DSM_IV_TR==1),]
not_autistic<-x[which(x$DSM_IV_TR==0),]
write.csv(x[which(x$DSM_IV_TR==1 | x$DSM_IV_TR==0),c("FILE_ID","DSM_IV_TR")],file="sub_autisti_not_autistic.csv")

#get autistic
write.csv(autistic,file = "campioni_autistic.csv")
data_child_autistic<-autistic[autistic$AGE_AT_SCAN>=min_age & autistic$AGE_AT_SCAN<=12,]
write.csv(data_child_autistic,file = "campioni_child_autistic.csv")
data_adolescent_autistic<-autistic[autistic$AGE_AT_SCAN>12 & autistic$AGE_AT_SCAN<=mean_age,]
write.csv(data_adolescent_autistic,file = "campioni_adolescent_autistic.csv")
data_adult_autistic<-autistic[autistic$AGE_AT_SCAN>mean_age & autistic$AGE_AT_SCAN<=max_age,]
write.csv(data_adult_autistic,file = "campioni_adult_autistic.csv")
#get not autistic
write.csv(not_autistic,file = "campioni_not_autistic.csv")
data_child_not_autistic<-not_autistic[not_autistic$AGE_AT_SCAN>=min_age & not_autistic$AGE_AT_SCAN<=12,]
write.csv(data_child_not_autistic,file = "campioni_child_not_autistic.csv")
data_adolescent_not_autistic<-not_autistic[not_autistic$AGE_AT_SCAN>12 & not_autistic$AGE_AT_SCAN<=mean_age,]
write.csv(data_adolescent_not_autistic,file = "campioni_adolescent_not_autistic.csv")
data_adult_not_autistic<-not_autistic[not_autistic$AGE_AT_SCAN>mean_age & not_autistic$AGE_AT_SCAN<=max_age,]
write.csv(data_adult_not_autistic,file = "campioni_adult_not_autistic.csv")