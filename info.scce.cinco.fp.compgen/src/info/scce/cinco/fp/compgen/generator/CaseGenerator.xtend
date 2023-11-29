package info.scce.cinco.fp.compgen.generator

import info.scce.cinco.fp.prodserv.ProductService
import info.scce.cinco.fp.prodserv.descriptor.CaseDescriptor
import java.util.ArrayList

class CaseGenerator {
	
	ArrayList<CaseDescriptor> cases
	
	def run() {
		cases = ProductService.cases
		template.toString
	}
	
	// TODO: Implement this template
	def template() '''
	«FOR a:cases»
	case "«a.name»" {
		name «a.name.split(" |-|!|/|\\.").map[toString].join()»
		formFactor «a.formFactor»
		internalSlots «a.internalSlots»
		externalSlots «a.externalSlots»
		price «a.price» €
	}

	«ENDFOR»
	'''
}