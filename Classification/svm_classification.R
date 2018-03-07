svm_class_linear<-function(x_train,x_test){
library(caret)
print("svm_linear")
trctrl<-trainControl(method="repeatedcv",number=10,repeats = 3)
svm_linear<-train(CLASS ~ .,data=x_train,method = "svmLinear",
                trControl = trctrl)

predtest<-predict(svm_linear,newdata=x_test)

confusionMatrix(predtest,x_test$CLASS,positive = '1')

}



svm_class_grid<-function(x_train,x_test){
  library(caret)
  
  print("svm_linear_custom")
  trctrl<-trainControl(method="repeatedcv",number=10,repeats = 3)
  grid <- expand.grid(C = c(1, 1.25, 1.5, 1.75, 2,5))
  svm_Linear_Grid <- train(CLASS ~., data = x_train, method = "svmLinear",
                             trControl=trctrl,
                             tuneGrid = grid)
  predtest<-predict(svm_Linear_Grid,newdata=x_test)
  
  confusionMatrix(predtest,x_test$CLASS)
}
