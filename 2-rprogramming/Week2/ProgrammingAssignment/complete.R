complete <- function(directory, id=1:332){
  files = list.files(path=directory, full.names = TRUE, recursive = TRUE)
  data <- data.frame()
  for(i in id){
    monitor = read.csv(files[i])
    nobs = sum(complete.cases(monitor))
    tmp <- data.frame(i,nobs)
    data <- rbind(data,tmp)
  }
  colnames(data) <- c("id","nobs")
  data
}