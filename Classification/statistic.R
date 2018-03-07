print_statistic<-function(x){
  
  for(i in 1:(ncol(x)-1)){
    print(colnames(x)[i])
    print("Variance")
    print(var(x[[i]]))
    print("Median")
    print(median(x[[i]]))
    print("Mean")
    print(mean(x[[i]]))
    print("Standard Deviation")
    print(sd(x[[i]]))
  }
 
}