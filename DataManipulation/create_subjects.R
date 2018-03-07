createSubjects<-function()
{
  currentpwd=getwd()
  rootpwd<-dirname(currentpwd)
  
  file_subjects_adolescent<-paste(currentpwd,"/file_subjects_adolescent.txt",sep="")
  file_subjects_adult<-paste(currentpwd,"/file_subjects_adult.txt",sep="")
  file_subjects_child<-paste(currentpwd,"/file_subjects_child.txt",sep="")
  
  data_adolescent<-read.csv((paste(rootpwd,"campioni_adolescent.csv",sep="/")),sep=",",header = TRUE,stringsAsFactors = FALSE)
  data_adult<-read.csv((paste(rootpwd,"campioni_adult.csv",sep="/")),sep=",",header = TRUE,stringsAsFactors = FALSE)
  data_child<-read.csv((paste(rootpwd,"campioni_child.csv",sep="/")),sep=",",header = TRUE,stringsAsFactors = FALSE)
  
  if (file.exists(file_subjects_adolescent)){
    file.remove(file_subjects_adolescent)
  }
  for (i in 1:nrow(data_adolescent)) {
    write(data_adolescent[i,"FILE_ID"],file=file_subjects_adolescent,append=TRUE)
  }
  
  if (file.exists(file_subjects_adult)){
    file.remove(file_subjects_adult)
  }
  for (i in 1:nrow(data_adult)) {
    write(data_adult[i,"FILE_ID"],file=file_subjects_adult,append=TRUE)
  }
  
  if (file.exists(file_subjects_child)){
    file.remove(file_subjects_child)
  }
  for (i in 1:nrow(data_child)) {
    write(data_child[i,"FILE_ID"],file=file_subjects_child,append=TRUE)
  }
  
}