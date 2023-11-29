package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.pc.PSU

class PSUPostCreate extends CincoPostCreateHook<PSU> {
	override postCreate(PSU node) {
		node.x=0
		node.y=0
	}
}