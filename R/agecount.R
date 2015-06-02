agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  if(is.null(age)){
    stop("age is null!!")
  }
  
  ## Read "homicides.txt" data file
  homicides <- readLines("homicides.txt")

  ## Extract ages of victims; ignore records where no age is
  ## given
  count <- 0
  agesVector <- as.numeric(sub(" years old","",regmatches(homicides,regexpr("[0-9]+ years old",homicides,))))
  for(i in seq_along(agesVector)){
    if (age==agesVector[i]){
      count <- count+1    
    }
  }
  
  ## Return integer containing count of homicides for that age
  return(count)
}