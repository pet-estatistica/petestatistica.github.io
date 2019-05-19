#-----------------------------------------------------------------------
# PARTE 1
#-----------------------------------------------------------------------

# Considere o conjunto de dados nativo do R Theoph.

# Peça a documentação dos dados.

# Qual a classe dos dados?

# Peça a estrutura dos dados.

# Quais são as classes das variáveis da base?

# Gere o resumo da base.

# Obtenha a média e o desvio padrão de cada variável.

# Converta os dados para o formato tibble

# Gere um gráfico com o tibble gerado com todas as variáveis utilizando o
# método plot.

# Filtre apenas os casos que a variável Time esteja entre 2 e 4

# Selecione as colunas Subject e conc e gere um gráfico qualquer de conc
# em função de Subject.

# Ordene a base pelos valores da variável Time

# Crie uma coluna que seja a razão entre as variáveis Wt e Dose

# Exclua a coluna criada

# Calcule média da variável Time para cada nível de Subject.

# Utilizando o ggplot gere um gráfico de dispersão de dose vs conc

#-----------------------------------------------------------------------
# PARTE 2
#-----------------------------------------------------------------------

# Considere o seguinte data set:

df <- tibble(
  id = rep(1:50),
  mes1 = rnorm(50, rpois(1,(runif(1)*10))),
  mes2 = rnorm(50, rpois(1,(runif(1)*20))),
  mes3 = rnorm(50, rpois(1,(runif(1)*30))),
  mes4 = rnorm(50, rpois(1,(runif(1)*40))),
  mes5 = rnorm(50, rpois(1,(runif(1)*50))))

# Passe os dados para formato longo de forma que seja criada uma coluna
# "mês" e uma coluna "valores".

# Plote um gráfico com id no eixo x, valores no eixo y, e cores para
# diferentes meses

# Faça com que os dados retornem para o formato largo

#-----------------------------------------------------------------------
# PARTE 3
#-----------------------------------------------------------------------

# Armazene um número qualquer em uma variável e utilize a estrutura
# `if` ou a função `ifelse()` para printar a frase 'Esse número é maior
# que 100', 'Esse número é igual a 100' ou 'Esse número é menor que 100'
# quando as condições forem atendidas.

# Crie um loop para imprimir os números 2,4,6,8,10 separadamente no console.

# Considere o vetor, matriz e lista abaixo.
# Crie um loop para cada objeto que imprime separadamente os elementos no console e uma mensagem
# dizendo se o elemento é maior que 5 ou menor ou igual que 5. -
# (Dica: Utilize a função cbind() para unir o número e a mensagem)

vetor <- c(1,2,4,8,6,5)
matrix <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
lista <- list(2,7,6,3,4,1)

#-----------------------------------------------------------------------
# PARTE 4
#-----------------------------------------------------------------------

# Os dados disponíveis no aquivo consulta.csv foram extraídos da base de
# dados pública do Ipardes e dizem respeito ao número de acidentes de trânsito
# em municípios do Paraná no ano de 2010. O Batalhão de Polícia de Trânsito - BPTRAN
# define como acidente de trânsito todo evento ocorrido na via pública,
# inclusive calçadas, decorrente do trânsito de veículos e pessoas, que
# resulta em danos humanos e materiais. Compreende: colisões entre veículos,
# choque com objetos fixos, capotamentos, tombamentos, atropelamentos, queda
# de pedestres e ciclistas, etc. Além disso toda ocorrência fortuita ou danosa,
# envolvendo veículos em circulação, ou parados, respectivos ocupantes, pedestres
# e objetos móveis ou fixos.

# Os dados consideram apenas os acidentes de trânsito ocorridos nas vias municipais
# (não foram incluídos acidentes ocorridos nas Rodovias Estaduais e Federais).

# Cada linha da base diz respeito a 1 dos 399 municípios do estado do Paraná,
# foram coletadas as variáveis:

# actt - Número de acidentes de trânsito no município
# pibpc - Produto Interno Bruto per Capita do município.
# ater - Área Territorial (km²).
# gurb - Grau de Urbanização, percentagem da população da área urbana
# em relação à população total.
# frvei - Frota total de veículos.
# pop - População Censitária.

# Importe os dados

# Verifique o cabeçalho dos dados

# Retire as linhas com dados ausentes. Quantas linhas foram retiradas?

# Peça o resumo dos dados gerados no item anterior, o que você pode
# inferir sobre as variáveis com este resumo?

# Faça um histograma das variáveis área territorial e grau de urbanização,
# o que você observa?

# Considere combinações de variáveis.
# Gere gráficos com os quais seja possível visualizar o comportamento dos
# dados

# O que você notou?
# Quais variáveis são assimétricas?
# Quais variáveis são correlacionadas?
# Quais variáveis não tem relação entre si?
#-----------------------------------------------------------------------
