complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  flist <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  files <- vector()
  obs <- vector()
  
  for (i in id) {
    dat <- read.csv(flist[i])
    files <- c(files, i)
    good <- complete.cases(dat)
    obs <- c(obs, nrow(dat[good, ]))
    
  }
  
  nobs = data.frame(id = files, nobs = obs)  
  nobs
  
}