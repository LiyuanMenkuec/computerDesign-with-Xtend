package info.scce.cinco.product.fp.pcconfig.compdsl.checks

import info.scce.cinco.product.fp.pcconfig.pc.mcam.modules.checks.PCCheck
import info.scce.cinco.product.fp.pcconfig.pc.pc.PC

class DriveCheck extends PCCheck{
	override check(PC pc) {
		if(pc.getContainerCases.size != 0){
			val caseContainer = pc.getContainerCases.head
			if(caseContainer.getContainerDrives.head.getDrives.head === null){
				caseContainer.addError("Es muss mindestens ein Laufwerk verbaut werden.")
			}
		}
	}
}