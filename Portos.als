module portos

abstract sig Regiao {
	portos: some Porto
}


sig Norte extends Regiao{}

sig Sul extends Regiao{}

sig Leste extends Regiao{}

sig Oeste extends Regiao{}

sig Porto {
	navio: set Navio,
	nivel: set Nivel
}

sig Navio {
	combustivel: one Combustivel
}

abstract sig Nivel {
}

sig Alto extends Nivel{}

sig Baixo extends Nivel{}

sig Medio extends Nivel{}

abstract sig Combustivel{}

sig Gasolina extends Combustivel{}

sig PetroleoBruto extends Combustivel{}

sig OleoDiesel extends Combustivel{}


fact Regiao {
	one reg:Regiao |  reg in Norte
	one reg: Regiao | reg in Sul
	one reg: Regiao | reg in Oeste
	one reg: Regiao | reg in Leste
	all regiao: Regiao | #regiao.portos = 1
}

fact Navio {
}


fact Portos {
	all porto: Porto | one porto.~portos
	all porto: Porto | #porto.nivel = 1
	all porto: Porto | #porto.navio > 0

}

fact Nivel {
	all niv: Nivel | one niv.~nivel
}

fact Combustivel {
	one combustivel: Combustivel | combustivel in Gasolina
	one combustivel: Combustivel | combustivel in PetroleoBruto
	one combustivel: Combustivel | combustivel in OleoDiesel
	all comb: Combustivel | one comb.~combustivel
}


pred show[]{
}

run show for 4
