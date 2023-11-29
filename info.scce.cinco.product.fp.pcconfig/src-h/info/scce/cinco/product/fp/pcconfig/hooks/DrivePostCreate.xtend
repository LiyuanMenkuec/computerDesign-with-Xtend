package info.scce.cinco.product.fp.pcconfig.hooks

import de.jabc.cinco.meta.runtime.hook.CincoPostCreateHook
import info.scce.cinco.product.fp.pcconfig.pc.pc.Drive

class DrivePostCreate extends CincoPostCreateHook<Drive> {
	override postCreate(Drive node) {
		node.x=0
		node.y=0
	}
}