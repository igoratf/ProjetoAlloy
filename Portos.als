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

abstract sig Nivel{}

sig Alto extends Nivel{}

sig Baixo extends Nivel{}

sig Medio extends Nivel{}

abstract sig Combustivel{}

sig Gasolina extends Combustivel{}

sig PetroleoBruto extends Combustivel{}

sig OleoDiesel extends Combustivel{}


fact Portos {

	all porto: Porto | porto in (Regiao.portos)

}


pred show[]{
}

run show for 4
