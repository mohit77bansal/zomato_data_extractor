extract_data <- function(page_no)
{
  data <-data.frame(matrix(rep(NA,10000),nrow=5000,ncol=2))
  colnames(data) <- c("name","url")
  j=1
  for (i in 1:page_no)
  {
    url <- html(paste("https://www.zomato.com/bangalore/restaurants?page=",i,sep=""))
    name <- url %>% html_nodes("a.result-title") %>% html_text();
    n <- length(name); 
    data$name[j:(j+n-1)] <- name[1:n] #stores names of the restaurant
    
    restrodetail <- as.data.frame((as.matrix(url %>% html_nodes("ol a.result-title") %>% html_attrs())))
    restrodetail$V1 <- as.character(restrodetail$V1)
    restrodetail$href1 <- sapply(restrodetail$V1, FUN=function(x) {strsplit(x, split='[,,]')[[1]][2]})
    restrodetail$href2 <- sapply(restrodetail$href1, FUN=function(x) {substr(x, 3, (nchar(x)-1))})
    data$url[j:(j+n-1)] <- restrodetail$href2[1:n] #stores zomato link of restaurant
    j <- j+n   #to increase the count of main table
  }
  na_index <-  which(is.na(data$name))[1]
  data_filter <- data[1:(na_index -1),]
  return(data_filter)
}
