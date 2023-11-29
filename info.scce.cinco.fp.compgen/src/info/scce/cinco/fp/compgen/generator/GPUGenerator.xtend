package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.ProductService
import java.util.ArrayList
import info.scce.cinco.fp.prodserv.descriptor.GPUDescriptor

class GPUGenerator {
	
	ArrayList<GPUDescriptor> gpus
	
	def run() {
		gpus = ProductService.GPUs
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	«FOR a:gpus»
	gpu "«a.name»" {
		name «a.name.split(" |-|!|/|\\.").map[toString].join()»
		chip "«a.chip»"
		memory «a.memory»
		powerConsumption «a.powerConsumption» W
		price «a.price» €
	}
	
	«ENDFOR»
	'''
}