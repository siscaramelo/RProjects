# Proyecto Bolsa de Madrid
#-------------------------

# Leemos la página: http://www.bolsamadrid.es/esp/aspx/Indices/Resumen.aspx
file <-url("http://www.bolsamadrid.es/esp/aspx/Indices/Resumen.aspx")

bTitulos <- function(file){
  bolsa <- readLines(file)
  bolsa.filas <-grep("<th scope=\"col\">",bolsa)
  bolsa.columnas <-gregexpr("<th[^>]*>(.*?)</th>",bolsa[bolsa.filas])
  bolsa.titulos <- regmatches(bolsa[bolsa.filas],bolsa.columnas)
  bolsa.titulos <- lapply(bolsa.titulos,function(x,f1="^<th[^>]*>|</th>?",f2="</th>?") sub(f2,"", sub(f1,"", x)))
  # Substituimos los caracteres extraños
  bolsa.titulos <- lapply(bolsa.titulos,function(x,f1="&#218;") sub(f1,"U", x))
  bolsa.titulos <- lapply(bolsa.titulos,function(x,f1="&#225;") sub(f1,"a", x))
  bolsa.titulos <- lapply(bolsa.titulos,function(x,f1="&#237;") sub(f1,"i", x))
  bolsa.titulos <- lapply(bolsa.titulos,function(x,f1="<br/>AÃ±o") sub(f1,"Año", x))
  
  return(bolsa.titulos)
}


bTabla <- function(file){
  bolsa <- readLines(file)
  tabla.filas <-grep("DifFl(Sb|Bj|Ig)",bolsa)
  tabla.columnas <-gregexpr("<td[^>]*>(.*?)</td>",bolsa[tabla.filas])
  tabla.datos <- regmatches(bolsa[tabla.filas],tabla.columnas)
  #tabla.datos <- lapply(tabla.datos,function(x,f1="^<td[^>]*>|</td>?") sub(f1,"", x))
  tabla.datos <- lapply(tabla.datos,function(x,f1="^<td[^>]*>|</td>?",f2="</td>?") sub(f2,"", sub(f1,"", x)))
  return(tabla.datos)
}

bolsaTitulos <- bTitulos(file)
bolsaDatos   <- bTabla(file)
# Generamos la Tabla
df           <- data.frame(matrix(unlist(bolsaDatos), nrow=length(bolsaDatos), byrow=T))
# Formateamos los datos
df[,2]  <- as.double(gsub("[,]", ".", gsub("[.]", "", df[,2])))
df[,3]  <- as.double(gsub("[,]", ".", gsub("[.]", "", df[,3])))
df[,4]  <- as.double(gsub("[,]", ".", gsub("[.]", "", df[,4])))
df[,5]  <- as.double(gsub("[,]", ".", gsub("[.]", "", df[,5])))
df[,6]  <- as.double(gsub("[,]", ".", gsub("[.]", "", df[,6])))
df[,9]  <- as.double(gsub("[,]", ".", gsub("[.]", "", df[,9])))
df[,7]  <- as.Date(df[,7],format="%d/%m/%Y")
colnames(df) <- as.vector(bolsaTitulos[[1]])
