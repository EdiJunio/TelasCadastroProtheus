#include 'PROTHEUS.CH'
#include 'PARMTYPE.CH'
#include 'TOTVS.CH'
#include 'RWMAKE.CH'

#DEFINE CAMPOVAZIO "Preencha o campo vazio!"

///////////////////////////////
///     TELA GETDADOS      ///
/////////////////////////////++++++++++++++++++++++++++++++++++++++

User Function TSTZXX_GDA()

	Private oSay1  //Marca
	Private oSay2  //Modelo
	Private oSay3  //Versão
	Private oSay4  //Ano Fabricação
	Private oSay5  //Ano Modelo
	Private oSay6  //Carroceria
	Private oSay7  //Portas
	Private oSay8  //Cor
	Private oSay9  //Motor
	Private oSay10 //Disposição Motor
	Private oSay11 //Posição Motor
	Private oSay12 //Potência
	Private oSay13 //Cilindros
	Private oSay14 //Disposição Cilindros
	Private oSay15 //Válvulas
	Private oSay16 //Combustível
	Private oSay17 //Alimetação Motor
	Private oSay18 //Aspiração Motor
	Private oSay19 //Câmbio
	Private oSay20 //Marchas
	Private oSay21 //Tração
	Private oSay22 //Origem
	Private oMarca
	Private cMarca     := SPACE(15)
	Private oModelo
	Private cModelo    := SPACE(20)
	Private oVersao
	Private cVersao    := SPACE(20)
	Private oAnoFabric
	Private nAnoFabric := 0
	Private oAnoModelo
	Private nAnoModelo := 0
	Private oComboCarr
	Private aComboCarr := {"1-Hatch", "2-Sedan", "3-Pick-up", "4-Perua", "5-Coupé", "6-SUV", "7-Van", "8-Furgao", "9-Jipe", "10-Conversível"}
	Private oCarroceri
	Private cCarroceri := 0
	Private oPortas
	Private nPortas    := 0
	Private oCor
	Private cCor       := SPACE(20)
	Private oMotor
	Private cMotor     := SPACE(20)
	Private oComboDisM
	Private aComboDisM := {"1-Longitudinal", "2-Transversal"}
	Private oDispMotor
	Private cDispMotor := 0
	Private oComboPosM
	Private aComboPosM := {"1-Dianteiro", "2-Traseiro", "3-Central-traseiro"}
	Private oPosiMotor
	Private cPosiMotor := 0
	Private oPotencia
	Private nPotencia  := 0
	Private oCilindros
	Private nCilindros := 0
	Private oComboDisC
	Private aComboDisC := {"1-em linha", "2-em V", "3-VR", "4-em W", "5-Boxer"}
	Private oDispCilin
	Private cDispCilin := 0
	Private oComboValv
	Private aComboValv := {"1-8", "2-12", "3-16", "4-18", "5-20", "6-24"}
	Private oValvulas
	Private cValvulas  := 0
	Private oComboComb
	Private aComboComb := {"1-Gasolina", "2-Álcool", "3-Flex", "4-Diesel", "5-Híbrido"} //Atenção
	Private oCombustiv
	Private cCombustiv := 0
	Private oComboAlim
	Private aComboAlim := {"1-Injeção eletrônica", "2-Carburador"}
	Private oAlimentac
	Private cAlimentac := 0
	Private oComboAspi //
	Private aComboAspi := {"1-Natural", "2-Turbocompressor", "3-Surpercharger"}//
	Private oAspiracao //
	Private cAspiracao := 0 //
	Private oComboCamb
	Private aComboCamb := {"1-Manual", "2-Automático", "3-Automatizado", "4-CVT"}
	Private oCambio
	Private cCambio    := 0
	Private oMarchas
	Private nMarchas   := 0
	Private oComboTrac
	Private aComboTrac := {"1-Dianteira", "2-Traseira", "3-Integral"}
	Private oTracao
	Private cTracao    := 0
	Private oComboOrig
	Private aComboOrig := {"1-Nacional", "2-Importado"}
	Private oOrigem
	Private cOrigem    := 0
	Private oButtonCon 
	Private oButtonCan
	
	Private oDlg

	DEFINE MSDIALOG oDlg TITLE "INFORMAÇÕES DO VEÍCULO" FROM 000, 000 TO 500, 900 PIXEL

    	@ 010, 030 SAY oSay1 PROMPT "Marca:" SIZE 050, 007 OF oDlg PIXEL
    	@ 010, 175 SAY oSay2 PROMPT "Modelo:" SIZE 050, 007 OF oDlg PIXEL
    	@ 010, 320 SAY oSay3 PROMPT "Versão:" SIZE 050, 007 OF oDlg PIXEL
    	@ 030, 030 SAY oSay4 PROMPT "Ano Fabricação:" SIZE 050, 007 OF oDlg PIXEL
    	@ 030, 165 SAY oSay5 PROMPT "Ano Modelo:" SIZE 050, 007 OF oDlg PIXEL
    	@ 050, 030 SAY oSay6 PROMPT "Carroceria:" SIZE 050, 007 OF oDlg PIXEL
    	@ 050, 175 SAY oSay7 PROMPT "Portas:" SIZE 050, 007 OF oDlg PIXEL
    	@ 050, 330 SAY oSay8 PROMPT "Cor:" SIZE 050, 007 OF oDlg PIXEL
    	@ 070, 030 SAY oSay9 PROMPT "Motor:" SIZE 050, 007 OF oDlg PIXEL
    	@ 070, 150 SAY oSay10 PROMPT "Disposição Motor:" SIZE 050, 007 OF oDlg PIXEL
    	@ 070, 305 SAY oSay11 PROMPT "Posição Motor:" SIZE 050, 007 OF oDlg PIXEL
    	@ 090, 030 SAY oSay12 PROMPT "Potência:" SIZE 050, 007 OF oDlg PIXEL
    	@ 090, 170 SAY oSay13 PROMPT "Cilindros:" SIZE 050, 007 OF oDlg PIXEL
    	@ 090, 290 SAY oSay14 PROMPT "Disposição Cilindros:" SIZE 050, 007 OF oDlg PIXEL
    	@ 110, 030 SAY oSay15 PROMPT "Válvulas:" SIZE 050, 007 OF oDlg PIXEL
    	@ 110, 160 SAY oSay16 PROMPT "Combustítvel:" SIZE 050, 007 OF oDlg PIXEL
    	@ 110, 307 SAY oSay17 PROMPT "Alimentação:" SIZE 050, 007 OF oDlg PIXEL
    	@ 130, 030 SAY oSay18 PROMPT "Aspiração:" SIZE 050, 007 OF oDlg PIXEL
    	@ 130, 170 SAY oSay19 PROMPT "Câmbio:" SIZE 050, 007 OF oDlg PIXEL
    	@ 130, 320 SAY oSay20 PROMPT "Marchas:" SIZE 050, 007 OF oDlg PIXEL
    	@ 150, 030 SAY oSay21 PROMPT "Tração:" SIZE 050, 007 OF oDlg PIXEL
    	@ 150, 170 SAY oSay22 PROMPT "Origem:" SIZE 050, 007 OF oDlg PIXEL

    	@ 010, 060 MSGET oMarca VAR cMarca SIZE 070, 010 PICTURE "@A " VALID OF oDlg  PIXEL
    	@ 010, 205 MSGET oModelo VAR cModelo SIZE 070, 010 OF oDlg PIXEL
    	@ 010, 350 MSGET oVersao VAR cVersao SIZE 070, 010 OF oDlg PIXEL
    	@ 030, 077 MSGET oAnoFabric VAR nAnoFabric SIZE 070, 010 PICTURE "@E 9999" OF oDlg PIXEL
    	@ 030, 205 MSGET oAnoModelo VAR nAnoModelo SIZE 070, 010 PICTURE "@E 9999" OF oDlg PIXEL
    	@ 050, 065 MSCOMBOBOX oCarroceri VAR cCarroceri ITEMS aComboCarr SIZE 070, 010 OF oDlg PIXEL
    	@ 050, 205 MSGET oPortas VAR nPortas SIZE 070, 010 PICTURE "@E 9" OF oDlg PIXEL
    	@ 050, 350 MSGET oCor VAR cCor SIZE 070, 010 OF oDlg PIXEL
    	@ 070, 060 MSGET oMotor VAR cMotor SIZE 070, 010 OF oDlg PIXEL
    	@ 070, 205 MSCOMBOBOX oDispMotor VAR cDispMotor ITEMS aComboDisM SIZE 070, 010 OF oDlg PIXEL
    	@ 070, 350 MSCOMBOBOX oPosiMotor VAR cPosiMotor ITEMS aComboPosM SIZE 070, 010 OF oDlg PIXEL
    	@ 090, 060 MSGET oPotencia VAR nPotencia SIZE 070, 010 PICTURE "@E 999" OF oDlg PIXEL
    	@ 090, 205 MSGET oCilindros VAR nCilindros SIZE 070, 010 PICTURE "@E 99" OF oDlg PIXEL
    	@ 090, 350 MSCOMBOBOX oDispCilin VAR cDispCilin ITEMS aComboDisC SIZE 070, 010 OF oDlg PIXEL
    	@ 110, 060 MSCOMBOBOX oValvulas VAR cValvulas ITEMS aComboValv SIZE 070, 010 OF oDlg PIXEL
    	@ 110, 205 MSCOMBOBOX oCombustiv VAR cCombustiv ITEMS aComboComb SIZE 070, 010 OF oDlg PIXEL
    	@ 110, 350 MSCOMBOBOX oAlimentac VAR cAlimentac ITEMS aComboAlim SIZE 070, 010 OF oDlg PIXEL
    	@ 130, 060 MSCOMBOBOX oAspiracao VAR cAspiracao ITEMS aComboAspi SIZE 070, 010 OF oDlg PIXEL //
    	@ 130, 205 MSCOMBOBOX oCambio VAR cCambio ITEMS aComboCamb SIZE 070, 010 OF oDlg PIXEL
    	@ 130, 350 MSGET oMarchas VAR nMarchas SIZE 070, 010 PICTURE "@E 9" OF oDlg PIXEL
    	@ 150, 060 MSCOMBOBOX oTracao VAR cTracao ITEMS aComboTrac SIZE 070, 010 OF oDlg PIXEL
    	@ 150, 205 MSCOMBOBOX oOrigem VAR cOrigem ITEMS aComboOrig SIZE 070, 010 OF oDlg PIXEL
    
		@ 190, 140 BUTTON oButtonCon PROMPT "Confirmar" SIZE 037, 012 ACTION(/*TesteAX(), VldCampoVazio(),*/ incDados(cMarca, cModelo, cVersao, nAnoFabric,;
		 																	nAnoModelo, cCarroceri, nPortas, cCor, cMotor, cDispMotor, cPosiMotor, nPotencia,;
		 																	nCilindros, cDispCilin, cValvulas, cCombustiv, cAlimentac, cAspiracao, cCambio,;
		 																	nMarchas, cTracao, cOrigem), oDlg:Refresh() /*, __Quit()*/) OF oDlg PIXEL
    	@ 190, 270 BUTTON oButtonCan PROMPT "Cancelar" SIZE 037, 012 ACTION(__Quit()) OF oDlg PIXEL

	ACTIVATE MSDIALOG oDlg CENTERED
		
Return

//---------------------------------------------------------------

Static Function VldCampoVazio()
	
	If Empty(cMarca)
		Alert(CAMPOVAZIO)
		
		ElseIf Empty(cModelo)
			Alert(CAMPOVAZIO)
			
		ElseIf Empty(cVersao)
			Alert(CAMPOVAZIO)
			
		ElseIf Empty(nAnoFabric)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(nAnoModelo)
			Alert(CAMPOVAZIO)
					
		ElseIf Empty(cCarroceri)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(nPortas)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cCor)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cMotor)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cDispMotor)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cPosiMotor)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(nPotencia)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(nCilindros)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cDispCilin)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cValvulas)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cCombustiv)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cAlimentac)
			Alert(CAMPOVAZIO)
			
		ElseIf Empty(cAspiracao)
			Alert(CAMPOVAZIO)
			
		ElseIf Empty(cCambio)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(nMarchas)
			Alert(CAMPOVAZIO)
		
		ElseIf Empty(cTracao)
			Alert(CAMPOVAZIO)
			
		ElseIf Empty(cOrigem)
			Alert(CAMPOVAZIO)
		
	Else
		Alert("10/10")
		oDlg:End()
	End If
	
Return

//---------------------------------------------------------------


Static Function incDados(cMarca, cModelo, cVersao, nAnoFabric, nAnoModelo, cCarroceri, nPortas, cCor, cMotor, cDispMotor, cPosiMotor, nPotencia, nCilindros,;
						 cDispCilin, cValvulas, cCombustiv, cAlimentac, cAspiracao, cCambio, nMarchas, cTracao, cOrigem)
	
	Local lRet := .T.
	
	dbSelectArea("ZXX")

	RECLOCK("ZXX", .T.)
	
		ZXX->ZXX_FILIAL := xFilial("ZXX")
		ZXX->ZXX_CODIGO := getSxeNum("ZXX", "ZXX_CODIGO")
		ZXX->ZXX_MARCA  := cMarca
		ZXX->ZXX_MODELO := cModelo
		ZXX->ZXX_VERSAO := cVersao
		ZXX->ZXX_ANOFAB := nAnoFabric
		ZXX->ZXX_ANOMOD := nAnoModelo
		ZXX->ZXX_CARROC := LEFT(cCarroceri, 1)
		ZXX->ZXX_PORTAS := nPortas
		ZXX->ZXX_COR    := cCor
		ZXX->ZXX_MOTOR  := cMotor
		ZXX->ZXX_DISMOT := LEFT(cDispMotor, 1)
		ZXX->ZXX_POSMOT := LEFT(cPosiMotor, 1)
		ZXX->ZXX_POTENC := nPotencia
		ZXX->ZXX_CILIND := nCilindros
		ZXX->ZXX_DISCIL := LEFT(cDispCilin, 1)
		ZXX->ZXX_VALVUL := LEFT(cValvulas, 1)
		ZXX->ZXX_COMBUS := LEFT(cCombustiv, 1)
		ZXX->ZXX_ALIMOT := LEFT(cAlimentac, 1)
		ZXX->ZXX_ASPMOT := LEFT(cAspiracao, 1)
		ZXX->ZXX_CAMBIO := LEFT(cCambio, 1)
		ZXX->ZXX_MARCHA := nMarchas
		ZXX->ZXX_TRACAO := LEFT(cTracao, 1)
		ZXX->ZXX_ORIGEM := LEFT(cOrigem, 1)
	
	MSUNLOCK("ZXX")
		
		MsgInfo("~FICHA TÉCNICA DO VEÍCULO~" + CRLF + CRLF +;
		"~Veículo: " + ALLTRIM(cMarca) + " " + ALLTRIM(cModelo) + " " + ALLTRIM(cVersao) + "; ano " + RIGHT(cValToChar(nAnoFabric), 2) +;
		"/" + RIGHT(cValToChar(nAnoModelo), 2) + CRLF +;
		"~Carroceria: " + SubStr(ALLTRIM(cCarroceri), 3) + "; " + cValToChar(nPortas) + " portas; cor " + ALLTRIM(cCor) + CRLF +;
		"~Motorização: " + ALLTRIM(cMotor)+ ", " + SubStr(ALLTRIM(cDispMotor), 3) + ", " + SubStr(ALLTRIM(cPosiMotor), 3) + "; " + cValToChar(nPotencia) +;
		" cv; " + cValToChar(nCilindros) + " cilindros " + SubStr(ALLTRIM(cDispCilin), 3) + "; " + SubStr(ALLTRIM(cValvulas), 3) + "v; " +;
		 SubStr(ALLTRIM(cCombustiv), 3) + "; " + SubStr(ALLTRIM(cAlimentac), 3) + "; " + SubStr(ALLTRIM(cAspiracao), 3) + CRLF +;
		"~Transmissão: Câmbio " + SubStr(ALLTRIM(cCambio), 3) + "; " + cValToChar(nMarchas) + " marchas; tração " + SubStr(ALLTRIM(cTracao), 3) + CRLF +;
		"~Origem: " + SubStr(ALLTRIM(cOrigem), 3))
	
Return lRet