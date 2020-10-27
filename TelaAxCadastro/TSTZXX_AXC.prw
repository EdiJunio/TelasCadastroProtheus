#Include 'PROTHEUS.CH'
#Include 'TOTVS.CH'
#Include 'RWMAKE.CH'

///////////////////////////////
///    TELA AXCADASTRO     ///
/////////////////////////////++++++++++++++++++++++++++++++++++++++

User Function TSTZXX_AXC()
	
	dbSelectArea("ZXX")
	dbSetOrder(1)
	
	axCadastro("ZXX", "Cadastro de Veículos")
	
Return