correlationData<-function(x)
{
  library(caret)
  correlationMatrix <- cor(x)
  
  # print(correlationMatrix)
  # find attributes that are highly corrected (ideally >0.75)
  highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.75)
  
  # print(highlyCorrelated)
  v=x[-highlyCorrelated]
}