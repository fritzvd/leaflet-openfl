package;

import openfl.display.Sprite;
import openfl.system.Capabilities;
import leaflet.Leaflet;
import leaflet.Point;
import leaflet.Bounds;
import leaflet.Projection;
import leaflet.LMap;
import leaflet.TileLayer;

class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		var l = new L();
		var lB = new Bounds([new Point(3.0,4.0), new Point(5.0, 9.0)]);
		var lC = new Point(3.5, 6.0);
		// trace(lB.intersects(lB));
		var mappo = new LMap(this);
        var layer = new TileLayer('http://localhost:8000/screen.png');
        //layer.addTo(mappo);
        mappo.addLayer(layer);
        // L.point([1,2]);
	}

	
}
