## Aula 2 ( Indexação e seleção condicional)

## Indexando vetores
vetor <- c(1,23,3,47,90,6,7,8, 5 ,6 ,10 , 45)
vetor
vetor[5]
vetor[c(1,2,3,4,6)]
vetor[-3]
vetor[-c(1,4)]
vetor[seq(1, 3)]

## Indexação Lista
lista <- list( Carros = c("celta", "gol", "bmw"),
               Matriz = matrix(seq(1,6), nrow= 3, ncol= 2),
               Notas = c(rep(10,3), rep(8,2)))
lista
lista[[2]]
lista[[1]][3]
lista$Carros[2]
lista$Notas [c(4,5)]

## Indexação matrizes
Matriz <- lista$Matriz
Matriz
Matriz[3,2]
Matriz[1,]
Matriz[, 2, drop = FALSE]



## Indexação Data frames
df <- data.frame(Nomes = c("Nilton", "Willian", "Lineu"),
                 Idade = c(20,19,21),
                 Formado = rep(FALSE, 3))
df
df[3, 1]
df$Idade[3]
df$Nomes[1]
df[1, "Nomes"]

## Começar a deixar eles fazerem os exercicios.


## Seleção condicional em vetores
vetor2 <- c(18, 12 , 31 , 56 , 7 , 5 , 9 )
vetor2
vetor2[vetor2 > 15]
vetor2[vetor2 > 30 & vetor2 <100]
vetor2 > 30 & vetor2 < 100
vetor2 > 30 | vetor2 < 100
chr <- letters[1:20]
chr
chr[1:5]
chr[chr == "e"]
vetor2[vetor2 > 15]
which(vetor2 >15)
chr[chr == "b"]
which(chr == "e")
which(vetor2 > 15 & vetor2 <100)


## Seleçao condicional em Data Frames
df2 <- data.frame( ano = seq(2000,2007),
                   lucro = c(1 , 1.5, 3.4, 2.3, 6, 8.3, 7.5, 2.1),
                   Empresa = letters[1:8])
df2

df2[df2$ano == 2005,]
df2[df2$lucro > 5,]
df2[df2$lucro < 5, "ano"]
df2[df2$lucro < 5 & df2$ano < 2005,]
df2[df2$lucro < 5 & df2$ano < 2005,]
subset(df2, lucro < 5 & ano < 2005)
df2[df2$lucro < 5, "ano"]
subset(df2, lucro <5 , select= "ano")

## Fazer mais exercícios e finalizar a aula.

