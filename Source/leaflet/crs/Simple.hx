package leaflet.crs;

import leaflet.CRS;
import leaflet.Projection;
import leaflet.projection.LonLat;
import leaflet.Transformation;

class Simple extends CRS {
    public function new () {
        super();
        this.projection = LonLat;
        this.transformation = new Transformation(1, 0, -1, 0);
    }

    public override function scale (zoom) {
        return Math.pow(2, zoom);
    }
}