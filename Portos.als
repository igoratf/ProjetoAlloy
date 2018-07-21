module portos

abstract sig Regiao {
	portos: some Porto
}


sig Norte extends Regiao{}

sig Sul extends Regiao{}

sig Leste extends Regiao{}

sig Oeste extends Regiao{}

sig Porto {
	nivel: Nivel
}

abstract sig Nivel{}

sig Alto extends Nivel{}

sig Baixo extends Nivel{}

sig Medio extends Nivel{}


fact Portos {

	all porto: Porto | porto in (Regiao.portos)

}


pred show[] {

}

run show for 4
