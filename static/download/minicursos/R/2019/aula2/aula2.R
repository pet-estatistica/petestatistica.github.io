#----------------------------------------------------------------
## AULA 2 ##
# Estruturas de Controle
# Família apply
# Introdução ao tidyverse
## pipe, tibble, readr, readxl
#----------------------------------------------------------------

################## Estruturas de Controle #######################

## Operadores Relacionais
#----------------------------------------------------------------
a <- 42.95
b <- 75.87
a>b
a>=b
a<b
a<=b
a==b
a!=b

c <- c(70,80,60,90)
d <- c(70,90,65,85)
c>d
c>=d
c==d

e <- "hello world"
f <- "Hello World"

e==f

## Operadores Lógicos
#----------------------------------------------------------------
c <- c(70,80,60,90)
d <- c(70,90,65,85)
c>72 & c<85
d==70 | d==90
c!=d

### Estruturas de Seleção
### if
#----------------------------------------------------------------
x = 150
if (x > 100){
  print("Este número é maior que 100")
}

#----------------------------------------------------------------
x = 80
if (x > 100){
  print("Este número é maior que 100")
}

### if-else
#----------------------------------------------------------------
x = 25
if (x > 100) {
  "Este número é maior que 100"
} else {
  "Este número NÃO é maior que 100"
}

### if-else-if
#----------------------------------------------------------------
x = 100
if (x > 100) {
  "Este número é maior que 100"
} else if(x == 100) {
  "Este número é IGUAL a 100"
} else {
  "Este número NÃO é maior que 100"
}

### ifelse()
#----------------------------------------------------------------
ifelse(c(70,80,60,90)>=75,'É maior que 75','É menor ou igual que 75')

### Estruturas de Repetição
### for
#----------------------------------------------------------------
for(i in 1:10){
    print(i)
}

x <- 100:200
for(i in 1:10){
    print(x[i])
}

for (i in runif(5)) {print(i)}

### while
#----------------------------------------------------------------
x = 1
while(x < 15){
  x = x + 2
  print(x)
}

### next
#----------------------------------------------------------------
for(i in 1:10){
  if(i == 5 | i == 7)
    next
  print (i)}

### break
#----------------------------------------------------------------
for(i in 1:10){
  if(i == 8)
    break
  print (i)}

### repeat
#----------------------------------------------------------------
x = 0
repeat {
  x = x + 2
  if (x > 30){
    break
  }
  print(x)
}


######################### Família apply #########################

# apply
#----------------------------------------------------------------
str(rock)

# apply(X, MARGIN, FUN, ...), onde
# X = É uma matriz ou dataframe
# MARGIN = 1 para cálculos em linhas; 2 para cálculos em colunas
# FUN = Função a ser aplicada

apply(X=rock,MARGIN=1,FUN=mean)
apply(X=rock,MARGIN=2,FUN=mean)







# tapply
#----------------------------------------------------------------
str(iris)

# tapply(X, INDEX, FUN, ...), onde
# X = É a coluna de uma matriz ou dataframe que será utilizada para fazer os cálculos
# INDEX = É a coluna de uma matriz ou dataframe que será utilizada para dividir a base
# FUN = Função a ser aplicada

tapply(X=iris$Sepal.Length,INDEX=iris$Species,FUN=mean)





# lapply
#----------------------------------------------------------------
# lapply(X, FUN, ...), onde
# X = É uma lista
# FUN = Função a ser aplicada em cada elemento da lista


str(women)
w1 <- women[sample(x=1:15,size=7,replace=FALSE),1]
w2 <- women[sample(x=1:15,size=7,replace=FALSE),1]
(lista <- list(w1,w2))
lapply(X=lista,FUN=mean)






# sapply
#----------------------------------------------------------------
# sapply(X, FUN, ..., simplify=TRUE), onde
# X = É uma lista
# FUN = Função a ser aplicada em cada elemento da lista

sapply(X=lista,FUN=mean,simplify=TRUE)






#----------------------------------------------------------------

############################# tidyverse #########################

# Instalação dos pacotes tidyverse

# install.packages('tidyverse')

library(tidyverse)

#----------------------------------------------------------------

# Lista de pacotes pertencentes ao tidyverse

tidyverse_packages()

#----------------------------------------------------------------

############################# %>%  ##############################

#----------------------------------------------------------------

# Exemplo 1

# Sem pipe

mean(1:10)

# Com pipe

1:10 %>%  mean()

#----------------------------------------------------------------

# Exemplo 2

# Sem pipe

str(head((as_tibble(iris))))

# Com pipe

iris %>% as_tibble() %>% head() %>% str()

#----------------------------------------------------------------

# Exemplo 3

# disponível em https://www.r-statistics.com/2014/08/simpler-r-coding-with-pipes-the-present-and-future-of-the-magrittr-package/

#install.packages('babynames')

library(babynames)

library(magrittr)

babynames %>%
  filter(name %>% substr(1, 3) %>% equals("Ste")) %>%
  group_by(year, sex) %>%
  summarize(total = sum(n)) %>%
  qplot(year, total, color = sex, data = ., geom = "line") %>%
  add(ggtitle('Names starting with "Ste"')) %>%
  print

#----------------------------------------------------------------

############################ TIBBLE #############################

#----------------------------------------------------------------

# Criação de tibble por especificação de colunas

tibble(col1 = c(1,2,3),
       col2 = c(4,5,6),
       col3 = col1^2,
       col4 = col1 + col2)

#----------------------------------------------------------------

# Criação de tibbles por especificação de linhas

tribble(~col1, ~col2, ~col3, ~col4,
        "row1", 1, 2, 3,
        "row2", 4, 5, 6,
        "row3", 7, 8, 9)

#----------------------------------------------------------------

# Conversão de vetor nomeado para tibble

vetor_nomeado <- c('nome1' = 10 ,
                   'nome2' = 20,
                   'nome3' = 30,
                   'nome4' = 40)

vetor_nomeado %>% enframe()

#----------------------------------------------------------------

# Conversão de matriz para tibble

matriz <- matrix(round(rnorm(25),2), nrow = 5, ncol = 5)

matriz %>% as_tibble()

#----------------------------------------------------------------

# Conversão de data frame para tibble

df <- data.frame(col1 = c(1,2,3),
                 col2 = c(4,5,6),
                 col3 = c('a', 'b', 'c'))

df %>% as_tibble()

#----------------------------------------------------------------

# Seleção de linhas e colunas em tibbles

df2 <- mtcars %>% head() %>% as_tibble()

# Resulta em vetor.

df2$mpg

df2[["mpg"]]

df2[[1]]

# Resulta em `tibble`!

df2[, 1]

df2[, "mpg"]

df2[1, ]

#----------------------------------------------------------------

# Adicionar linhas e colunas em tibbles

tb <- c('nome1' = 10, 'nome2' = 20,
        'nome3' = 30, 'nome4' = 40) %>% enframe()

tb %>% add_row(name = 'nome5', value = 50)

tb %>% add_column(class = letters[1:nrow(tb)])

#----------------------------------------------------------------

############################ READR ##############################

#----------------------------------------------------------------

# Funções de importação disponíveis

ls("package:readr") %>% str_subset("^read_")

# Funções de exportação disponíveis

ls("package:readr") %>% str_subset("^write_")

#----------------------------------------------------------------

