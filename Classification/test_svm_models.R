#Use a support vector machine to predict iris species
svm_test<-function(x_train,x_test){
  library(caret)
  library(caTools)
  y<-as.factor(x_train$CLASS)
  y<-x_train$CLASS
  #Pre-Compute CV folds so we can use the same ones for all models
  CV_Folds <- createMultiFolds(y, k = 10, times = 5)
  
  #Fit a Linear SVM
  L_model <- train(CLASS ~ .,data=x_train,method="svmLinear",
                   trControl=trainControl(method='repeatedcv',index=CV_Folds))
  
  #Fit a Poly SVM
  P_model <- train(CLASS ~ .,data=x_train,method="svmPoly",
                   trControl=trainControl(method='repeatedCV',index=CV_Folds))
  
  #Fit a Radial SVM
  R_model <- train(CLASS ~ .,data=x_train,method="svmRadial",
                   trControl=trainControl(method='repeatedCV',index=CV_Folds))
  
  #Compare 3 models:
  resamps <- resamples(list(Linear = L_model, Poly = P_model, Radial = R_model))
  summary(resamps)
  bwplot(resamps, metric = "Accuracy")
  densityplot(resamps, metric = "Accuracy")
  
  #Test a model's predictive accuracy Using Area under the ROC curve
  #Ideally, this should be done with a SEPERATE test set
  #pSpecies <- predict(L_model,x_test,type='prob')
  #colAUC(pSpecies,y,plot=TRUE)
}

