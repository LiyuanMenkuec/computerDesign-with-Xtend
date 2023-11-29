package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.CPU

class CPUPostCreate extends CincoPostCreateHook<CPU> {
	override postCreate(CPU node) {
		node.x=0
		node.y=0
	}
}