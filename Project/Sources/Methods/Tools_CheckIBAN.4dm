﻿//%attributes = {"shared":true}  // check IBAN number if valid (true/false)  // $valid := Tools_CheckIBAN(iban)C_TEXT:C284($1;$Iban)C_BOOLEAN:C305($0;$ergebnis)$ergebnis:=False:C215$iban:=Replace string:C233($1;" ";"")If (Length:C16($iban)<16)  // AT=20, DE=22, kürzerste Belgien mit 16	$ergebnis:=False:C215Else 	$iban1:=Substring:C12($Iban;5)+\		String:C10(Character code:C91($Iban[[1]])-55)+\		String:C10(Character code:C91($Iban[[2]])-55)+Substring:C12($Iban;3;2)		$rest:=0	For ($pos;1;Length:C16($iban1);7)		$part:=String:C10($rest)+Substring:C12($iban1;$pos;7)		$rest:=Num:C11($part)%97	End for 	$pz:=String:C10(98-$rest)	If ($rest=1)		$ergebnis:=True:C214	Else 		$ergebnis:=False:C215	End if End if $0:=$ergebnis