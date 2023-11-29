package info.scce.cinco.product.fp.pcconfig.compdsl.checks

import info.scce.cinco.product.fp.pcconfig.mb.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mcam.modules.checks.MainboardCheck

//	Der Typ der RAM-Bausteine muss zum Slot-Typ des Mainboards passen.
class RAMBausteinecheck extends MainboardCheck {
	override check(Mainboard mainboard) {
		
		if(mainboard.getContainerMainboards.size != 0){
			val mainc = mainboard.getContainerMainboards.head
			if(mainc.getMainboardC !== null){
				val main = mainc.mainboardC as info.scce.cinco.fp.compdsl.componentDsl.Mainboard
				if(mainc.getContainerRAMs.head.getRAMs.head === null){
					mainc.addError("Es muss mindestens ein RAM verbaut werden.")
				}
			     mainc.getContainerRAMs.forEach[containerRAM|
			     	if(containerRAM.getRAMs.size != 0){
				        val ram = containerRAM.getRAMs.head.ram as info.scce.cinco.fp.compdsl.componentDsl.RAM
				        if(!ram.ramType.equals(main.typeMemorySlots)) {
				               containerRAM.addError("Der Typ der RAM-Bausteine muss zum Slot-Typ des Mainboards passen.")
				        } 
			        } 	
			     ]
			}
		}
     }
}