number <- 0
details <- function(data)
{
  number <- number+1
  cat(number,data[number,2])
  
  data$rating <- sapply(data$url, FUN=function(x)
  {
    
    url1 <- html(x)
    ratingdetail <- url1 %>% html_nodes("div.res-rating.pos-relative.clearfix") %>% html_text()
    rating_vote <- as.numeric(gsub("\\D", "", ratingdetail))
    rating_vote <- as.character(rating_vote)
    rating <- (as.numeric(substr(rating_vote,1,2)))/10
    return(rating)
  })
  
  data$vote <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    ratingdetail <- url1 %>% html_nodes("div.res-rating.pos-relative.clearfix") %>% html_text()
    rating_vote <- as.numeric(gsub("\\D", "", ratingdetail))
    rating_vote <- as.character(rating_vote)
    votes <- as.numeric(substr(rating_vote,3,nchar(rating_vote)))
    return(votes)
  })
  
  data$phone <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    phone <- url1 %>% html_nodes("span.tel") %>% html_text()
    return(phone)
  })
  
  data$address <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    address <- url1 %>% html_nodes("div.res-main-address-text") %>% html_text()
    return(address)
  })
  
  data$coordi <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    coordi <- url1 %>% html_nodes("div.resmap-img") %>% html_attrs()
    coordi1 <- as.character(coordi)
    return(coordi1)
  })
  
  data$collection <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    collection <- url1 %>% html_nodes("span.res-page-collection-text") %>% html_text()
    return(collection)
  })
  
  data$cuisinetype <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    cuisinetype <- url1 %>% html_nodes("div.res-info-cuisines.clearfix") %>% html_text()
    return(cuisinetype)
  })
  
  data$knownfor <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    knownfor <- url1 %>% html_nodes("div.res-info-known-for-text.mr5") %>% html_text()
    return(knownfor)
  })
  
  data$orderwhat <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    orderwhat <- url1 %>% html_nodes("div.res-info-dishes-text.order-dishes") %>% html_text()
    return(orderwhat)
  })
  
  data$cost <- sapply(data$url, FUN=function(x)
  {
    url1 <- html(x)
    cost <- cost <- url1 %>% html_nodes("div.res-info-detail span") %>% html_text()
    return(cost)
  })
  
    data$highlight <- sapply(data$url, FUN=function(x)
    {
      url1 <- html(x)
      highlight <- url1 %>% html_nodes("div.res-info-feature-text") %>% html_text()
      highlight1 <- paste(highlight,collapse=",")
      return(highlight1)
    })
  
#   data$image <- sapply(data$url, FUN=function(x)
#   {
#     url1 <- html(paste(x,"/photos#tabtop",sep=""))
#     image <- url1 %>% html_nodes("div.photos_container_load_more a.photo-inner.js-heart-container img.res-photo-thumbnail.thumb-load") %>% html_attrs()
#     image1 <- sapply(image,FUN=function(x)
#     {
#       k <- x[5]
#       return(k)
#       
#     })
#     image2 <- list(image1)
#     return(image2)
#   })
#   
  return(data)
  
}
