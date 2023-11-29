package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.mb.mainboard.GPU

class GPUPostCreate extends CincoPostCreateHook<GPU> {
	override postCreate(GPU node) {
		node.x=0
		node.y=0
	}
}