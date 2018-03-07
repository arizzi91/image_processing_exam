svm_class_radial<-function(x_train,x_test){
  library(caret)
  print("svm_radial")
  trctrl<-trainControl(method="cv",number=10,repeats = 3)
  svm_Radial<-train(CLASS ~., data = x_train, method = "svmRadial",
                    trControl=trctrl)
  test_pred_radial<-predict(svm_Radial,newdata=x_test)
  confusionMatrix(test_pred_radial,x_test$CLASS)
  
}
svm_poly<-function(x_train,x_test){
  library(caret)
  print("svm_poly")
  trctrl<-trainControl(method="repeatedcv",number=10,repeats = 3)
  svm_poly<-train(CLASS ~ .,data=x_train,method = "svmPoly",
                  trControl = trctrl)
  
  predtest<-predict(svm_poly,newdata=x_test)
  
  confusionMatrix(predtest,x_test$CLASS)
}

svm_class_radial_grid<-function(x_train,x_test){
  library(caret)
  print("svm_radial_custom")
  trctrl<-trainControl(method="cv",number=10,repeats = 3)
  grid_radial <- expand.grid(sigma = c(0,0.01, 0.02, 0.025, 0.03, 0.04,
                                       0.05, 0.06, 0.07,0.08, 0.09, 0.1, 0.25, 0.5, 0.75,0.9),
                             C = c(1, 1.5, 2,5))
  svm_Radial_Grid <- train(CLASS~., data = x_train, method = "svmRadial",
                             trControl=trctrl,
                             tuneGrid = grid_radial)
  test_pred_radial<-predict(svm_Radial_Grid,newdata=x_test)
  confusionMatrix(test_pred_radial,x_test$CLASS)
}