#-----------------------------------------------------------------
# En este script vamos a leer y a revisar la información de cada
# elemento cartografico y adicionalmente realizar operaciones para
# encontrar información complementaria con la relacion de varios
# elementos cartograficos
# Autor: Daniel Orlando Martínez Quezada
#-----------------------------------------------------------------
#limpiar espacio de trabajo de variables anteriores
rm(list = ls())
#importar librerias necesarias para el desarrollo del script
library(rgdal)
library(sp)
library(rgeos)
#fin importar librerias
#-----------------------------------------------------------------
#leer los elementos cartograficos
#los elementos a revisar consisten en dos el primero consiste en
# ubicaciones dentro de la ciudad de Bucaramanga al cual llamaremos
# "ubicaciones", el segundo elemento corresponde a dos zonas las cuales
#llamaremos "zonas"
ubicaciones <-
  rgdal::readOGR(dsn = "D:/Codirección Proyectos Pregrado/capacitacion Rgdal/PruebaGdal.kml", layer = "Ubicaciones")
zonas <-
  rgdal::readOGR(dsn = "D:/Codirección Proyectos Pregrado/capacitacion Rgdal/PruebaGdal.kml", layer = "Zonas")
#Nota: las rutas de los archivos deben ser modificadas de acuerdo a lo requerido.
#-------------------------------------------------------------------
#para ver los datos asociados a estos elementos solo basta con utilizar
#el atributo data utilizando el operados @
View(ubicaciones@data)
View(zonas@data)
#------------------------------------------------------------------
#con el fin de explorar algunas operaciones se evaluará cada ubicación
#para determinar a que zona pertenece utilizando la función gContains
#se recomienda verificar que parametros de entrada tiene esta función
#en la documentación de rgeos utilizando la linea
#?gContains

contenido <- gContains(zonas, ubicaciones, byid = TRUE)
rownames(contenido) <- ubicaciones@data$Name
colnames(contenido) <- zonas@data$Name
View(contenido)
#---------------------------------------------------------------------
