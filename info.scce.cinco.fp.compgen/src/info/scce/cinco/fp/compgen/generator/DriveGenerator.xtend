package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.ProductService
import info.scce.cinco.fp.prodserv.descriptor.DriveDescriptor
import java.util.ArrayList

class DriveGenerator {
	
	ArrayList<DriveDescriptor> drives
	
	def run() {
		drives = ProductService.drives
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	«FOR a:drives»
	drive "«a.name»" {
		name «a.name.split(" |-|!|/|\\.").map[toString].join()»
		type «a.type»
		description "«a.description»"
		powerConsumption «a.powerConsumption» W
		price «a.price» €
	}
	
	«ENDFOR»
	'''
}