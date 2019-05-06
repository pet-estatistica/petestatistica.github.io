#---------------------------------------------------------------------
#
# Estruturas de Controle

# **1)** Armazene um número qualquer em uma variável e utilize a estrutura
# `if` ou a função `ifelse()` para printar a frase 'Esse número é maior
#  que 100' se a condição for atendida.

x <- 150
if (x > 100){
  print("Este número é maior que 100")
}

ifelse(x>100,"Esse número é maior que 100","")

# **2)** Melhore o código anterior para printar a frase 'Esse número é
# menor que 100' ou 'Esse número é igual a 100' quando as condições
# forem atendidas.

x <- 150
if(x > 100){
  print("Esse número é maior que 100")
} else if(x==100){
  print("Esse número é igual a 100")
} else {
  print("Esse número é menor que 100")
}


x <- 80
ifelse(x>100,"Esse número é maior que 100",
       ifelse(x==100,"Esse número é igual a 100","Esse número é menor que 100"))

# **3)** Crie um loop para imprimir os números 2,4,6,8,10 separadamente no console.

for (i in 1:10){
  if(i == 1 | i==3 | i==5 | i == 7 | i == 9){
    next
  }
  print(i)
}

for (i in c(2,4,6,8,10)){
  print(i)
}

i <- 0
while(i < 10){
  i <- i + 2
  print(i)
}

# **4)** Considere o vetor, matriz e lista abaixo. Crie um loop que imprime
# separadamente os elementos no console e uma mensagem dizendo se o
# elemento é maior que 5 ou menor ou igual que 5.

vetor <- c(1,2,4,8,6,5)
matrix <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
lista <- list(2,7,6,3,4,1)

l_vetor <- length(vetor)
l_matrix <- length(matrix)
l_lista <- length(lista)

for(i in 1:length(vetor)){
    print(cbind(vetor[i],
                ifelse(vetor[i]>5,"Elemento maior que 5","Elemento menor ou igual 5")))
}

for(i in 1:length(matrix)){
    print(cbind(matrix[i],
                ifelse(matrix[i]>5,"Elemento maior que 5","Elemento menor ou igual 5")))
}

for(i in 1:length(lista)){
    print(cbind(lista[[i]],
                ifelse(lista[[i]]>5,"Elemento maior que 5","Elemento menor ou igual 5")))
}

#---------------------------------------------------------------------
#
# Família Apply

# **1)** Considere os dataset `mtcars` nativo do R. Utiliza a função `apply`
# para calcular a média de todas as variáveis (colunas) e a média de todas as
# observações (linhas).

# - (**Dica:** Calcular Média - `mean()`;
# Utilize o comando `data(mtcars)` para carregar o dataset)

data(mtcars)

apply(X=mtcars,MARGIN=1,FUN=mean)
apply(X=mtcars,MARGIN=2,FUN=mean)


# **2)** Considere o dataset `warpbreaks` nativo do R.
# Utilize a função `tapply` para calcular a mediana da coluna **breaks**
# para cada nível da variável **tension**. Agora calcule a mediana de
# **breaks** para cada nível da variável **wool**.
# (**Dica:** Calcular Mediana - `median()`; Utilize o comando `data(warpbreaks)` para carregar o dataset)

data(warpbreaks)
tapply(warpbreaks$breaks,warpbreaks$tension,FUN=median)
tapply(warpbreaks$breaks,warpbreaks$wool,FUN=median)


# **3)** Considere a lista abaixo. Utilize a função `lapply` para calcular
# as estatísticas Mínimo, 1° Quartil, Mediana, Média, 3° Quartil e Máximo para cada elemento da lista.
# (**Dica:** A função `summary` pode ser utilizada para calcular essas estatísticas)

lista <- list(year = c(50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73),
              calls = c(4.4, 4.7, 4.7, 5.9, 6.6, 7.3, 8.1, 8.8, 10.6, 12, 13.5, 14.9, 16.1, 21.2, 119, 124, 142, 159, 182, 212, 43, 24, 27, 29))

lapply(lista,summary)

# **4)** Considere a mesma lista do exercício anterior. Utilize a função
# `sapply` para calcular as mesmas estatísticas, mas para retornar um objeto mais simplificado.

sapply(lista,summary,simplify = TRUE)

#---------------------------------------------------------------------
# %>%

# **1)** Execute e reescreva os seguintes códigos utilizando o pipe:

# *a)* class(mean(iris$Sepal.Length))

class(mean(iris$Sepal.Length))

iris$Sepal.Length %>% mean() %>% class()

# *b)* round(seq(from=1,to=20, by = 0.01), 2)

round(seq(from=1,to=20, by = 0.01), 2)

seq(from=1,to=20, by = 0.01) %>% round(digits = 2)

# *c)* plot(diamonds[1:1000,5:6], col = 3)

plot(diamonds[1:1000,5:6], col = 3)

diamonds[1:1000,5:6] %>% plot(col = 3)

#---------------------------------------------------------------------

# Tibble

# **1)** Crie um vetor nomeado com 5 nomes e as respectivas idades e o
# converta para tibble.

vetor <- c(nome1 = 10, nome2 = 15, nome3 = 20, nome4 = 25, nome5 = 30)

vetor %>% enframe()

# EXPERIMENTE COM AS_TIBBLE, NOTA A DIFERENÇA?

# **2)** Crie uma matriz 5x5 e converta para tibble.

matriz <- rpois(25, 15) %>% matrix(nrow = 5, ncol = 5)

matriz %>% as_tibble()

# **3)** Crie um tibble especificando as linhas.

tribble(~'col1', ~'col2', ~'col3',
        1      ,2       ,3       ,
        4      ,5       ,6       ,
        7      ,8       ,9       )

# **4)** Selecione as 50 primeiras linhas do data frame iris, armazene
# em um objeto e converta para tibble.

ex <-  iris[1:50,] %>% as_tibble()

# **5)** Adicione uma nova linha e uma nova coluna ao tibble criado em 3.

names(ex)

ex2 <- ex %>% add_row("Sepal.Length" = 1,
                      "Sepal.Width" = 1,
                      "Petal.Length" = 1,
                      "Petal.Width" = 1,
                      "Species" = '1')

ex3 <- ex2 %>% add_column('coluna' = rnorm(51))

# **6)** Selecione a primeira coluna utilizando o nome da variável.

ex3[,names(ex3[1])]

# **7)** Selecione a primeira coluna utilizando o número da coluna.

ex3[,1]

# **8)** Crie um tibble com 100 linhas em que a primeira coluna se chame
# 'nivel' e contenha os níveis 'a', 'b', 'c', 'd' e 'e' repetidos 20 vezes; a
# segunda coluna assuma valores entre 0 e 1; a terceira coluna assuma
# valores acima de 50; e a quarta coluna seja a soma das duas anteriores.

tibble(nivel = rep(letters[1:5], 20),
       valores = runif(100),
       valores2 = valores + 50,
       valores3 = valores + valores2)

#---------------------------------------------------------------------

# readr

# **1)** Importe os arquivos utilizados na Aula 1 utilizando as funções
# adequadas do Tidyverse.

dir()

read_delim("MingotiTb2.2.csv",
           delim = ';',
           col_names = T,
           )

read_table2("MingotiTb2.2.txt")

readxl::read_excel(path = "MingotiTb2.2.xlsx",
                   sheet = 1)

#---------------------------------------------------------------------
