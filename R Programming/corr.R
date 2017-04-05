##finds correlation in sets that have above a threshold number of
##complete cases

corr <- function(directory, threshold = 0){
  
  correlations <- numeric()
  numAboveThresh <- 0
  numFiles <- length(list.files(pattern = "*.csv"))
  for(i in 1:numFiles){
    if(complete(directory,i)[1,2] > threshold){
      numAboveThresh <- numAboveThresh + 1
      tempid <- i
      if(tempid < 10){
        tempid <- paste("00",tempid,sep="")
      } else if(tempid < 100){
         tempid <- paste("0",tempid,sep="")
      }
      x <- read.csv(paste(directory,"/",tempid,".csv",sep=""))
      correlations[numAboveThresh] <- cor(x$nitrate, x$sulfate, use = "complete.obs")
      print(correlations)
    }
  }
}