
##################
#                #
#    FUNÇÕES     #
#                #
##################


## Funções Iniciais
## ------------------------------------------------------------------------

c()	# Cria um Vetor
getwd()	# Mostra o Diretório de Trabalho Atual
setwd('C:/Diretório')	# Muda o Diretório de Trabalho
dir()	# Lista os Arquivos do Diretório de Trabalho Atual
sessionInfo()	# Mostra algumas informações da sessão instalada
install.packages('nome_do_pacote') # Instala um pacote
library(nome_do_pacote)	# Carrega um pacote
require(nome_do_pacote)	# Carrega um pacote
help.start() # Mostra um tutorial para novos usuários de R

help('função'); ?função # Mostra a documentação de um pacote ou função
help.search('mean'); ??mean # Faz uma pesquisa mais geral para o pacote ou função
example('plot')	# Mostra exemplos de alguma função
print()	# Imprime o resultado de uma variável
q()	# Fecha a Sessão
ls(); objects()	# Exibe os objetos que foram armazenados
rm(x,y)	# Remove o objeto ‘x’ e ‘y’
rm(list=ls()); rm(list=objects())	# Remove todos os objetos que foram armazenados
str()	# Mostra a estrutura de um objeto
class()	# Verifica a classe de um objeto

## Operadores Básicos (R utilizado como Calculadora)
## ------------------------------------------------------------------------
4 + 4 # Adição
4 - 4 # Subtração
4 * 4 # Multiplicação
4 / 4 # Divisão
(1+1) * 5 # Respeita a ordem comum de operações matemáticas
4^2 # Exponenciação (4**2 também pode ser utilizado)
14 %% 3 # Módulo

## Funções Matemáticas
## ------------------------------------------------------------------------

sqrt(4) # Raiz Quadrada
factorial(4) # Fatorial
exp(1);exp(2) # Exponencial
abs(c(-2,-4,5,7)) # Absoluto
log(2.71828182) # Logaritmo Neperiano
round(2.718281, digits = 2) # Arredondamento com dois dígitos
ceiling(2.718281) # Arredondamento para cima
floor(2.718281) # Arredondamento para baixo

## Funções Estatísticas
## ------------------------------------------------------------------------
length(c(2,3,7,9,10)) # Imprime o comprimento do vetor
mean(c(4,3,7,8)) # Calcula a média
median(c(5,6,7,10)) # Calcula a mediana
min(c(5,6,7,10)) # Imprime o valor mínimo
max(c(5,6,7,10)) # Imprime o valor máximo
var(c(5,6,7,10)) # Calcula a variância
sd(c(5,6,7,10)) # Calcula o desvio padrão


## Criando Sequência de Valores
## ------------------------------------------------------------------------
1:10 # Sequência de números inteiros de 1 a 10.
rep(x=1,times=20) # 20 repetições do número 1.
seq(from=1,to=16, length.out = 7) # Sequência de 1 a 16 com comprimento 7.
seq(from=1,to=20, by = 2) # Sequência de 1 a 20 com intervalo 2.
runif(n = 10, max = 6, min = 5) # 10 números aleatórios no intervalo entre 5 e 6 com base na distribuição uniforme de probabilidade.
rnorm(n = 50, mean = 0, sd = 1) # 50 números aleatórios com base na distribuição normal de probabilidade com média 0 e desvio padrão 1.

##################
#    OBJETOS     #
#        E       #
#    CLASSES     #
##################


## VETOR
## ------------------------------------------------------------------------
##
##

x <- 25
class(x)

## CRIAÇÃO DE VETORES
## ------------------------------------------------------------------------
(meu_primeiro_vetor <- c(1,2,3)) # Vetor com números
(meu_segundo_vetor <- c("S&P","500")) # Vetor com palavras

## CLASSES
## ------------------------------------------------------------------------
var1 <- c(367,352,459)
class(var1)

var2 <- c(367L,352L,459L)
class(var2)

object.size(var1);object.size(var2) # O espaço ocupado na memória para um objeto do tipo 'integer' é menor.

var3 <- c(TRUE,FALSE,FALSE)
class(var3)

var4 <- c(5.2+3i, 3.8+4i)
class(var4)

var5 <- c("João","Matheus","Lineu","Alberto")
class(var5)

var6 <- c("João"=10,"Matheus"=9,"Lineu"=8,"Alberto"=10)
class(var6)
names(var6)

## VERIFICAÇÃO DE CLASSE
## ------------------------------------------------------------------------

var1;is.numeric(var1)   # Retorna 'TRUE', pois o objeto 'var1' é do tipo 'numeric'
var2;is.integer(var2)   # Retorna 'TRUE', pois o objeto 'var2' é do tipo 'integer'
var3;is.character(var3) # Retorna 'FALSE', pois o objeto 'var3' não é do tipo 'character'. Esse objeto é do tipo 'logical'
var3;is.logical(var3)   # Retorna 'TRUE', pois o objeto 'var3' é do tipo 'logical'
var4;is.complex(var4)   # Retorna 'TRUE', pois o objeto 'var4' é do tipo 'complex'
var5;is.character(var5) # Retorna 'TRUE', pois o objeto 'var5' é do tipo 'character'
var6;is.character(var6) # Retorna 'FALSE', pois o objeto 'var6' não é do tipo 'character'. Esse objeto é do tipo 'numeric'

## FORÇANDO OBJETO A MUDAR DE CLASSE
## ------------------------------------------------------------------------
var1;as.character(var1)       # Transforma a classe do objeto 'var1' para 'character'
var3;as.integer(var3)         # Transforma a classe do objeto 'var3' para 'integer'
c(1,0,1);as.logical(c(1,0,1)) # Transforma a classe do vetor 'c(1,0,1)' para 'logical'
var5;as.numeric(var5)         # Não transforma a classe do objeto 'var5' para 'numeric'. Por conta disso, retorna um vetor com 'NA'.


## INDEXAÇÃO PARA VETORES
## ------------------------------------------------------------------------
## Vetores com Números
(vetor <- c(1,23,3,47,90,6,7,8, 5 ,6 ,10 , 45)) # Criando um novo vetor de números
vetor[5];vetor[c(1,2,3,4,6)] # Selecionando o elemento de posição 5; Selecionando os elementos da posição 1,2,3,4 e 6.
vetor[1:3];vetor[seq(1, 3)] # Selecionando os primeiros 3 elementos; Selecionando os primeiros 3 elementos utilizando a função 'seq'.
vetor[-3];vetor[-c(1,4)] # Removendo o elemento da posição 3; Removendo os elementos da posição 1 e 4.


## Vetores com Nomes
(chr = c("Barack", "Obama")) # Criando um novo vetor de palavras
(names(chr) = c("Nome", "Sobrenome"))
chr
chr["Nome"]


## SELEÇÃO CONDICIONAL PARA VETORES
## ------------------------------------------------------------------------
(vetor2 <- c(18, 12 , 31 , 56 , 7 , 5 , 9 )) # Criando um novo vetor de números
vetor > 15;vetor[vetor > 15]
vetor > 30 & vetor < 100;vetor[vetor > 30 & vetor < 100] # Operador lógico '&' significa 'e' (and)
vetor > 30 | vetor < 100;vetor[vetor > 30 | vetor < 100] # Operador lógico '|' significa 'ou' (or)

(chr2 <- letters[1:20])
chr2[1:5]
chr2[chr2 == "e"]
chr2[chr2 == "b" | chr2 == "f"]
which(chr2 == "e") # Retorna a posição em que o elemento "e" se encontra no vetor

## FATOR
## ------------------------------------------------------------------------
##
##

## CRIAÇÃO DE FATORES
## ------------------------------------------------------------------------
(vec1 <- c("Macho","Femea","Femea","Macho","Macho"))
(fac_vec1 <- factor(vec1))
class(vec1)
class(fac_vec1)


## VARIÁVEIS CATEGÓRICAS NOMINAIS
## ------------------------------------------------------------------------
(animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre"))
(fac_animais <- factor(animais))
class(fac_animais)
levels(fac_animais)


## VARIÁVEIS CATEGÓRICAS ORDINAIS
## ------------------------------------------------------------------------
(grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado"))
(fac_grad <- factor(grad, ordered = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado")))
levels(fac_grad)
is.ordered(fac_grad)
is.ordered(fac_animais)

summary(grad);summary(fac_grad)

## MATRIZ
## ------------------------------------------------------------------------
##
##


## CRIAÇÃO DE MATRIZES
## ------------------------------------------------------------------------
(matriz <- matrix(1:9, nrow = 3, ncol = 3)) # Preenchimento por coluna
(matriz <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)) # Preenchimento por linha


(matriz <- matrix(c(1,4,5,7),nrow=2,ncol=2)) # Criação de uma matriz de ordem 2
t(matriz) # Transposta
solve(matriz) # Inversa
diag(1:3) # Matriz Diagonal

matriz;rbind(matriz, c(0,1)) # Nova Linha
matriz;cbind(matriz, c(2,3)) # Nova Coluna

## DIMENSÕES DA MATRIZ
## ------------------------------------------------------------------------
dim(matriz)  # N° de linhas e colunas
nrow(matriz) # N° de linhas
ncol(matriz) # N° de colunas

## OPERAÇÕES COM MATRIZES
## ------------------------------------------------------------------------
(matriz1 <- matrix(1:16,nrow = 4, ncol = 4))
(matriz2 <- matrix(seq(1,32,by=2),nrow=4,ncol=4))

matriz2 + 3 # Adição
matriz2 - 1 # Subtração
matriz2 * 3 # Multiplicação
matriz2 / 2 # Divisão
matriz1 * matriz2 # Multiplicação elemento por elemento
matriz1 %*% matriz2 # Multiplicação Matricial

## INDEXAÇÃO PARA MATRIZES
## ------------------------------------------------------------------------
(matriz <- matrix(c(1,4,5,7),nrow=2,ncol=2))
matriz[1,2] # Elemento da linha 1 e coluna 2
matriz[1,]  # Elementos da linha 1
matriz[, 2] # Elementos da coluna 2
matriz[, 2, drop = FALSE] # Elementos da coluna 2 (Mantendo o formato de matriz)

## SELEÇÃO CONDICIONAL PARA MATRIZES
## ------------------------------------------------------------------------
matriz
matriz == 1;matriz[matriz == 1] # Seleciona os elementos iguais a 1
matriz > 4;matriz[matriz > 4]   # Seleciona os elementos maiores que 4
matriz >=4 & matriz <= 5;matriz[matriz >=4 & matriz <= 5] # Seleciona os elementos maiores ou iguais a 4 E menores ou iguais a 5
matriz == 1 | matriz == 5;matriz[matriz == 1 | matriz == 5] # Seleciona o elemento igual a 1 ou igual a 5

## DATAFRAME
## ------------------------------------------------------------------------
##
##


## CRIAÇÃO DE DATAFRAMES
## ------------------------------------------------------------------------
data.frame(Nomes=c("Marcelo","Fernanda"),Notas=c(8,9))

país = c("EUA", "Dinamarca", "Holanda", "Espanha", "Brasil")
nome = c("Maurício", "Pedro", "Aline", "Beatriz", "Marta")
altura = c(1.78, 1.72, 1.63, 1.59, 1.63)
peso = c(50, 76, 62, 55, 120)

(pesquisa <- data.frame(país, nome, altura, peso))

## INFORMAÇÕES SOBRE O DATAFRAME
## ------------------------------------------------------------------------
class(pesquisa) # Classe do dataframe
str(pesquisa)   # Estrutura do dataframe
dim(pesquisa)   # Dimensões (Número de linhas e Colunas)
nrow(pesquisa)  # Número de Linhas
ncol(pesquisa)  # Número de Colunas

## Adicionar uma nova coluna ou linha e renomear
## ------------------------------------------------------------------------
rbind(pesquisa,data.frame(país="China",nome="Bruce",altura=1.82,peso=70)) # Nova Linha
cbind(pesquisa,IMC = c(50,76,62,55,120) / c(1.78,1.72,1.63,1.59,1.63)^2 ) # Nova Coluna

rownames(pesquisa) # Nome das Linhas
colnames(pesquisa) # Nome das Colunas
rownames(pesquisa) <- c("Primeiro","Segundo","Terceiro","Quarto","Quinto") # Alterando nome das linhas
colnames(pesquisa) <- c("PAÍS","NOME","ALTURA","PESO") # Alterando nome das colunas

## INDEXAÇÃO PARA DATAFRAMES
## ------------------------------------------------------------------------
pesquisa
pesquisa[4, ] # Selecionando a 4° linha do dataframe

pesquisa[1:5,];head(pesquisa,5) # Selecionando as primeiras 5 linhas

pesquisa[3:5,];tail(pesquisa,3) # Selecionando as últimas 3 linhas

pesquisa[,2];pesquisa$NOME # Selecionando a 2° Coluna (Pelo número da coluna e pelo nome da coluna)

pesquisa[3,1];pesquisa$PAÍS[3] # Selecionando a 3° linha da 1° coluna (Por números e pelo nome da coluna)

pesquisa[1, "NOME"] # Selecionando a 1° linha da 2° coluna

## SELEÇÃO CONDICIONAL PARA DATAFRAMES
## ------------------------------------------------------------------------
pesquisa
pesquisa[pesquisa$PESO == 50,] # Seleciona a linha com peso igual a 50
pesquisa[pesquisa$ALTURA>=1.65,] # Seleciona as linhas com altura maior ou igual a 1.65
pesquisa[pesquisa$ALTURA>=1.65,"NOME"] # Seleciona as linhas com altura maior ou igual a 1.65 da coluna 'NOME'

pesquisa[pesquisa$PESO > 50 & pesquisa$PESO < 70,];subset(pesquisa, PESO > 50 & PESO < 70) # Seleciona as linhas com peso maior que 50 e menor que 70.

pesquisa[pesquisa$PESO > 50 & pesquisa$ALTURA < 1.70,];subset(pesquisa, PESO > 50 & ALTURA < 1.70) # Seleciona as linhas com peso maior que 50 e altura menor que 1.70.

## LISTA
## ------------------------------------------------------------------------
##
##

## CRIAÇÃO DE LISTAS
## ------------------------------------------------------------------------
(lista <- list(1:10,c("Maria", "João", "Alfredo"),rnorm(10),pesquisa))

# Lista Nomeada
(lista <- list(Sequencia=1:10,Nomes=c("Maria", "João", "Alfredo"),NumAleat=rnorm(10),Dataframe=pesquisa))

class(lista)
length(lista)
str(lista)

## INDEXAÇÃO PARA LISTAS
## ------------------------------------------------------------------------
lista[1];str(lista[1]) # Extrai o 1° elemento da lista (Retorna uma lista com um elemento)
lista[[1]];str(lista[[1]]) # Extrai o 1° elemento da lista (Retorna somente o elemento)

lista[[2]];lista[["Nomes"]] # Extrai o 2° elemento da lista

lista[[1]][3] # Extrai o 3° item do 1° elemento da lista
lista$NumAleat[4] # Extrai o 4° item do elemento 'NumAleat' da lista
lista$Nomes[c(2,3)] # Extrai o 2° e 3° item do elemento 'Nomes' da lista
lista$Dataframe$Nome # Extrai a coluna 'NOME' do elemento 'Dataframe' da lista


## SELEÇÃO CONDICIONAL PARA LISTAS
## ------------------------------------------------------------------------
lista
lista[[3]][lista[[3]]>=0] # Extrai os itens positivos do terceiro elemento da lista
lista$Sequencia[lista$Sequencia>=5] # Extrai os itens maiores que 5 do elemento 'Sequencia' da lista



##################
#    LEITURA     #
#       DE       #
#     DADOS      #
##################


## TXT
## ------------------------------------------------------------------------
dados_txt <- read.table(file = "MingotiAnA4.txt",
                        header = TRUE,
                        sep = '\t',
                        dec = '.')
head(dados_txt)

## CSV
## ------------------------------------------------------------------------
dados_csv <- read.csv(file = "MingotiAnA4.csv",
                      header = TRUE,
                      sep = ';',
                      dec = '.')

head(dados_csv)

## XLSX
## ------------------------------------------------------------------------
library(readxl)
dados_xlsx <- read_excel(path = "MingotiAnA4.xlsx",
                         sheet = 1)

head(dados_xlsx);class(dados_xlsx)
as.data.frame(head(dados_xlsx))



##################
#                #
#    GRÁFICOS    #
#                #
##################

summary(dados_txt)

plot(dados_txt)


## ------------------------------------------------------------------------
barplot(table(dados_txt$grp))

plot(dados_txt$x1)
hist(dados_txt$x1)
plot(density(dados_txt$x1))
boxplot(dados_txt$x1)


## ------------------------------------------------------------------------
plot(dados_txt$x1 ~ as.factor(dados_txt$grp))
plot(dados_txt$x1 ~ dados_txt$x2)


## ------------------------------------------------------------------------

plot(dados_txt$x1 ~ dados_txt$x2) # exemplo

plot(dados_txt$x1 ~ dados_txt$x2,
     xlab = 'Variável x2',
     ylab = 'Variável x3') # eixos

plot(dados_txt$x1 ~ dados_txt$x2,
     xlab = 'Variável x2',
     ylab = 'Variável x3',
     main = 'x3 em função de x1') # título

plot(dados_txt$x1 ~ dados_txt$x2,
     xlab = 'Variável x2',
     ylab = 'Variável x3',
     main = 'x3 em função de x1',
     col = 'blue') # cores (nome) - azul

plot(dados_txt$x1 ~ dados_txt$x2,
     xlab = 'Variável x2',
     ylab = 'Variável x3',
     main = 'x3 em função de x1',
     col = 2) # cores (número) - vermelho

plot(dados_txt$x1 ~ dados_txt$x2,
     xlab = 'Variável x2',
     ylab = 'Variável x3',
     main = 'x3 em função de x1',
     col = '#00cc00') # cores (html) - verde

plot(dados_txt$x1 ~ dados_txt$x2,
     xlab = 'Variável x2',
     ylab = 'Variável x3',
     main = 'x3 em função de x1',
     pch = 19) # estilos de pontos (experimente entre 1 e 127)

## ------------------------------------------------------------------------
plot(dados_txt$x1 ~ dados_txt$x2,
     xlab = 'Variável x2',
     ylab = 'Variável x3',
     main = 'x3 em função de x1',
     pch = 19,
     col = dados_txt$grp)
legend("top", legend=c("Grupo 1", "Grupo 2"),
       col=c(1,2), bty="o", pch=c(19,19)) ## Acrescenta legenda


demo(graphics)

