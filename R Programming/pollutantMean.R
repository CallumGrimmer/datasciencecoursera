## Coursera - Data Science
## R Programming Week 2
## Assignment 1
## Callum Grimmer 2017

pollutantmean <- function(directory, pollutant, id = 1:332){
    
    sum <- 0
    numValues <- 0
    for(i in id){
        tempid <- i
        if(tempid < 10){
            tempid <- paste("00",tempid,sep="")
        } else if(tempid < 100){
            tempid <- paste("0",tempid,sep="")
        }
        x <- read.csv(paste(directory,"/",tempid,".csv",sep=""))
        x <- x[pollutant]
        if(sum(x[!is.na(x)]) > 0){
            sum <- sum + sum(x,na.rm=TRUE)
            numValues <- numValues + length(x[!is.na(x)])
        }
    }
    finalMean <- sum/numValues
    
}