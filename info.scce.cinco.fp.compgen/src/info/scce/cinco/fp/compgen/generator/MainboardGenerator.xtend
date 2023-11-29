package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.ProductService
import info.scce.cinco.fp.prodserv.descriptor.MainboardDescriptor
import java.util.ArrayList

class MainboardGenerator {
	
	ArrayList<MainboardDescriptor> mainboards
	
	def run() {
		mainboards = ProductService.mainboards
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	«FOR a:mainboards»
	mainboard "«a.name»" {
		name «a.name.split(" |-|!|/|\\.").map[toString].join()»
		chipset "«a.chipset»"
		numMemorySlots «a.numMemorySlots»
		typeMemorySlots «a.typeMemorySlots»
		numPCIe16Slots «a.numPCIe16Slots»
		numSataPorts «a.numSataPorts»
		powerConsumption «a.powerConsumption» W
		socket «a.socket»
		formFactor «a.formFactor»
		price «a.price» €
	}
	
	«ENDFOR»
	'''
}