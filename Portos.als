module portos


abstract sig  Porto {
	navios: some Navio,
	nivelCombustivel: some NivelCombustivel
}

sig PortoNorte extends Porto{}
sig PortoSul extends Porto{}
sig PortoLeste extends Porto{}
sig PortoOeste extends Porto{}


abstract sig NivelCombustivel{
	nivel: one Nivel
}


sig NivelPetroleoBruto extends NivelCombustivel{}
sig NivelGasolina extends NivelCombustivel{}
sig NivelOleoDiesel extends NivelCombustivel{}

abstract sig Nivel{}

sig Alto extends Nivel{}
sig Medio extends Nivel{}
sig Baixo extends Nivel{}


sig Navio{}

fact Portos {
	one p: Porto | p in PortoNorte
	one p: Porto | p in PortoSul
	one p: Porto | p in PortoLeste
	one p: Porto | p in PortoOeste

	all p: Porto | some p.navios
	all p: Porto | #p.nivelCombustivel = 3

}


fact NivelCombustivel {
	one nb: NivelCombustivel | nb in NivelGasolina
	one nb: NivelCombustivel | nb in NivelPetroleoBruto
}

fact Nivel {
	all n: Nivel | some n.~nivel
}


pred show[]{
	#Porto = 4
	#Porto.nivelCombustivel = 3
}

run show for 4
