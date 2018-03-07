
# a causa di un errore nella precendetem funzione (ora fixed)
# devi far ripartire create_aparc_data prima
rm(list=ls())
currentpwd=getwd()
rootpwd<-dirname(currentpwd)
source(paste(currentpwd,'create_aseg_table.R',sep="/"))
source(paste(currentpwd,'control_features.R',sep="/"))
source(paste(currentpwd,'create_subjects.R',sep="/"))
source(paste(currentpwd,'adding_class.R',sep="/"))
parc.adolescent<-read.csv(paste(rootpwd,"Data/Tot_adolescent_aparc.csv",sep="/"),sep="")
parc.adult<-read.csv(paste(rootpwd,"Data/Tot_adult_aparc.csv",sep="/"),sep="")
parc.child<-read.csv(paste(rootpwd,"Data/Tot_child_aparc.csv",sep="/"),sep="")
aseg.adolescent<-read.csv(paste(rootpwd,"Data/aseg_adolescent.csv",sep="/"),sep="")
aseg.adult<-read.csv(paste(rootpwd,"Data/aseg_adult.csv",sep="/"),sep="")
aseg.child<-read.csv(paste(rootpwd,"Data/aseg_child.csv",sep="/"),sep="")
#rimozione colonne ed soggetto 
aseg.adolescent[1]<-NULL
aseg.adult[1]<-NULL
aseg.child[1]<-NULL
# rimozione soggetto in piu in aparc
parc.adolescent<-parc.adolescent[-249,]


adolescent<-cbind(parc.adolescent,aseg.adolescent)
adult<-cbind(parc.adult,aseg.adult)
child<-cbind(parc.child,aseg.child)
# rimozione colonna tutti 0 //X5th.Ventricle.volume"
# |Left.WM.hypointensities.volume"|Left.WM.hypointensities.volume
# LEFT.NON.WM.hypointensities.volume|| e l'altro anche 
adolescent<-adolescent[,as.logical(colSums(adolescent!=0))]
adult<-adult[,as.logical(colSums(adult!=0))]
child<-child[,as.logical(colSums(child!=0))]
v1<-which(adolescent==0 , arr.ind=T )
v2<-which(adult==0 , arr.ind=T)
v3<-which(child==0 , arr.ind = T)
# da queste 3 liste è emerso che la colona 582 possiede troppi elementi a 0 per cui 
# andiamo a eleminare
adole<-adolescent[,-582]
adult_1<-adult[,-582]
chi<-child[,-582]
# sono enormemente dimuniti
# 
v1.1<-which(adole==0,arr.ind=T)
# rimozione elementi che presentano 0 con frequenza > di 7
List_ado=unlist(v1.1[,1])
Freq_ado<-as.data.frame(table(List_ado))
matrix_freq_ado<-as.matrix(Freq_ado)
vars_ado<-matrix_freq_ado[as.logical(Freq_ado[,2]>7),]
adolescent_1<-adole[-as.numeric(vars_ado[,1]),]
v1.2<-which(adolescent_1==0,arr.ind=T)
# SI = 0 A CAZZO
# 89 SI
# 92  SI
# 91 si
# NO 8 566 ,2 580
# NO 10 566,11    580
# 19 580, 20 580
# NO 90 222,90 256
# adoles<-adole[-114,]
# v1.1<-which(adoles==0,arr.ind=T)
# adoles<-adoles[-92,]
v2.1<-which(adult_1==0 , arr.ind=T)
# adult
List_adu=unlist(v2.1[,1])
Freq_adu<-as.data.frame(table(List_adu))
matrix_freq_adu<-as.matrix(Freq_adu)
vars_adu<-matrix_freq_adu[as.logical(Freq_adu[,2]>7),]
length(vars_adu[,1])

# adult_1<-adu[-as.numeric(vars_adu[,1]),]
# v2.2<-which(adult_1==0,arr.ind=T)
# child
v3.1<-which(chi==0 , arr.ind = T)
List_chi=unlist(v3.1[,1])
Freq_chi<-as.data.frame(table(List_chi))
matrix_freq_chi<-as.matrix(Freq_chi)
vars_chi<-matrix_freq_chi[as.logical(Freq_chi[,2]>7),]
length(vars_chi[,1])
child_1<-chi[-as.numeric(vars_chi[,1]),]
v3.2<-which(child_1==0,arr.ind=T)
# colonne rimaste a 0 TOTALI

v<-rbind(v1.2,v2.1)
v<-rbind(v,v3.2)
List=unlist(v[,2])
Freq<-as.data.frame(table(List))
matrix_freq<-as.matrix(Freq)
# frequenza 


write.table(adolescent_1,file=paste(rootpwd,"Data/NoClass/Adolescent_noclass.csv",sep="/"),row.names = FALSE)
write.table(adult_1,file=paste(rootpwd,"Data/NoClass/Adult_noclass.csv",sep="/"),row.names = FALSE)
write.table(child_1,file=paste(rootpwd,"Data/NoClass/Child_noclass.csv",sep="/"),row.names = FALSE)
# aggiungo la classe

addingClass()
# 
# 
# controllo delle features creazione
h1<-read.csv(paste(rootpwd,"Data/NoClass/Adolescent_noclass.csv",sep="/"),sep="")
h2<-read.csv(paste(rootpwd,"Data/NoClass/Adult_noclass.csv",sep="/"),sep="")
h3<-read.csv(paste(rootpwd,"Data/NoClass/Child_noclass.csv",sep="/"),sep="")
# h1.aparc<-read.csv(paste(rootpwd,"Data/Tot_adolescent_aparc.csv",sep="/"),sep="")
# h2.aparc<-read.csv(paste(rootpwd,"Data/Tot_adult_aparc.csv",sep="/"),sep="")
# h3.aparc<-read.csv(paste(rootpwd,"Data/Tot_child_aparc.csv",sep="/"),sep="")
# ricontrollo features 


v1.aparc<-controlFeatures(parc.adolescent,set="aparc")
# v2.aparc<-controlFeatures(parc.adult,set="aparc")
# v3.aparc<-controlFeatures(parc.child,set="aparc")
v1.aseg<-controlFeatures(aseg.adolescent)
# v2.aseg<-controlFeatures(aseg.adult)
# v3.aseg<-controlFeatures(aseg.child)
# scrivo tutti i soggetti con tutte le feature in un unico file
z<-rbind(h1,h2,h3)
write.table(z,file=paste(rootpwd,"Data/Total_DATA.csv",sep="/"),row.names = FALSE)
# scrivo le feature
# Adolescent.features<-(h1[,1])
# Adolescent.features<-as.matrix(Adolescent.features)
# for (i in v.1)
# {
#   Adolescent.features<-cbind(Adolescent.features,data.write.adolescent[,i])
# }
# v.final=c("Subjects",v.adolescent)
# colnames(Adolescent.features)<-v.final

h=c(v1.aparc,v1.aseg)
write.table(h,file="FeaturesFounded.txt",sep="\n")
