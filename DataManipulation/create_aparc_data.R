rm(list=ls())
currentpwd=getwd()
source(paste(currentpwd,'create_subjects.R',sep="/"))
source(paste(currentpwd,'create_aparc_table.R',sep="/"))
source(paste(currentpwd,'control_features.R',sep="/"))
createSubjects()
adolescent_number=112
adult_number=58
rootpwd<-dirname(currentpwd)
# CREAZIONE DEL PATH DEL FILESUBJECTS
age=c("adolescent","adult","child")
file_subjects=rep("/file_subjects_",3)
file_subjects=paste(file_subjects,age,".txt",sep="")
area="area"
# divisone dei dataset rispetto alle 8 aree coinvolnte
# volume, thickness, thicknessstd, meancurv, gauscurv, foldind, curvind
meas=c("volume", "thickness", "thicknessstd", "meancurv", "gauscurv", "foldind", "curvind")

# creazioni dei file finali nel quale verranno salvati i dati
resultname.lh=rep("Data/",length(meas))
resultname.rh=rep("Data/",length(meas))
aparc.lh=rep("/aparc_lh_",length(meas))
aparc.rh=rep("/aparc_rh_",length(meas))
# LH/RH adolescent
resultname.lh.adolescent=paste(resultname.lh,age[1],aparc.lh,meas,".csv",sep="")
resultname.rh.adolescent=paste(resultname.rh,age[1],aparc.rh,meas,".csv",sep="")

# LH/RH ADULT
resultname.lh.adult=paste(resultname.lh,age[2],aparc.lh,meas,".csv",sep="")
resultname.rh.adult=paste(resultname.rh,age[2],aparc.rh,meas,".csv",sep="")
# Lh/RH child
resultname.lh.child=paste(resultname.lh,age[3],aparc.lh,meas,".csv",sep="")
resultname.rh.child=paste(resultname.rh,age[3],aparc.rh,meas,".csv",sep="")


# creazione della lista che ospiterà i file
# ADOLESCENT
data.aparc.lh.adolescent=cbind(createAparcTable(file_subject=file_subjects[1],hemi="lh",meas=area,resultname = resultname.lh.adolescent[1]))
data.aparc.rh.adolescent=cbind(createAparcTable(file_subject=file_subjects[1],hemi="rh",meas=area,resultname= resultname.rh.adolescent[1]))
# ADULT
data.aparc.lh.adult=cbind(createAparcTable(file_subject=file_subjects[2],hemi="lh",meas=area,resultname = resultname.lh.adult[1]))
data.aparc.rh.adult=cbind(createAparcTable(file_subject=file_subjects[2],hemi="rh",meas=area,resultname= resultname.rh.adult[1]))
# child
data.aparc.lh.child=cbind(createAparcTable(file_subject=file_subjects[3],hemi="lh",meas=area,resultname = resultname.lh.child[1]))
data.aparc.rh.child=cbind(createAparcTable(file_subject=file_subjects[3],hemi="rh",meas=area,resultname= resultname.rh.child[1]))



# data.aparc.rh<-setNames(data.aparc.rh,nm=meas)

for (i in 1:length(meas))
{
  data.aparc.lh.adolescent<-cbind(data.aparc.lh.adolescent,createAparcTable(file_subject=file_subjects[1],hemi="lh",meas=meas[i],resultname=resultname.lh.adolescent[i])[,-1])
  data.aparc.lh.adult<-cbind(data.aparc.lh.adult,createAparcTable(file_subject=file_subjects[2],hemi="lh",meas=meas[i],resultname=resultname.lh.adult[i])[,-1])
  data.aparc.lh.child<-cbind(data.aparc.lh.child,createAparcTable(file_subject=file_subjects[3],hemi="lh",meas=meas[i],resultname=resultname.lh.child[i])[,-1])
  data.aparc.rh.adolescent<-cbind(data.aparc.rh.adolescent,createAparcTable(file_subject=file_subjects[1],hemi="rh",meas=meas[i],resultname=resultname.rh.adolescent[i])[,-1])
  data.aparc.rh.adult<-cbind(data.aparc.rh.adult,createAparcTable(file_subject=file_subjects[2],hemi="rh",meas=meas[i],resultname=resultname.rh.adult[i])[,-1])
  data.aparc.rh.child<-cbind(data.aparc.rh.child,createAparcTable(file_subject=file_subjects[3],hemi="rh",meas=meas[i],resultname=resultname.rh.child[i])[,-1])
  
}
# unisco Rh e Lh
# rimuovo l'elemento 112(UM_1_0050323 poiche non presente nell'emisfero rh)
data.aparc.adolescent=cbind(data.aparc.lh.adolescent[-adolescent_number,],data.aparc.rh.adolescent)
data.aparc.adult=cbind(data.aparc.lh.adult[-adult_number,],data.aparc.rh.adult)
data.aparc.child=cbind(data.aparc.lh.child,data.aparc.rh.child)
# rimuovo le colonne doppie
data.write.adolescent<-data.aparc.adolescent
data.write.adolescent[length(data.aparc.lh.adolescent)+1]<-NULL
data.write.adult<-data.aparc.adult
data.write.adult[length(data.aparc.lh.adult)+1]<-NULL
data.write.child<-data.aparc.child
data.write.child[length(data.aparc.lh.child)+1]<-NULL


# salvo le tabelle uniche dividendole per età
write.table(data.write.adolescent,file=paste(rootpwd,"Data/Tot_adolescent_aparc.csv",sep="/"),row.names = FALSE)
write.table(data.write.adult,file=paste(rootpwd,"Data/Tot_adult_aparc.csv",sep="/"),row.names = FALSE)
write.table(data.write.child,file=paste(rootpwd,"Data/Tot_child_aparc.csv",sep="/"),row.names= FALSE)
# controllo il numero di features presenti nel file
v1.aparc<-controlFeatures(h.1,set="aparc",retvect = FALSE)
v2.aparc<-controlFeatures(h.2,set="aparc",retvect = FALSE)
v3.aparc<-controlFeatures(h.3,set="aparc",retvect = FALSE)
# rcontrollo se è stato scritto correttamente

# scrittura di file solo ineenti  alle feature scelte




