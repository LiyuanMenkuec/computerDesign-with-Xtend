package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.pc.ContainerCase

class PostCreatePC extends CincoPostCreateHook<ContainerCase> {
	override void postCreate (ContainerCase containerCase){
		val sub = containerCase.caseC as info.scce.cinco.fp.compdsl.componentDsl.Case
		var internalSlots = sub.internalSlots
		var externalSlots = sub.externalSlots
		
		containerCase.newContainerMainboard(20,20).setName("Mainboard")
		containerCase.newContainerPSU(20,220).setName("PSU")
		
		for (var i=0; i<internalSlots; i++){
			containerCase.newContainerDrive(400,20+50*i).setName("HardDrive")
		}
		
		for (var i=0; i<externalSlots; i++){
			containerCase.newContainerDrive(180,20+50*i).setName("OpticalDrive")
		}
	}
}