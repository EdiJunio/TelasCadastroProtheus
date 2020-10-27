#Include 'PROTHEUS.CH'
#Include 'TOTVS.CH'
#Include 'FWMVCDef.CH'

///////////////////////////////
///        TELA MVC        ///
/////////////////////////////++++++++++++++++++++++++++++++++++++++

//----------FUNCAO PRINCIPAL------------------------------------------------+

User Function TSTZXX_MVC()
	
	Local oBrowse

	oBrowse := FWMBrowse():New()
	
	oBrowse:SetAlias('ZXX')
	oBrowse:SetDescription('Cadastro de Veículos')
	oBrowse:Activate()
	
Return

//----------MENUDEF---------------------------------------------------------+

Static Function MenuDef()

	Local aRotina := {}
	ADD OPTION aRotina TITLE "Pesquisar"  ACTION 'PesqBrw'	  		  OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.TSTZXX_MVC" OPERATION 2 ACCESS 0
	ADD OPTION aRotina TITLE "Incluir"	  ACTION "VIEWDEF.TSTZXX_MVC" OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar"	  ACTION "VIEWDEF.TSTZXX_MVC" OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir"	  ACTION "VIEWDEF.TSTZXX_MVC" OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE "Imprimir"   ACTION "VIEWDEF.TSTZXX_MVC" OPERATION 8 ACCESS 0
	ADD OPTION aRotina TITLE "Copiar"	  ACTION "VIEWDEF.TSTZXX_MVC" OPERATION 9 ACCESS 0

Return aRotina //FWMVCMenu("nome_do_fonte")

//----------MODELDEF--------------------------------------------------------+

Static Function ModelDef() //pag 16, 5.4S

	Local oStruZXX := FWFormStruct(1, 'ZXX') //estrutura tipo 'modelo'(1), tabela ZXX
	Local oModel

	oModel := MPFormModel():New('ID_TSTZXX') //'ID_TSTZXX' é o ID dado ao modelo
	
	oModel:AddFields('ZXXMASTER', /*cOwner*/, oStruZXX) //'ZXXMASTER' é o ID dado ao componente de formulário do modelo
	oModel:SetPrimaryKey({"ZXX_FILIAL", "ZXX_CODIGO"})
	oModel:SetDescription('Modelo de dados de Veiculos')
	oModel:GetModel('ZXXMASTER'):SetDescription('Dados de Veiculos')
	
Return oModel

//----------VIEWDEF---------------------------------------------------------+

Static Function ViewDef() //pag 19

	Local oModel := FWLoadModel('TSTZXX_MVC') //fonte onde se encontra o modelo de dados
	Local oStruZXX := FWFormStruct(2, 'ZXX') //estrutura tipo 'interface'(2), tabela ZXX
	Local oView
	
	oView := FWFormView():New()
	
	oView:SetModel(oModel)
	oView:AddField('VIEW_ZXX', oStruZXX, 'ZXXMASTER') //'VIEW_ZXX' é o ID do componente da interface view
	oView:CreateHorizontalBox('TELA', 100) //'TELA' é o ID do componente box
	oView:SetOwnerView('VIEW_ZXX', 'TELA') //relacionamento para exibir o componente 'VIEW_ZXX' utilizando o box 'TELA'

Return oView

//pag 21