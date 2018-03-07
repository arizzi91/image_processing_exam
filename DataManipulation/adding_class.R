addingClass<-function()
{
currentpwd=getwd()
rootpwd<-dirname(currentpwd)

adolescent<-read.csv(paste(rootpwd,"Data/NoClass/Adolescent_noclass.csv",sep="/"),sep="")
adult<-read.csv(paste(rootpwd,"Data/NoClass/Adult_noclass.csv",sep="/"),sep="")
child<-read.csv(paste(rootpwd,"Data/NoClass/Child_noclass.csv",sep="/"),sep="")

class_adolescent<-read.csv(paste(rootpwd,"Project/tot_adolescent_campioni.csv",sep="/"))
class_adult<-read.csv(paste(rootpwd,"Project/tot_adult_campioni.csv",sep="/"))
class_child<-read.csv(paste(rootpwd,"Project/tot_child_campioni.csv",sep="/"))
classes<-class_adolescent
data<-adolescent
adolescent_final=NULL
adult_final=NULL
child_final=NULL
for (i in 1:length(classes[,2]))
{
  L=FALSE
  j=1
            while(L==FALSE&&j<length(data[,2]))
             {
                if(as.character(data[j,1])==as.character(classes[i,2]))
                 { 
                  
                  class<-classes[i,3]
                  temp<-cbind(data[j,],class)
                  adolescent_final<-rbind(adolescent_final,temp)
                  L==TRUE
                 
                }
              j=j+1
             }
}
# adult
classes<-class_adult
data<-adult
for (i in 1:length(classes[,2]))
{
  L=FALSE
  j=1
  while(L==FALSE&&j<length(data[,2]))
  {
    if(as.character(data[j,1])==as.character(classes[i,2]))
    { 
      
      class<-classes[i,3]
      temp<-cbind(data[j,],class)
      adult_final<-rbind(adult_final,temp)
      L==TRUE
      
    }
    j=j+1
  }
}

# child
classes<-class_child
data<-child
for (i in 1:length(classes[,2]))
{
  L=FALSE
  j=1
  while(L==FALSE&&j<length(data[,2]))
  {
    if(as.character(data[j,1])==as.character(classes[i,2]))
    { 
      
      class<-classes[i,3]
      temp<-cbind(data[j,],class)
      child_final<-rbind(child_final,temp)
      L==TRUE
      
    }
    j=j+1
  }
}
length.adolescent=length(adolescent_final)
length.adult=length(adult_final)
length.child=length(child_final)
colnames(adolescent_final)[length.adolescent]="CLASS"
colnames(adult_final)[length.adult]="CLASS"
colnames(child_final)[length.child]="CLASS"
# rimozione colonne omologhe;
# adolescent_final<-adolescent_final[-276]
# adult_final<-adult_final[-276]
# child_final<-child_final[-276]

write.table(adolescent_final,file=paste(rootpwd,"Data/WithClass/Adolescent_data_withclass.csv",sep="/"),row.names = FALSE)
write.table(adult_final,file=paste(rootpwd,"Data/WithClass/Adult_data_withclass.csv",sep="/"),row.names = FALSE)
write.table(child_final,file=paste(rootpwd,"Data/WithClass/Child_data_withclass.csv",sep="/"),row.names = FALSE)

}