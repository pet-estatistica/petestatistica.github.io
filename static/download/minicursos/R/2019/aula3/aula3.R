#########################################################################
######################## MINICURSO R 2019  ##############################
########################  PET-Estatística  ##############################
############################## UFPR #####################################
################### João Matheus S. K. T. Hneda #########################
################ Lineu Alberto Cavazani de Freitas ######################
#########################################################################

##########################################################################
# AULA 3
##########################################################################

# tidyr

# Dispõe de funções para formatação adequada dos dados para análise.

# gather - empilha
# spread - desempilha
# separate - separar caracteres
# unite - unir caracteres
# drop_na - retirar dados ausentes
# replace_na - substituir dados ausentes

# ------------------------------------------------------------------------

# gather e spread

library(tidyverse)

td <- tibble(
  id = rep(1:50),
  jan = rnorm(50, rpois(1,(runif(1)*10))),
  fev = rnorm(50, rpois(1,(runif(1)*10))),
  mar = rnorm(50, rpois(1,(runif(1)*10))),
  abr = rnorm(50, rpois(1,(runif(1)*10))),
  mai = rnorm(50, rpois(1,(runif(1)*10))),
  jun = rnorm(50, rpois(1,(runif(1)*10))),
  jul = rnorm(50, rpois(1,(runif(1)*10))),
  ago = rnorm(50, rpois(1,(runif(1)*10))),
  set = rnorm(50, rpois(1,(runif(1)*10))),
  out = rnorm(50, rpois(1,(runif(1)*10))),
  nov = rnorm(50, rpois(1,(runif(1)*10))),
  dez = rnorm(50, rpois(1,(runif(1)*10))))

td

td_gat <- td %>% gather(key = 'mes', value = 'valor', jan:dez)
td_gat

td_gat %>% spread(key=mes, value = valor)

# ------------------------------------------------------------------------

# separate e unite

td2 <- tibble(nome = c("Lineu Alberto", "João Matheus", "PET Estatística"))
td2

td3 <- td2 %>% separate(col = 'nome',
                        into = c('primeiro_nome', 'segundo_nome'),
                        sep = ' ')

td3 %>% unite(col = 'nome',
              sep = ' ')

# ------------------------------------------------------------------------

# NA's

td4 <- tibble(col1 = 1:10,
              col2 = c(1,2,NA,4,NA,6,7,NA,9,10))

td4

td4 %>% drop_na()

td4 %>% replace_na(list(col2 = 0))

td4 %>% replace_na(list(col2 = 100000))

# ------------------------------------------------------------------------
# dplyr

# Funcionamento:
# O input e o output são sempre tibbles
# A base é sempre o primeiro argumento das funções.
# A manipulação se torna uma tarefa menos custosa devido
#  à sintaxe centralizada das funções
# Bem como a escrita do código.

# Principais funções:
# filter() - filtra linhas
# select() - seleciona colunas
# arrange() - ordena a base
# mutate() - cria/modifica colunas
# group_by() - agrupa a base
# summarise() - sumariza a base

# ------------------------------------------------------------------------

#help(swiss)
swiss$names <- rownames(swiss)
dados <- swiss %>% as_tibble()
summary(dados)

# ------------------------------------------------------------------------

# Filter

# Filtro comum
filtro1 <- dados %>% filter(Fertility > 70)
nrow(dados)
nrow(filtro1)

# Filtro com condição & |
filtro2 <- dados %>% filter(Examination > 12 & Agriculture > 30)
nrow(dados)
nrow(filtro2)

filtro3 <- dados %>% filter(Examination > 12 | Agriculture < 30)
nrow(dados)
nrow(filtro3)

# Filtro com condição %in%

filtro4 <- dados %>% filter(names %in% c("Courtelary", "Delemont", "Franches-Mnt"))
nrow(dados)
nrow(filtro4)

# ------------------------------------------------------------------------

# Select

# Seleciona colunas (variáveis).
# starts_with(x), contains(x), matches(x), one_of(x)

select1 <- dados %>% select(names, Education)
ncol(dados)
ncol(select1)
names(dados)
names(select1)

select2 <- dados %>% select(starts_with("e"))
ncol(dados)
ncol(select2)
names(dados)
names(select2)

select3 <- dados %>% select(Fertility, Agriculture:Education)
ncol(dados)
ncol(select3)
names(dados)
names(select3)

select4 <- dados %>% select(-Fertility, -names)
ncol(dados)
ncol(select4)
names(dados)
names(select4)

# ------------------------------------------------------------------------

# Arrange

df <- letters %>% as_tibble()
df

df %>%  arrange(desc(value))

df %>% arrange()

# ------------------------------------------------------------------------

# mutate

df2 <- tibble(col1 = rnorm(50), col2 = rpois(50, 1))
df2

# Sobrescreve uma coluna
mutate1 <- df2 %>% mutate(col2 = letters[1:10] %>% rep(5))
df2[,2]
mutate1[,2]

# Cria nova coluna
mutate2 <- df2 %>% mutate(col3 = 1:nrow(df2))
df2
mutate2

# Diversas colunas no mesmo mutate
mutate3 <- df2 %>%  mutate( col3 = col1 + col2,
                            col4 = 1:nrow(df2),
                            col5 = col1 * 10)

df2
mutate3

# ------------------------------------------------------------------------

# summarise e group_by

dados

dados %>%
    summarise(mean_fert = mean(Fertility))

dados %>%
  summarise(
    media_fert = mean(Fertility),
    mediana_fert = median(Fertility))

dados %>%
    summarise(
    media_fert = mean(Fertility),
    mediana_fert = median(Fertility),
    sd_fert = sd(Fertility))

dados %>%
  group_by(names) %>%
  summarise(mean_fert = mean(Fertility))

df2%>%
  group_by(col2) %>%
  summarise(mean_col1 = mean(col1))


# sample

dados %>% sample_n(10)

dados %>% sample_frac(0.1)

# ------------------------------------------------------------------------

## joins

tb1 <- tibble(codigo = c("001", "002", "003", "004", "005",
                         "006", "007", "008", "009", "010"),
              ocorrencia = rbinom(10,1, prob = 0.5),
              n = rpois(10,2))

tb2 <- tibble(code = c("001", "022", "003", "004", "005",
                       "000", "007", "018", "079", "010"),
              year = c(2010, 2011, 2015, 1999, 2000,
                       1996, 1998, 1955, 1971, 2001))

tb1

tb2

inner_join(tb1, tb2, by = c("codigo"="code"))

full_join(tb1, tb2, by = c("codigo"="code"))

right_join(tb1, tb2, by = c("codigo"="code"))

left_join(tb1, tb2, by = c("codigo"="code"))

# ------------------------------------------------------------------------
# ggplot2
#

library(ggplot2)
?ggplot()

data(tips, package = 'reshape2')

# Camada 1: Dados (Data)
str(tips)
head(tips)
summary(tips)

## Uma variável (Quantitativa Contínua)

g2 <- ggplot(mapping = aes(x = total_bill),  data = tips) # Mapeamento
g2

geom <- grep('geom_', ls("package:ggplot2"))
ls("package:ggplot2")[geom[]] # Lista os 'geoms'

g3 <- geom_histogram(col='gray50',fill=3) # Estrutura
g2 + g3

g3 <- geom_histogram(col='gray50',fill=3,bins=8)
g2 + g3 + geom_rug()

g3 <- geom_density(col='red',fill='blue')
g2 + g3
g2 + g3 + geom_rug(col=2)

g2 <- ggplot(mapping = aes(y = total_bill),  data = tips)
g3 <- geom_boxplot(col=4, fill=3, alpha=0.4)

g2 + g3

## Uma variável (Quantitativa Discreta ou Qualitativa)
library(magrittr)

tips_auxiliar <- tips$size %>% table %>% as.data.frame
colnames(tips_auxiliar) <- c("size","Contagem")

g2 <- ggplot(mapping = aes(x = size, y=Contagem),  data = tips_auxiliar)
g3 <- geom_col()
g2+g3
g2+g3 + coord_flip()


g2 <- ggplot(tips_auxiliar, aes(x="", y=Contagem, fill=size))
g3 <- geom_bar(stat = "identity")
g2+g3

g6 <- coord_polar("y", start=0) # Coordenada
g2+g3+g6

## Mais de uma Variável

# Gráfico de Dispersão e Regressão Linear
g2 <- ggplot(aes(x = total_bill, y = tip), data = tips)
g3 <- geom_point()
g2+g3

# Mapeando uma variável categórica à cor dos pontos:
g2 <- ggplot(aes(x = total_bill, y = tip, col=sex), data = tips)
g3 <- geom_point()
g2+g3

g5 <- geom_smooth(method = 'lm', col=4)
g2+g3+g5

g5 <- geom_smooth(aes(group=sex),method = 'lm',se=F)
g2+g3+g5

# Também podemos mapear uma variável contínua à cor dos pontos:
ggplot(tips, aes(x = size, y = tip, colour = total_bill)) + geom_point()

# Boxplot
g2 <- ggplot(aes(x = smoker, y = total_bill), data = tips)
g3 <- geom_boxplot()
g2+g3

g2 <- ggplot(aes(x = smoker, y = total_bill, col=smoker), data = tips)
g3 <- geom_boxplot()
g2+g3

g2 <- ggplot(aes(x = smoker, y = total_bill, fill=smoker), data = tips)
g3 <- geom_boxplot()
g2+g3

# Explorando as outras camadas

# Alterando os eixos e título
g2 <- ggplot(mapping = aes(x = total_bill),  data = tips)
g3 <- geom_histogram(col='gray50',fill=3,bins=8)
g2+g3
g2+g3 + xlab("Total da Conta") + ylab("Frequência") +
        ggtitle("Histograma - Total da Conta") +
        theme(plot.title = element_text(hjust = 0.5)) # Centraliza o título


# Legendas
g2 <- ggplot(aes(x = smoker, y = total_bill, fill=smoker), data = tips)
g3 <- geom_boxplot()
g2+g3
g2+g3 + labs(fill = "Fumante")
g2+g3 + labs(fill = "Fumante") + theme(legend.position = "top")


# Facets

g2 <- ggplot(aes(x = total_bill, y = tip, col=sex), data = tips)
g3 <- geom_point()
g2+g3
g2+g3+facet_grid(smoker~.)
g2+g3+facet_grid(.~smoker)
g2+g3+facet_grid(day~.)

# Modificando Temas
pos <- grep('theme_', ls("package:ggplot2"))
ls("package:ggplot2")[pos[]]

ggplot(aes(x = total_bill, y = tip), data = tips) + theme_gray()
ggplot(aes(x = total_bill, y = tip), data = tips) + theme_bw()
ggplot(aes(x = total_bill, y = tip), data = tips) + theme_minimal()
ggplot(aes(x = total_bill, y = tip), data = tips) + theme_set()
ggplot(aes(x = total_bill, y = tip), data = tips) + theme_test()

# Gráficos em Painel
library(gridExtra)

grafico1 <- ggplot(aes(x = total_bill, y = tip, col=sex), data = tips) +
  geom_point() +
  geom_smooth(method = 'lm', col=4)

grafico2 <- data.frame(y=rnorm(1000)) %>%
  ggplot(data=., mapping = aes(x=y)) +
  geom_density(col=4, fill=2, alpha=0.3)

grafico3 <- ggplot(data=mpg, aes(displ, hwy)) +
            geom_point() +
            facet_wrap(~manufacturer)

sc <- function(x) sqrt(1-x^2)                                # semicircle
el <- function(x) 3*sc(abs(x)/7)                             # ellipse
nl <- function(x) (-1) * el(x)                               # negative of el
sh <- function(x) 4.2 - .5*abs(x) -2.8*sc(.5*abs(x) -.5)     # shoulders
bf <- function(x) sc(abs(2 - abs(x)) - 1) - x^2/11 + .5*abs(x) -3      # bottom
cr  <- data.frame(x = c(0, .5, .8, 1), y = c(1.7, 1.7, 2.6, .9))   # cowl right
cl  <- data.frame(x = -cr$x, y = cr$y)                             # cowl left

plot_create <- function(fun, xmin, xmax){
  rp <- ggplot2::stat_function(fun = fun, xlim = c(xmin,xmax))
  lp <- ggplot2::stat_function(fun = fun, xlim = c(-xmax, -xmin))
  result_plot <- list(left_plot = lp, right_plot = rp)
  return(result_plot)
}

plot_result <- ggplot(data.frame(x = c(-7,7), y=c(-3,3)), aes(x,y))

upper_wing_plot <- plot_create(fun = el, xmin = 3, xmax = 7)
### # lower part of wing
lower_wing_plot <- plot_create(fun = nl, xmin = 4, xmax = 7)
plot_result <- plot_result + upper_wing_plot$left_plot + upper_wing_plot$right_plot +
  lower_wing_plot$left_plot + lower_wing_plot$right_plot

sh_plot <- plot_create(fun = sh, xmin = 1, xmax = 3)
plot_result <- plot_result + sh_plot$left_plot + sh_plot$right_plot

bt_plot <- plot_create(fun = bf, xmin = 0, xmax = 4)
plot_result <- plot_result + bt_plot$left_plot + bt_plot$right_plot

plot_result <- plot_result + geom_path(data = cr)
plot_result <- plot_result + geom_path(data = cl)

grafico4 <- plot_result

grid.arrange(grafico1,grafico2,grafico3,grafico4,nrow=2,ncol=2)

# Gráfico Dinâmico

library(plotly)
ggplotly(grafico1)
ggplotly(grafico2)
ggplotly(grafico3)
ggplotly(grafico4)

