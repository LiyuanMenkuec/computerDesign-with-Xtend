package info.scce.cinco.product.fp.pcconfig.compdsl.checks

import info.scce.cinco.fp.compdsl.componentDsl.Mainboard
import info.scce.cinco.product.fp.pcconfig.pc.mcam.modules.checks.PCCheck
import info.scce.cinco.product.fp.pcconfig.pc.pc.PC

//Die Anzahl der Laufwerke darf die Anzahl der Anschlüsse des Mainboards nicht übersteigen.
class AnzahlDerLaufwerkCheck extends PCCheck{
	override check(PC pc) {
		if(pc.getContainerCases.size != 0){
			
			val caseContainer = pc. getContainerCases.head
	
			val anzahlDrives = caseContainer.getContainerDrives.size
			
			if( caseContainer.getContainerMainboards.head.getMainboards.size !== 0){

				val mainboardc = caseContainer.getContainerMainboards.head.getMainboards.head.mainboard  
				
				val main = mainboardc.getContainerMainboards.head.mainboardC as Mainboard
						
				if(anzahlDrives>main.numSataPorts){
					caseContainer.addError("Die Anzahl der Laufwerke darf die Anzahl der Anschlüsse des Mainboards nicht übersteigen")
				}
			}
			
		}
    }
    
}