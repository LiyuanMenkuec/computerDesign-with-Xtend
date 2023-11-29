package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook 
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.ContainerMainboard

class PostCreateMainboard extends CincoPostCreateHook<ContainerMainboard>{
	
	override void postCreate (ContainerMainboard cmainboard){
		val sub = cmainboard.mainboardC as info.scce.cinco.fp.compdsl.componentDsl.Mainboard
		var numMemorySlots = sub.numMemorySlots
		var numPCIe16Slots = sub.numPCIe16Slots
		
		cmainboard.newContainerCPU(20,20).setName(sub.socket.toString)
		
		for (var i=0; i<numMemorySlots; i++){
			cmainboard.newContainerRAM(140,20+i*40).setName(sub.typeMemorySlots.toString)
		}
		
		for (var i=0; i<numPCIe16Slots; i++){
			cmainboard.newContainerGPU(20,190+i*40).setName(sub.chipset.toString)
		}
	}
}