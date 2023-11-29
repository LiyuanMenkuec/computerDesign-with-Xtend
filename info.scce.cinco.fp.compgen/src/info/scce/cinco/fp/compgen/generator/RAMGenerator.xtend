package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.ProductService
import info.scce.cinco.fp.prodserv.descriptor.RAMDescriptor
import java.util.ArrayList

class RAMGenerator {
	
	ArrayList<RAMDescriptor> rams
	
	def run() {
		rams = ProductService.RAMs
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	«FOR a:rams»
	ram "«a.name»" {
		name «a.name.split(" |-|!|/|\\.").map[toString].join()»
		type «a.type»
		capacity «a.capacity»
		powerConsumption «a.powerConsumption» W
		price «a.price» €
	}
	
	«ENDFOR»
	'''
}