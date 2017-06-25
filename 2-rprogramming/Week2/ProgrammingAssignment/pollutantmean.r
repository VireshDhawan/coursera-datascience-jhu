pollutantmean <- function(directory,pollutant, id=1:332){
  files = list.files(path=directory, full.names = TRUE, recursive = TRUE)
  data <- data.frame()
  for(i in id){
    data <- rbind(data, read.csv(files[i]))
  }
  mean(data[,pollutant], na.rm=TRUE)
}