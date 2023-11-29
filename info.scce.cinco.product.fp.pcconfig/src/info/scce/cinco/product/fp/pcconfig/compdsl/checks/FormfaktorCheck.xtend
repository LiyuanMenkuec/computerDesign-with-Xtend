package info.scce.cinco.product.fp.pcconfig.compdsl.checks

import info.scce.cinco.product.fp.pcconfig.pc.mcam.modules.checks.PCCheck
import info.scce.cinco.product.fp.pcconfig.pc.pc.PC

//Die Größe des Gehäuses muss zum Formfaktor des Mainboards passen.
class FormfaktorCheck extends PCCheck{
	
	override check(PC pc) {
		if(pc.getContainerCases.size != 0){
			val  caseContainer = pc.getContainerCases.head
			val casec = caseContainer.caseC as info.scce.cinco.fp.compdsl.componentDsl.Case
			
			if(caseContainer.getContainerMainboards.head.getMainboards.head !== null){

				var mainboardc = caseContainer.getContainerMainboards.head.getMainboards.head.getMainboard 

				val main = mainboardc.getContainerMainboards.head.mainboardC as info.scce.cinco.fp.compdsl.componentDsl.Mainboard
		
				if (!casec.formFactor.equals(main.formFactor)){
					caseContainer.addError("Die Größe des Gehäuses muss zum Formfaktor des Mainboards passen")
				}
			}
		}
    }
}