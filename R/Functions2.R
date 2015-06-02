fTension <- function(s,d){
  # Nos indica si la presion sanquinea es correcta o no
  if (s>140 | d>89){
    print("Tension ALTA")
  } else {
    print("Tension NORMAL")
  }
}

for(i in 1:length(Preassure$Fecha)){
  print(Preassure$Sistolica[i])
  print(Preassure$Diastolica[i])
  fTension(Preassure$Sistolica[i],Preassure$Diastolica[i])
}