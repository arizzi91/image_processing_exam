DataSplit<- function(data,perc=0.8)
{
  
  n = nrow(data)
  trainIndex = sample(1:n, size = round(perc*n), replace=FALSE)
  train = data[trainIndex ,];
  test = data[-trainIndex ,];
  # testX <-test [,-5]
  # trainX<-train[,-5]
 result=list(train,test)
  # print(model)
  # a<-predict(model,testX)
  # confusionMatrix(a,test$class) 
}

