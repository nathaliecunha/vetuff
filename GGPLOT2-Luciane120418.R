require(ggplot2)
require(magrittr)
dados <- read.csv2("https://docs.google.com/spreadsheets/d/e/2PACX-1vRLFwPgKMph2zEjntMRgJDvbco9PTEgvLpbA5NL7XKiVLlG85rD8IDCAbMnOkL09Hbw6fzaNfoI46fc/pub?gid=1315387217&single=true&output=csv", encoding = "UTF-8")
summary(dados)

g1=dados %>% 
  ggplot(aes( x=Área,
              y=Frequência, 
              fill=Instituição))+# Informação Básica
  geom_bar(stat="identity", width=0.5, position = "dodge")+
  labs(x='Área',
       y='Frequência',
       title="Distribuição de Bolsas por Área do Conhecimento")+scale_fill_grey()
  theme_bw()

#Variante - barras empilhadas
#Mudar somente position = "fill"
dados %>% 
  ggplot(aes( x=Área,
              y=Frequência, 
              fill=Instituição))+# Informação Básica
  geom_bar(stat="identity", width=0.5, position = "fill")+
  labs(x='Área',
       y='Frequência',
       title="Distribuição de Bolsas por Área do Conhecimento")+
  theme_bw()
ggsave(g1,file="copiadografico.pdf",width=10,height=6)

#Invertendo as variáveis
dados %>% 
  ggplot(aes( x=Instituição,
              y=Frequência, 
              fill=Área))+# Informação Básica
  geom_bar(stat="identity", width=0.5, position = "fill")+
  labs(x='Instituição',
       y='Frequência',
       title="Distribuição de Bolsas por Instituição")+
  theme_bw()

#Barras horizontais
#acrescentar coord_flip()

dados %>% 
  ggplot(aes( x=Área,
              y=Frequência, 
              fill=Instituição))+# Informação Básica
  geom_bar(stat="identity", width=0.5, position = "dodge")+
  labs(x='Área',
       y='Frequência',
       title="Distribuição de Bolsas por Área do Conhecimento")+
  theme_bw()+
  coord_flip()

##Modifique os temas
#Possibilidades
#theme_bw()
#theme_gray()
#theme_classic()
#theme_minimal()...e outros

#Cores

dados %>% 
  ggplot(aes( x=Área,
              y=Frequência, 
              fill=Instituição))+
  geom_bar(stat="identity",
           width=0.5,
           position = "dodge",
           colour="red")+
  scale_fill_manual("Instituição", 
                    values = c("A" = "blue", "B" = "orange"))+
    labs(x='Área',
       y='Frequência',
       title="Bolsas por Área do Conhecimento")+
  theme_bw()+
  coord_flip()

dados %>% 
  ggplot(aes( x=Área,
              y=Frequência, 
              fill=Instituição))+
  geom_bar(stat="identity",
           width=0.5,
           position = "dodge",
           colour="red")+
  scale_fill_manual("Instituição", 
                    values = c("A" = "snow2", "B" = "yellow4"))+
  labs(x='Área',
       y='Frequência',
       title="Bolsas por Área do Conhecimento")+
  theme_bw()+
  coord_flip()

#Paletas brewer

dados %>% 
  ggplot(aes( x=Área,
              y=Frequência, 
              fill=Instituição))+
  geom_bar(stat="identity",
           width=0.5,
           position = "dodge",
           colour="red")+
  scale_fill_brewer(palette="Spectral")+
    labs(x='Área',
       y='Frequência',
       title="Bolsas por Área do Conhecimento")+
  theme_bw()+
  coord_flip()

#outras opcoes consulte http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/

#E se eu quiser fazer só da instituição A?
#Vai usar o dplyr para filtrar os dados
require(dplyr)
#require(tidyverse) 
require(stringr)
#caso contrário teremos problemas com strings

dados %>% 
  filter(Instituição=="A") %>% 
  ggplot(aes(x=Área,
             y=Frequência))+ 
  geom_bar(stat="identity",
           width=0.5,
           position = "dodge")+
  labs(x='Área',
       y='Frequência',
       title="Distribuição de Bolsas por Área do Conhecimento")+
  theme_bw()  

# Para visualizar as opcoes de cores
colors()

#Para reordenar

dados %>% 
  ggplot(aes(reorder( x=Área,Frequência),
              y=Frequência, 
              fill=Instituição))+# Informação Básica
  geom_bar(stat="identity", width=0.5, position = "fill")+
  labs(x='Área',
       y='Frequência',
       title="Distribuição de Bolsas por Área do Conhecimento")+
  theme_bw()

dados %>% 
  filter(Instituição=="A") %>% 
  ggplot(aes(x=Área,
             y=Frequência))+ 
  geom_bar(stat="identity",
           width=0.5,
           position = "dodge")+
  labs(x='Área',
       y='Frequência',
       title="Distribuição de Bolsas por Área do Conhecimento")+
  theme_bw()  

