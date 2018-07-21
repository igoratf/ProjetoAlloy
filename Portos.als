module portos

abstract sig Regiao {
	portos: one Porto
}

sig Norte extends Regiao{}

sig Sul extends Regiao{}

sig Leste extends Regiao{}

sig Oeste extends Regiao{}

sig Porto {
	nivelCombustivel: some NivelCombustivel,
	navios: some Navio
}

sig Navio {
	combustivel: one Combustivel,
}

abstract sig NivelCombustivel {
	nivel: one Nivel
}

sig NivelPetroleoBruto extends NivelCombustivel{}

sig NivelGasolina extends NivelCombustivel{}

sig NivelOleoDiesel extends NivelCombustivel{}


abstract sig Nivel {}

sig Alto extends Nivel{}

sig Baixo extends Nivel{}

sig Medio extends Nivel{}

abstract sig Combustivel{}

sig Gasolina extends Combustivel{}

sig PetroleoBruto extends Combustivel{}

sig OleoDiesel extends Combustivel{}

fact Regiao {

	one reg: Regiao |  reg in Norte

	one reg: Regiao |  reg in Oeste

	one reg: Regiao |  reg in Sul

	one reg: Regiao |  reg in Leste
	


}

fact Nivel{

	all niv:Nivel | one nivel.niv

}


fact Portos {
	all p: Porto | one p.~portos
	all p: Porto | some p.nivelCombustivel

}

fact Nivel {
	all niv: Nivel | one niv.~nivel
}

fact Combustivel {
	one comb: Combustivel | comb in Gasolina
	one comb: Combustivel | comb in PetroleoBruto
	one comb: Combustivel | comb in OleoDiesel
	all comb: Combustivel | one comb.~combustivel
}

fact NivelCombustivel {
	all nb: NivelCombustivel | one nb.~nivelCombustivel
}


pred show[]{
	#Regiao = 4
}

run show for 4
