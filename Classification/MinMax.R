
MinMax <-function(data,a=0,b=1)
{ 

  currentpwd=getwd()
  rootpwd<-dirname(currentpwd)
 sample=dim(data)[1]
# DataWithoutNames=data[-1]
# features.withclass= dim(DataWithoutNames)[2]
# features.withoutclass=features.withclass-1
features.withoutclass=dim(data)[2]
 # class=DataWithoutNames[features.withclass]
 # DataWithoutClass=DataWithoutNames[-features.withclass]
 
 # NewData=data.matrix(DataWithoutClass)
  NewData=data
 
 min.data=apply(NewData,2,min)
 max.data=apply(NewData,2,max)
 x.min=matrix(min.data[1],sample)
 x.max=matrix(max.data[1],sample)
 
 for (i in 2:(features.withoutclass))
 {
   x.min=cbind(x.min,min.data[i])
 }
 for (i in 2:(features.withoutclass))
 {
   x.max=cbind(x.max,max.data[i])
 }
 
 # b=1 ;a=0
 
x= ((NewData-x.min)/(x.max-x.min) )*(b-a)+a;
# y=x
# y=cbind(x,class)
}
