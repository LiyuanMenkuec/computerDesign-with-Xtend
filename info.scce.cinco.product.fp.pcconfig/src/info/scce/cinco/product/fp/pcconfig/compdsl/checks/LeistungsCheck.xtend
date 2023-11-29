package info.scce.cinco.product.fp.pcconfig.compdsl.checks

import info.scce.cinco.fp.compdsl.componentDsl.CPU
import info.scce.cinco.fp.compdsl.componentDsl.Drive
import info.scce.cinco.fp.compdsl.componentDsl.GPU
import info.scce.cinco.fp.compdsl.componentDsl.Mainboard
import info.scce.cinco.fp.compdsl.componentDsl.PSU
import info.scce.cinco.fp.compdsl.componentDsl.RAM
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.ContainerGPU
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.ContainerRAM
import info.scce.cinco.product.fp.pcconfig.pc.mcam.modules.checks.PCCheck
import info.scce.cinco.product.fp.pcconfig.pc.pc.ContainerDrive
import info.scce.cinco.product.fp.pcconfig.pc.pc.PC
import org.eclipse.emf.ecore.EObject

//Die Leistung des Netzteils muss die benötigte Gesamtleistung der Komponenten übersteigen (inklusive 25% Puffer).
class LeistungsCheck extends PCCheck{
	override check(PC pc) {
		if(pc.getContainerCases.size != 0){
			val  caseContainer = pc.getContainerCases.head
			
			
			
			
			if(caseContainer.getContainerMainboards.head.getMainboards.head !== null && caseContainer.getContainerPSUs.head !==null && caseContainer.getContainerDrives.head !==null){
				if (caseContainer.getContainerMainboards.head.getMainboards.head !== null && caseContainer.getContainerPSUs.head.getPSUs.head !==  null){
					val mainboardc = caseContainer.getContainerMainboards.head.getMainboards.head.mainboard
					val psu = caseContainer.getContainerPSUs.head.getPSUs.head.getPsu as PSU
					val main = mainboardc.getContainerMainboards.head.mainboardC as Mainboard
					val cpu = mainboardc.getContainerMainboards.head.getContainerCPUs.head.CPUs.head.getCpu as CPU
					
					//calculate Power
					var power=Integer.parseInt(main.power.replaceAll("[^0-9]", ""))+Integer.parseInt(cpu.power.replaceAll("[^0-9]", ""))
					for(ContainerGPU containerGPU: mainboardc.getContainerMainboards.head.getContainerGPUs){
						if(containerGPU.GPUs.size !==0){
							power=power+Integer.parseInt(convertGPU(containerGPU.GPUs.head.getGpu).power.replaceAll("[^0-9]", ""))
						}
						
					}
					
					for(ContainerRAM containerRAM: mainboardc.getContainerMainboards.head.getContainerRAMs){
						if(containerRAM.RAMs.size !==0){
							power=power+Integer.parseInt(convertRAM(containerRAM.RAMs.head.getRam).power.replaceAll("[^0-9]", ""))
						}
					}
						
					for(ContainerDrive containerDrive: caseContainer.getContainerDrives){
						if(containerDrive.getDrives.size !==0){
							power=power+Integer.parseInt(convertDrive(containerDrive.getDrives.head.getDrive).power.replaceAll("[^0-9]", ""))
						}
					}
			        
			     
			        //comparation
					if (1.25*power>Integer.parseInt(psu.power.replaceAll("[^0-9]", ""))){
						caseContainer.addError("Die Leistung des Netzteils muss die benötigte Gesamtleistung der Komponenten übersteigen (inklusive 25% Puffer)")
					}
				}
			}
		}
    }
    
    def GPU convertGPU(EObject gpu){
    	val copy=gpu as GPU
    	return copy
    }
    
    def RAM convertRAM(EObject ram){
    	val copy=ram as RAM
    	return copy
    }
    
    def Drive convertDrive(EObject drive){
    	val copy=drive as Drive
    	return copy
    }
    
}