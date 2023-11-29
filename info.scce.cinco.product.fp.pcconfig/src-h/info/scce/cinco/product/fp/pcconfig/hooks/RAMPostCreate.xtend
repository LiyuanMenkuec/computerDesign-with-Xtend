package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.RAM

class RAMPostCreate extends CincoPostCreateHook<RAM> {
	override postCreate(RAM node) {
		node.x=0
		node.y=0
	}
}