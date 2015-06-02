count <- function(cause=""){
  # Read the file of Baltimor homicides: homicides.txt
  homicides <- readLines("homicides.txt")
  
  # Check the cause validity
  if (cause==""){
    stop("Cause NULL")
  } else if (cause=="asphyxiation"){
    length(grep("[Cc]ause: [Aa]sphyxiation",homicides))
    
  } else if (cause=="blunt force"){
    length(grep("[Cc]ause: [Bb]lunt [Ff]orce",homicides))    
    
  } else if (cause=="shooting"){
    length(grep("[Cc]ause: [Ss]hooting",homicides))        
    
  } else if (cause=="stabbing"){
    length(grep("[Cc]ause: [Ss]tabbing",homicides))    
    
  } else if (cause=="other"){
    length(grep("[Cc]ause: [Oo]ther",homicides))    
    
  } else if (cause=="unknown"){
    length(grep("[Cc]ause: [Uu]nknown",homicides))    
    
  } else{
    stop("Cause Not Valid")
  }
}