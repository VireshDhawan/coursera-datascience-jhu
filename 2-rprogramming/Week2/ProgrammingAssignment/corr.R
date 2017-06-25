corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  dat <- vector(mode = "numeric", length = 0)
  
  for (i in 1:length(files)) {
    monitor <- read.csv(files[i])
    csum <- sum((!is.na(monitor$sulfate)) & (!is.na(monitor$nitrate)))
    if (csum > threshold) {
      tmp <- monitor[which(!is.na(monitor$sulfate)), ]
      submonitor <- tmp[which(!is.na(tmp$nitrate)), ]
      dat <- c(dat, cor(submonitor$sulfate, submonitor$nitrate))
    }
  }
  
  dat
}