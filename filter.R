
filter <- function(datawithrating)
{
  datawithrating$phone <- as.character(datawithrating$phone)
  datawithrating$phone <- substring(datawithrating$phone,36,(nchar(datawithrating$phone)-1))
  
  datawithrating$address <- substring(datawithrating$address,10,(nchar(datawithrating$address)))
  datawithrating$coordi <- as.character(datawithrating$coordi)
  blank <- which(datawithrating$coordi == "character(0)")
  datawithrating$coordi[blank] <- "BLANK,BLANK"
  datawithrating$coordinate <- sapply(datawithrating$coordi,FUN=function(x)
    {
    split <- strsplit(x,split=",")
    split1 <- split[[1]][1]
    split2 <- split[[1]][2]
    coordi1 <-substr(split1,nchar(split1)-12,nchar(split1))
    coordi2 <- substr(split2,1,13)
    coordif <- paste(coordi1,coordi2,sep=",")
    #return(tryCatch(as.Date(date_in), error=function(e) NULL))
    return(coordif)
  })
  
  datawithrating$coordi <- NULL
  
  datawithrating$collection <- as.character(datawithrating$collection)
  datawithrating$collection <- substring(datawithrating$collection,30,(nchar(datawithrating$collection)-11))
  
  datawithrating$cuisinetype <- as.character(datawithrating$cuisinetype)
  
  datawithrating$knownfor <- as.character(datawithrating$knownfor)
  datawithrating$knownfor <- substring(datawithrating$knownfor,18,(nchar(datawithrating$knownfor)))
  
  datawithrating$orderwhat <- as.character(datawithrating$orderwhat)
  datawithrating$orderwhat <- substring(datawithrating$orderwhat,18,(nchar(datawithrating$orderwhat)))
  
  datawithrating$cost <- as.character(datawithrating$cost)
  datawithrating$cost <- sapply(datawithrating$cost, FUN=function(x)(as.numeric(unlist((strsplit(x, "[^0-9]+"))))))
  datawithrating$cost <- sapply(datawithrating$cost,FUN=function(x)(x[which.max(x)]))
  
  datawithrating$area <- sapply(datawithrating$address,FUN=function(x)
  {
    a <- strsplit(x,",")
    b <- length(a[[1]])
    c <- a[[1]][b-1]
    return(c)
  })
  
  datawithrating$highlight <- as.character(datawithrating$highlight)
  datawithrating$highlight <- substring(datawithrating$highlight,1,(nchar(datawithrating$highlight)-1))
#   datawithrating$highlight1 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][1]})
#   datawithrating$highlight2 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][2]})
#   datawithrating$highlight3 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][3]})
#   datawithrating$highlight4 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][4]})
#   datawithrating$highlight5 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][5]})
#   datawithrating$highlight6 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][6]})
#   datawithrating$highlight7 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][7]})
#   datawithrating$highlight8 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][8]})
#   datawithrating$highlight9 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][9]})
#   datawithrating$highlight10 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][10]})
#   datawithrating$highlight11 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][11]})
#   datawithrating$highlight12 <- sapply(datawithrating$highlight, FUN=function(x) {strsplit(x, split='[,,,,,,,,,,,,,]')[[1]][12]})

#datawithrating$image <- as.character(datawithrating$image)


  
  
  return(datawithrating)
}
