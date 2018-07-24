module portos


---------------------------------------- SIGNATURES ----------------------------------------

// Porto possui 3 tipos de nivelCombustivel.
abstract sig  Porto {
	navios : some Navio,
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
}


// Cada navio está associado a um único porto
fact Navio {
	all nav: Navio | one nav.~navios
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

pred show[]{

}


---------------------------------------- FUNCTIONS ----------------------------------------








---------------------------------------- ASSERTS ----------------------------------------

assert assertNaviosPorto {
--	all p: Porto | #(p.navios) > 0
}

assert assertNiveisCombustivelPorto {
--	all p: Porto | #(p.nivelCombustivel) = 3
}

assert assertNivelCombustivel {
	all nc: NivelCombustivel | #(nc.nivel) = 1
}



---------------------------------------- CHECK'S ----------------------------------------

--check assertNaviosPorto for 5
--check assertNiveisCombustivelPorto for 5
--check assertNivelCombustivel for 5






run show for 12
