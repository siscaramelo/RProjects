library(ggplot2)
qplot(Temporada_Vta, Venta_Bruta,data=Ventas2013, geom=c("point","smooth"))

g <-ggplot(Ventas2013,aes(Temporada_Vta,Venta_Bruta))
g+geom_line()+facet_grid(. ~Periodo_Vta)+labs(x="Temporada de Venta",y="Bruto")+labs(title="Venta por Temporada")

g <-ggplot(Preassure,aes(Sistolica,Diastolica))
g+geom_point()+geom_smooth()