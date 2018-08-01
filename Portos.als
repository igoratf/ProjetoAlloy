module portos


---------------------------------------- SIGNATURES ----------------------------------------

// Porto possui 3 tipos de nivelCombustivel.
abstract sig  Porto {
	nivPetrol : one NivelPetroleoBruto,
	nivGasol : one NivelGasolina,
	nivDies: one NivelOleoDiesel
}

sig PortoNorte extends Porto{}
sig PortoSul extends Porto{}
sig PortoLeste extends Porto{}
sig PortoOeste extends Porto{}


// Nível de combustível possui um nível (alto, médio ou baixo)
abstract sig NivelCombustivel{
	nivel: one Nivel
}


// Nível de combustível para cada tipo de combustível
sig NivelPetroleoBruto extends NivelCombustivel{}
sig NivelGasolina extends NivelCombustivel{}
sig NivelOleoDiesel extends NivelCombustivel{}



abstract sig Nivel{}

// Classificações de nível
sig Alto extends Nivel{}
sig Medio extends Nivel{}
sig Baixo extends Nivel{}

--Navio possui um destino e um tipo de combustivel.
sig Navio{
	destino: one Porto,
	combustivel: one Combustivel
}

abstract sig Combustivel{}

sig Gasolina extends Combustivel{}
sig PetroleoBruto extends Combustivel{}
sig OleoDiesel extends Combustivel{}


---------------------------------------- FACTS ----------------------------------------

fact Portos {
	one p: Porto | p in PortoNorte
	one p: Porto | p in PortoSul
	one p: Porto | p in PortoLeste
	one p: Porto | p in PortoOeste

	all p: Porto |  #maximoDeDestinoPossivel[p] <= 3

	all p: Porto | all b: Baixo | checaNivelBaixoGasol[p, b]  =>  (one n : Navio | defineDestino[n] = p and defineCombustivel[n] = Gasolina)
	all p: Porto | all b: Baixo | checaNivelBaixoPetroleoBruto[p, b]   =>  (one n : Navio | defineDestino[n] = p and defineCombustivel[n] = PetroleoBruto) 
	all p: Porto | all b: Baixo | checaNivelBaixoDiesel[p, b] =>  (one n : Navio |  defineDestino[n] = p and defineCombustivel[n] = OleoDiesel) 



}


// Existe um nível para cada tipo de combustível
fact NivelCombustivel {
	all np: NivelPetroleoBruto | one nivPetrol.np
	all ng: NivelGasolina | one nivGasol.ng
	all nd: NivelOleoDiesel | one nivDies.nd
}


// Existe um nível associado a cada tipo de nível de combustível
fact Nivel {
	all n: Nivel | one n.~nivel
}

--Existe apenas um combustivel associado a um barco.
fact Combustivel{
	all c : Combustivel | one combustivel.c
}


---------------------------------------- PREDICATES ----------------------------------------

--Verifica se o Nivel de Gasolina de um porto está baixo.
pred checaNivelBaixoGasol[p:Porto, b: Baixo] {
	p.nivGasol.nivel = b
}

--Verifica se o Nivel de Petroleo Bruto de um porto está baixo.
pred checaNivelBaixoPetroleoBruto[p:Porto, b: Baixo] {
	p.nivPetrol.nivel = b
}

--Verifica se o Nivel de Oleo Diesel de um porto está baixo.
pred checaNivelBaixoDiesel[p:Porto, b: Baixo] {
	p.nivDies.nivel = b
}

---------------------------------------- FUNCTIONS ----------------------------------------
--Função que retorna a quantidade de navios que podem ter o mesmo porto como destino.
fun maximoDeDestinoPossivel[p: Porto]: set Navio{
	destino.p
}

--Função que define o Porto que Navio precisa transportar Combustivel.
fun defineDestino[n: Navio]: set Porto{
	n.destino
}

--Função que define o Combustivel que o Navio precisa transportar.
fun defineCombustivel[n: Navio]: set Combustivel{
	n.combustivel
}



---------------------------------------- ASSERTS ----------------------------------------


assert assertNiveisCombustivelPorto {
	all p: Porto | #(p.nivPetrol + p.nivGasol + p.nivDies) = 3
}

assert assertNivelCombustivel {
	all nc: NivelCombustivel | #(nc.nivel) = 1
}

assert assertNavioDestino {
	all navio: Navio | #(navio.destino) = 1
}
 assert assertNavioCombustivel {
	all navio: Navio | #(navio.combustivel) = 1
}


---------------------------------------- CHECK'S ----------------------------------------

--check assertNiveisCombustivelPorto for 5
--check assertNivelCombustivel for 5
--check assertNavioDestino  for 5
--check assertNavioCombustivel for 5


pred show[]{
}


run show for 12
