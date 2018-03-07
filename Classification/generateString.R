generateString<-function (data)
{
  String=(unlist(dimnames(data)[2]))
  #immagino che la classe sia l'ultimo elemento della feature
  String1=paste(String[length(String)],"~",sep="")
  String2=String1;
  for (i in 1:(length(String)-1))
  {
    if(i<(length(String)-1))
      String1<-paste(String1,String[i],"+")
    else
      String1<-paste(String1,String[i],"")
  }
  
  list(String1,String2)
}
