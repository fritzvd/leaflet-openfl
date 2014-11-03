package;

import openfl.display.Sprite;
import openfl.system.Capabilities;
import leaflet.Leaflet;
import leaflet.Point;
import leaflet.Bounds;
import leaflet.Projection;
import leaflet.LMap;

class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		trace(stage.stageWidth, stage.stageHeight);
		trace(Capabilities.screenResolutionX, Capabilities.screenResolutionY, stage);
		var l = new L();
		var lB = new Bounds([new Point(3.0,4.0), new Point(5.0, 9.0)]);
		var lC = new Point(3.5, 6.0);
		// trace(lB.intersects(lB));
		var mappo = new LMap(this);
        // L.point([1,2]);
	}

	
}
