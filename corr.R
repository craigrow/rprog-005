corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  flist <- list.files(directory, full.names=TRUE)
  num_files <- length(list.files("specdata"))
  dat <- data.frame()
  corrs <- vector()
  
  for (i in 1:num_files) {
    dat <- read.csv(flist[i])
    good <- complete.cases(dat)
    
      if (nrow(dat[good,]) > threshold) { 
        g <- dat[good,]
        corr <- cor(g$nitrate, g$sulfate)
        corrs <- c(corrs, corr)
      }
  }
  corrs
}