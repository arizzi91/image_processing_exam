rm(list=ls())
currentpwd=getwd()
rootpwd<-dirname(currentpwd)
source(paste(currentpwd,'create_aseg_table.R',sep="/"))
source(paste(currentpwd,'control_features.R',sep="/"))
source(paste(currentpwd,'create_subjects.R',sep="/"))
age=c("adolescent","adult","child")
file_subjects=rep("/file_subjects_",3)
file_subjects=paste(file_subjects,age,".txt",sep="")
createSubjects()
resultname=rep("Data/aseg/aseg_",3)
resultname=paste(resultname,age,".csv",sep="")
data.aseg_adolescent<-createAsegTable(resultname=resultname[1],file_subject=file_subjects[1])
data.aseg_adult<-createAsegTable(resultname=resultname[2],file_subject=file_subjects[2])
data.aseg_child<-createAsegTable(resultname=resultname[3],file_subject=file_subjects[3])

# gli elementi da 1 a 56 sono tutti impostati
# dal 56esimo in poi sono tutti 0 tranne 1(l'elemento 40)
# l'elemento 40 presenta la 56 feature con valore settato a 0 quindi gli imposto la media
# anche se possiede
data_adolescent<-data.aseg_adolescent[1:56]
data_adolescent[40,56]=sum(data_adolescent[,56])/length(data_adolescent[,56])
data_adult<-data.aseg_adult[1:56]
data_adult[40,56]<-sum(data_adult[,56])/length(data_adult[,56])
data_child<-data.aseg_child[1:56]
data_child[40,56]<-sum(data_child[,56])/length(data_child[,56])
v1<-controlFeatures(data_adolescent)
v2<-controlFeatures(data_adult)
v3<-controlFeatures(data_child)

c<-rbind(data_adolescent,data_adult,data_child)
write.table(data_adolescent,file=paste(rootpwd,"Data/aseg_adolescent.csv",sep="/"),row.names = FALSE)
write.table(data_adult,file=paste(rootpwd,"Data/aseg_adult.csv",sep="/"),row.names = FALSE)
write.table(data_child,file=paste(rootpwd,"Data/aseg_child.csv",sep="/"),row.names = FALSE)
write.table(c,file=paste(rootpwd,"Data/Total_aseg.csv",sep="/"),row.names = FALSE)
# v.1<-read.csv(paste(rootpwd,"Data/aseg_featurecommon_adolescent.csv",sep="/"),sep="")
# v.2<-read.csv(paste(rootpwd,"Data/aseg_feature_adolescent.csv",sep="/"),sep="")


