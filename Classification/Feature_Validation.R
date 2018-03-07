rm(list=ls())
currentpwd=getwd()
rootpwd<-dirname(currentpwd)
source(paste(rootpwd,"Classification/FirstClassificationPhase.R",sep="/"))
l=NULL

for (i in 1:100)
{
  l=cbind(l,BestVar(number=i,adultnum= 1))
}
write.table(l,"CicledFeaturesSelectedinRF.csv")
a<-read.csv("CicledFeaturesSelectedinRF.csv",sep="")
# b<-read.table("AllFeaturesSelectedinRF.csv")

# preproces dati
l=unlist(a)
Unique<-unique(l)
Unique <- lapply(Unique, as.character)
z<-unlist(Unique)
vector=z;
h<-unlist(a)
h<-as.character(h)

# vector=cbind(vector,0)
x<-as.data.frame(table(h))
vector<-as.matrix(x)
vector[,2]<-as.numeric(vector[,2])
#  posso usarlo al posto del ciclo di sotto xD x<-as.data.frame(table(h))
# for ( i in h)
# {
#   for (vect in 1:length(vector[,1]))
#   {
#     if (vector[vect,1]==i)
#     {
#       vector[vect,2]=as.numeric(vector[vect,2])+1
#     }
#   }
# }
# #   
#   vector[,2]
 # vector[1,2]>vector[181,2]
# SCRITTURA TABLE
write.table(vector,"FeatureValues.txt");
# TABLE ORDINATA
lp<-read.table("FeatureValues.txt")
R=lp[ order(lp[,2], decreasing = TRUE), ]
write.table(R,"FeatureValuesSorted.txt",col.names = FALSE,row.names = FALSE)


