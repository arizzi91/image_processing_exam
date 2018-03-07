featureSelection<-function(x,y,times=10)
  {
  library(randomForest)
  library(caret)
   # data1=adolescent
 # class<-generateString(data1[-1])
 # class_adolescent<-unlist(class[2])
# Labels<-unlist(class[1])
# String=Labels
  
  # rendo la futura y Un factor per poter effettuare il random forest
  
 
# e la inserisco in first label
  # data1$CLASS<-as.character(data1$CLASS)
  # data1$CLASS<-as.factor(data1$CLASS)
  # firstlabel=data1[1];
  # # rimuovo la classe all'interno di data1 e il primo label che è identificativo dei soggetti
  # 
  # x=data1[,2:( length(data1[1,])-1)]
  # # e la inserisco nelle y
  # y=data1[,length(data1[1,])]

  # utilizzo random forest con crossvalidation con k=4
  control <- rfeControl(functions=rfFuncs, method="cv", number=times)
  results <- rfe(x,y, rfeControl=control,ntree=300)
  
  # list the chosen features
  # predictors(results)
  # plot the results
  
  # final_imp <- varImp(results)
  # final_imp$rank <- rank(final_imp$Overall)
  # final_imp <- final_imp[order(-final_imp$rank),]
  # final_imp$var=rownames(final_imp)
  # print(final_imp)
  # l<-sort(final_imp$var[final_imp$rank <= 5])
  # all_imps <- results$variables
  # all_imps <- all_imps[order(-all_imps$Variables, all_imps$Resample, all_imps$var),]
  # 8 variabili
# var=results$results$Variables
# c=dimnames(x[,var])[2]
# c(results,c)
  results
 # v=x[,var]
 # v=cbind(v,y)
}
            # output.forest<-randomForest(CLASS~.,data=data1)
   # output.forest <- randomForest(as.formula(String),  data = data1,ntree=200,mtry=4)
   # confusionMatrix(a,test$class) 
  
   

     
     
     
     
     
     
     
     
     
     
     
   

   

  