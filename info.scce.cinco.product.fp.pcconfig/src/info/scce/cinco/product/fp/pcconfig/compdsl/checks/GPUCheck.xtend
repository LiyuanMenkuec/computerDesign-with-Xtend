package info.scce.cinco.product.fp.pcconfig.compdsl.checks

import info.scce.cinco.product.fp.pcconfig.mb.mainboard.Mainboard
import info.scce.cinco.product.fp.pcconfig.mb.mcam.modules.checks.MainboardCheck

class GPUCheck extends MainboardCheck {
	override check(Mainboard mainboard) {
		if(mainboard.getContainerMainboards.size != 0){
			val mainc = mainboard.getContainerMainboards.head
			if(mainc.getMainboardC !== null){
				if(mainc.getContainerGPUs.head.getGPUs.head === null){
					mainc.addError("Es muss mindestens eine GPU verbaut werden.")
				}
			}
		}
	}
}