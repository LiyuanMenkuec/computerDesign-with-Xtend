package info.scce.cinco.product.fp.pcconfig.compdsl.generator

import de.jabc.cinco.meta.core.utils.EclipseFileUtils
import de.jabc.cinco.meta.runtime.CincoRuntimeBaseClass
import info.scce.cinco.product.fp.pcconfig.pc.pc.Drive
import info.scce.cinco.product.fp.pcconfig.pc.pc.PC
import info.scce.cinco.product.fp.pcconfig.pc.pc.PSU
import org.eclipse.core.runtime.IPath
import org.eclipse.core.runtime.IProgressMonitor
import de.jabc.cinco.meta.plugin.generator.runtime.IGenerator
import info.scce.cinco.product.fp.pcconfig.pc.pc.ContainerDrive
import java.util.ArrayList
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.Mainboard
import org.eclipse.emf.ecore.EObject
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.RAM
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.ContainerRAM
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.GPU
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.ContainerGPU
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.CPU
import info.scce.cinco.product.fp.pcconfig.pc.pc.ContainerCase

class Generator extends CincoRuntimeBaseClass implements IGenerator<PC> {

  String fileName

  override generate(PC model, IPath path, IProgressMonitor monitor) {
    val fullFileName = model.file.name
    fileName = fullFileName.substring(0, fullFileName.lastIndexOf('.'))
    val targetFile = workspaceRoot.getFileForLocation(path.append(fileName + ".html"))
    EclipseFileUtils.writeToFile(targetFile, template(model))
  }

  def template(PC model) '''
    <html>
      <head>
      	<meta charset="utf-8"/>
      	<style>
      	    table {
      	        width:500;
      	     }
      	     td {
      	         border:1px solid;
      	         overflow:hidden;
      	         vertical-align:top;
      	     }  
      	</style>
      </head>
      <title>Overview «fileName»</title>
      <body>
        <h1>Overview</h1>
        	<table>
        	«IF (model.getContainerCases.head !==null)»
        	<tr>
        	    <td>(Case)«model.getContainerCases.head.getReferencedCase.displayName»</td>
        	    <td>«model.getContainerCases.head.getReferencedCase.price»</td>
        	</tr>
            «FOR drive : getDrivesOfPC(model)»
            	<tr>
            	    <td>(Drive)«drive.referencedDrive.displayName»</td>
            	    <td>«drive.referencedDrive.price»</td>
            	</tr>
            «ENDFOR»
                «IF (model.getContainerCases.head.getContainerPSUs.head.getPSUs.head !==null)»
                <tr>
                    <td>(PSU)«model.getContainerCases.head.getContainerPSUs.head.getPSUs.head.referencedPSU.displayName»</td>
                    <td>«model.getContainerCases.head.getContainerPSUs.head.getPSUs.head.referencedPSU.price»</td>
                </tr>
                «ENDIF»
                «IF (model.getContainerCases.head.getContainerMainboards.head.getMainboards.head !==null && model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head !== null)»
                <tr>
                    <td>(Mainboard)«model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getMainboardC.getReferencedMainboard.displayName»</td>
                    <td>«model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getMainboardC.getReferencedMainboard.price»</td>
                </tr>
            «FOR ram : getRAMsOfMainboard(model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard)»
                <tr>
                     <td>(RAM)«ram.referencedRAM.displayName»</td>
                     <td>«ram.referencedRAM.price»</td>
                </tr>
            «ENDFOR»
            «FOR gpu : getGPUsOfMainboard(model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard)»
                <tr>
                     <td>(GPU)«gpu.referencedGPU.displayName»</td>
                     <td>«gpu.referencedGPU.price»</td>
                </tr>
             «ENDFOR»  
             «IF (model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getContainerCPUs.head.CPUs.head !==null)»  
                <tr>
                   <td>(CPU)«model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getContainerCPUs.head.CPUs.head.getReferencedCPU.displayName»</td>
                   <td>«model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getContainerCPUs.head.CPUs.head.getReferencedCPU.price»</td>
                </tr>
                «ENDIF»
                «ENDIF»
                «ENDIF»
                <tr>
                    <td>Total</td>
                    <td>«sum(model)»</td>
                </tr>
                
           </table>
           
           

      </body>
    </html>
'''

def getDrivesOfPC(PC pc) {
	var list=new ArrayList<Drive>
    for(ContainerDrive cd: pc.getContainerCases.head.getContainerDrives)
    {
    	if(cd.getDrives.head !== null)
    		list.add(cd.getDrives.head)
    }
    return list
}

def getRAMsOfMainboard(Mainboard main) {
	var list=new ArrayList<RAM>
    for(ContainerRAM cr: main.getContainerMainboards.head.getContainerRAMs)
    {
    	if(cr.RAMs.head !== null)
    		list.add(cr.RAMs.head)
    }
    return list
}

def getGPUsOfMainboard(Mainboard main) {
	var list=new ArrayList<GPU>
    for(ContainerGPU cg: main.getContainerMainboards.head.getContainerGPUs)
    {
    	if(cg.GPUs.head !== null)
    		list.add(cg.GPUs.head)
    }
    return list
    
}

def getReferencedCase(ContainerCase caseNode){
	caseNode.caseC as info.scce.cinco.fp.compdsl.componentDsl.Case
}

def getReferencedDrive(Drive driveNode) {
    driveNode.drive as info.scce.cinco.fp.compdsl.componentDsl.Drive
}

def getReferencedPSU(PSU PSUNode) {
    PSUNode.psu as info.scce.cinco.fp.compdsl.componentDsl.PSU
}

def getReferencedMainboard(EObject mainboardNode) {
    mainboardNode as info.scce.cinco.fp.compdsl.componentDsl.Mainboard
}

def getReferencedRAM(RAM ramNode) {
    ramNode.ram as info.scce.cinco.fp.compdsl.componentDsl.RAM
}

def getReferencedGPU(GPU gpuNode) {
    gpuNode.gpu as info.scce.cinco.fp.compdsl.componentDsl.GPU
}

def getReferencedCPU(CPU cpuNode) {
    cpuNode.cpu as info.scce.cinco.fp.compdsl.componentDsl.CPU
}

def sum(PC model) {
	var sum=0.0
	var priceOfCase="0 €"
	var priceOfPSU="0 €"
	var priceOfMainboard="0 €"
	var priceOfCPU="0 €"
	
	if (model.getContainerCases.head !== null){
		priceOfCase=model.getContainerCases.head.getReferencedCase.price
		if(model.getContainerCases.head.getContainerPSUs.head.getPSUs.head !== null){
			priceOfPSU=model.getContainerCases.head.getContainerPSUs.head.getPSUs.head.referencedPSU.price
		}
		for(Drive drive: getDrivesOfPC(model))
		{
			sum=sum+Double.parseDouble(drive.referencedDrive.price.substring(0, drive.referencedDrive.price.length-2))
		}
		
		if(model.getContainerCases.head.getContainerMainboards.head.getMainboards.head !== null && model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head !== null){
			priceOfMainboard=model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getMainboardC.getReferencedMainboard.price
			if(model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getContainerCPUs.head.CPUs.head !== null){
				priceOfCPU=model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard.getContainerMainboards.head.getContainerCPUs.head.CPUs.head.getReferencedCPU.price
			}
			for(RAM ram: getRAMsOfMainboard(model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard))
			{
				sum=sum+Double.parseDouble(ram.referencedRAM.price.substring(0, ram.referencedRAM.price.length-2))
			}
			
			for(GPU gpu: getGPUsOfMainboard(model.getContainerCases.head.getContainerMainboards.head.getMainboards.head.mainboard))
			{
				sum=sum+Double.parseDouble(gpu.referencedGPU.price.substring(0, gpu.referencedGPU.price.length-2))
			}
		}
		sum=sum+Double.parseDouble(priceOfCase.substring(0, priceOfCase.length-2))
		sum=sum+Double.parseDouble(priceOfPSU.substring(0, priceOfPSU.length-2))
		sum=sum+Double.parseDouble(priceOfMainboard.substring(0, priceOfMainboard.length-2))
		sum=sum+Double.parseDouble(priceOfCPU.substring(0, priceOfCPU.length-2))
	}
	
	return sum
	
	
}

}




