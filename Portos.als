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
	nivel: Nivel
}

sig Navio {
	combustivel: one Combustivel
}

abstract sig Nivel{
	combustivel: one Gasolina
			
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

	one reg:Regiao |  reg in Oeste

	one reg:Regiao |  reg in Sul

	one reg:Regiao |  reg in Leste

}

fact Nivel{

	all niv:Nivel | one nivel.niv

}

fact Portos {

	all porto: Porto | porto in (Regiao.portos)

	all port:Porto | #(port.nivel) = 1

	all porto: Porto | one portos.porto

	all p:Porto |  one portos.p

}


pred show[]{
	#Regiao = 4
}

run show for 4
