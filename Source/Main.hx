package;


import openfl.display.Sprite;
import leaflet.Leaflet;
import leaflet.Point;
import leaflet.Bounds;

class Main extends Sprite {
	
	
	public function new () {
		
		super ();

		var l = new L();
		var lB = new Bounds([new Point(3.0,4.0), new Point(5.0, 9.0)]);
		var lC = new Point(3.5, 6.0);
		trace(lB.intersects(lB));

        // L.point([1,2]);
	}
	
	
}