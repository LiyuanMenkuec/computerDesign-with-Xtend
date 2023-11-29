package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.pc.Mainboard

class NodeMainboardPostCreate extends CincoPostCreateHook<Mainboard> {
	override postCreate(Mainboard node) {
		node.x=0
		node.y=0
	}
}