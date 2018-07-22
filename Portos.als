module portos


---------------------------------------- SIGNATURES ----------------------------------------

// Porto possui pelo menos um navio e os níveis de combustíveis
abstract sig  Porto {
	navios: some Navio,
	nivelCombustivel: some NivelCombustivel
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


sig Navio{
	combustivel: some Combustivel
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

	all p: Porto | some p.navios
	all p: Porto | #p.nivelCombustivel = 3

}


// Cada navio está associado a um único porto
fact Navio {
	all nav: Navio | one nav.~navios
}


// Existe um nível para cada tipo de combustível
fact NivelCombustivel {
	one nb: NivelCombustivel | nb in NivelGasolina
	one nb: NivelCombustivel | nb in NivelPetroleoBruto
	one nb: NivelCombustivel | nb in NivelOleoDiesel
}


// Existe um nível associado a cada tipo de nível de combustível
fact Nivel {
	all n: Nivel | some n.~nivel
}




---------------------------------------- PREDICATES ----------------------------------------

pred show[]{

}

run show for 4
