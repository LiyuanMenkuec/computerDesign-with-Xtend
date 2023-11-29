package info.scce.cinco.product.fp.pcconfig.compdsl.checks

import info.scce.cinco.product.fp.pcconfig.mb.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mcam.modules.checks.MainboardCheck

//	Der Socket-Typ einer CPU muss zum Socket-Typ des Mainboards passen
class SocketTypCheck extends MainboardCheck{
	override check(Mainboard mainboard) {
		
		if(mainboard.getContainerMainboards.size != 0){
			val mainc = mainboard.getContainerMainboards.head
			if(mainc.getMainboardC !== null){
				val main = mainc.mainboardC as info.scce.cinco.fp.compdsl.componentDsl.Mainboard
			
				mainc.getContainerCPUs.forEach[containerCPU|
					if (containerCPU.getCPUs.size != 0){
						val cpu = containerCPU.getCPUs.head.cpu as info.scce.cinco.fp.compdsl.componentDsl.CPU
						if (!cpu.socket.equals(main.socket)){
							containerCPU.addError("Der Socket-Typ einer CPU muss zum Socket-Typ des Mainboards passen")
						}
					}
				]
			}
		}
	}
}


