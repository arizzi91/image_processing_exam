new_file_id <- function(oldString)
{
  #assets
  pitt_string<-"PITT"
  olin_string<-"OLIN"
  trinity_string<-"TRINITY"
  usm_string<-"USM"
  yale_string<-"YALE"
  leuven1_string<-"LEUVEN_1"
  leuven2_string="LEUVEN_2"
  stanford_string<-"STANFORD"
  maxmun_string<-"MAX_MUN"
  caltech_string<-"CALTECH"
  a_string<-"_a"
  
  newString<-""
  if(identical(oldString,pitt_string) || identical(oldString,olin_string) || identical(oldString,trinity_string) ||
     identical(oldString,yale_string) || identical(oldString,leuven1_string) || identical(oldString,leuven2_string) ||
     identical(oldString,stanford_string)|| identical(oldString,caltech_string)){
      #upper only first character
      newString<-paste(substr(oldString, 1, 1), tolower(substr(oldString, 2, nchar(oldString))), sep="")
  }else if(identical(oldString,maxmun_string)){
      #newString<-MaxMun_a
      newString<-gsub('_','',oldString)
      newString<-paste(substr(newString, 1, 1), tolower(substr(newString, 2, 3)),toupper(substr(newString, 4, 4)),tolower(substr(newString,5,nchar(newString))), sep="")
      newString<-paste(newString,a_string,sep="")
  }else{
      newString<-oldString
  }
  return(newString)
}


