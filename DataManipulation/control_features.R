controlFeatures<-function(data,set="aseg",retvect=TRUE)
{
  # first index for aseg = 373 
  # last index for aparc 373
currentpwd=getwd()
rootpwd<-dirname(currentpwd)
source(paste(currentpwd,'create_subjects.R',sep="/"))
createSubjects()
list_features=read.table(paste(rootpwd,"FEATURE/elenco feature scelte.txt",sep="/"))
list_features=as.matrix(list_features)
list_features=t(list_features)
list_features=list_features[1,]
label<-unlist(dimnames(data)[2])
check_features<-label
# dovrei metterlo in label =data.aseg.labels<-unlist(dimnames(data.aseg)[2])
# a<-data.aseg.matrix[dimnames(data.aseg.matrix)]
# a<-dimnames(data.aseg.matrix)[2]
ifelse(set=="aseg"|set=="ASEG",  
       {
         # uniformo le stringhe con quelle presenti nel file elenco feature
        list_features<-gsub('_|Volume|mm3|\\.|:|-|_|,',"",list_features)
       check.ripped<-gsub('\\.|volume|-|:','',check_features)
       check.ripped<-check.ripped[-1];
       },
       {
         list_features=gsub('\\.|:|-|_','',list_features)
         check.ripped=gsub('area','SurfArea',check_features)
         check.ripped=gsub('volume','GrayVol',check.ripped)
         check.ripped=gsub('thicknessstd','ThickStd',check.ripped)
         check.ripped=gsub('thickness','ThickAvg',check.ripped)
         check.ripped=gsub('meancurv','MeanCurv',check.ripped)
         check.ripped=gsub('curvind','CurvInd',check.ripped)
         check.ripped=gsub('\\.|:|-|_','',check.ripped);
       } )

index=c()
# inizializo il vettore e confronto le stringhe
vector=c()
h=0
for (i in check.ripped)
{
  for (j in list_features)
  {  
    if(i==j)
      
    {
      vector=c(vector,i)
      index=c(index,h)
    }
  }
  h=h+1
  
}
if (retvect==TRUE)
{
  return(vector)
}else return(index)
}
