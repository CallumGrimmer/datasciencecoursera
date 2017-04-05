complete <- function(directory, id = 1:332){
  
  numComplete <- data.frame(id=id, nobs=numeric(length(id)))
  j <- 1 
  
  for(i in id){
    tempid <- i
    if(tempid < 10){
      tempid <- paste("00",tempid,sep="")
    } else if(tempid < 100){
      tempid <- paste("0",tempid,sep="")
    }
    x <- read.csv(paste(directory,"/",tempid,".csv",sep=""))
    numComplete[j,2] <- sum(complete.cases(x))
    j <- j + 1
  }
  numComplete
}