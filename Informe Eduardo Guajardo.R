library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(ggmap)
library(knitr)

parks <- read_csv("C:/Users/Kraden/OneDrive - Universidad Andres Bello/Academia/Trabajo PUC/Doctorado/Curso de R/Evaluacion 1/parks.csv")
species <- read_csv("C:/Users/Kraden/OneDrive - Universidad Andres Bello/Academia/Trabajo PUC/Doctorado/Curso de R/Evaluacion 1/species.csv")
BD<- full_join(species, parks)  #se unen ambas bases de datos

BD<- BD %>% rename(Spp= `Scientific Name`, Park.name= `Park Name`, Nombre.comun= `Common Names`,Con.status= `Conservation Status`)

Plant <- BD %>% filter(Category == "Vascular Plant") %>% select("Latitude", "Longitude", "Family", "Park.name") %>% 
  group_by(Family) %>% summarize(n= n(), lat= mean(Latitude), lon= mean (Longitude)) %>% filter(n== 1) %>% 
  group_by(lat, lon)
View(Plant)

install_tex
