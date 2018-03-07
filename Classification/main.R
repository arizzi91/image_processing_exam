rm(list=ls())
source("svm_classification.R")
source("statistic.R")
source("svm_radial_classification.R")
source("test_svm_models.R")
# #adolescent
print("adolescent classification")
x_train_adolescent<-read.csv("../FinalTestTrainData/adolescentTrain.csv",header = TRUE, sep=" ")
x_test_adolescent<-read.csv("../FinalTestTrainData/adolescentTest.csv",header = TRUE, sep = " ")

table(x_train_adolescent$CLASS)
table(x_test_adolescent$CLASS)

x_train_adolescent$CLASS<-as.character(x_train_adolescent$CLASS)
x_train_adolescent$CLASS<-as.factor(x_train_adolescent$CLASS)
x_test_adolescent$CLASS<-as.character(x_test_adolescent$CLASS)
x_test_adolescent$CLASS<-as.factor(x_test_adolescent$CLASS)

svm_class_linear(x_train_adolescent,x_test_adolescent)

# #child
print("child classification")
x_train_child<-read.csv("../FinalTestTrainData/childTrain.csv",header = TRUE, sep=" ")
x_test_child<-read.csv("../FinalTestTrainData/childTest.csv",header = TRUE, sep = " ")

x_train_child$CLASS<-as.character(x_train_child$CLASS)
x_train_child$CLASS<-as.factor(x_train_child$CLASS)
x_test_child$CLASS<-as.character(x_test_child$CLASS)
x_test_child$CLASS<-as.factor(x_test_child$CLASS)

table(x_train_child$CLASS)
table(x_test_child$CLASS)

svm_class_linear(x_train_child,x_test_child)

# #adult
# print("adult classification")
# x_train_adult<-read.csv("../FinalTestTrainData/adultTrain.csv",header = TRUE, sep=" ")
# x_test_adult<-read.csv("../FinalTestTrainData/adultTest.csv",header = TRUE, sep = " ")
# table(x_train_adult$CLASS)
# table(x_test_adult$CLASS)
# 
# x_train_adult$CLASS<-as.character(x_train_adult$CLASS)
# x_train_adult$CLASS<-as.factor(x_train_adult$CLASS)
# x_test_adult$CLASS<-as.character(x_test_adult$CLASS)
# x_test_adult$CLASS<-as.factor(x_test_adult$CLASS)
# svm_class_linear(x_train_adult,x_test_adult)



#adult core feature
print("adult classification core feature")
x_train_adult<-read.csv("../FinalTestTrainData/AdultCicled/adultTrain.csv",header = TRUE, sep=" ")
x_test_adult<-read.csv("../FinalTestTrainData/AdultCicled/adultTest.csv",header = TRUE, sep = " ")
table(x_train_adult$CLASS)
table(x_test_adult$CLASS)

x_train_adult$CLASS<-as.character(x_train_adult$CLASS)
x_train_adult$CLASS<-as.factor(x_train_adult$CLASS)
x_test_adult$CLASS<-as.character(x_test_adult$CLASS)
x_test_adult$CLASS<-as.factor(x_test_adult$CLASS)
svm_class_linear(x_train_adult,x_test_adult)


#child core feature

print("child classification core feature")
x_train_child<-read.csv("../FinalTestTrainData/ChildCicled/childTrain.csv",header = TRUE, sep=" ")
x_test_child<-read.csv("../FinalTestTrainData/ChildCicled/childTest.csv",header = TRUE, sep = " ")
table(x_train_child$CLASS)
table(x_test_child$CLASS)

x_train_child$CLASS<-as.character(x_train_child$CLASS)
x_train_child$CLASS<-as.factor(x_train_child$CLASS)
x_test_child$CLASS<-as.character(x_test_child$CLASS)
x_test_child$CLASS<-as.factor(x_test_child$CLASS)
svm_class_linear(x_train_child,x_test_child)


#adolescent core feature

print("adolescent classification core feature")
x_train_adolescent<-read.csv("../FinalTestTrainData/AdolescentCicled/adolescentTrain.csv",header = TRUE, sep=" ")
x_test_adolescent<-read.csv("../FinalTestTrainData/AdolescentCicled/adolescentTest.csv",header = TRUE, sep = " ")
table(x_train_adolescent$CLASS)
table(x_test_adolescent$CLASS)

x_train_adolescent$CLASS<-as.character(x_train_adolescent$CLASS)
x_train_adolescent$CLASS<-as.factor(x_train_adolescent$CLASS)
x_test_adolescent$CLASS<-as.character(x_test_adolescent$CLASS)
x_test_adolescent$CLASS<-as.factor(x_test_adolescent$CLASS)
svm_class_linear(x_train_adolescent,x_test_adolescent)

