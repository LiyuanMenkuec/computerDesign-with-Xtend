package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.ProductService
import info.scce.cinco.fp.prodserv.descriptor.PowerSupplyDescriptor
import java.util.ArrayList

class PowerSupplyGenerator {
	
	ArrayList<PowerSupplyDescriptor> supplies
	
	def run() {
		supplies = ProductService.powerSupplies
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	«FOR a:supplies»
	psu "«a.name»" {
		name «a.name.split(" |-|!|/|\\.").map[toString].join()»
		power «a.power» W
		price «a.price» €
	}
	
	«ENDFOR»
	'''
}