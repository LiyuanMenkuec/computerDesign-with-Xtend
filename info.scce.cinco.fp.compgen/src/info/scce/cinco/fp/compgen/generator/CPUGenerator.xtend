package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.descriptor.CPUDescriptor
import info.scce.cinco.fp.prodserv.ProductService
import java.util.ArrayList

class CPUGenerator {
	
	ArrayList<CPUDescriptor> cpus
	
	def run() {
		cpus = ProductService.CPUs
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	«FOR a:cpus»
	cpu "«a.name»" {
		name «a.name.split(" |-|!|/|\\.").map[toString].join()»
		type "«a.type»"
		powerConsumption «a.powerConsumption» W
		socket «a.socket»
		price «a.price» €
	}
	
	«ENDFOR»
	'''
}