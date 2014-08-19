package leaflet.crs;

import leaflet.CRS;
import leaflet.Projection;
import leaflet.projection.LonLat;
import leaflet.Transformation;
import leaflet.LatLng;

class EPSG4326 extends CRS {

    public var code = 'EPSG:4326';
    public function new () {
        super();
        this.projection = LonLat;
        this.transformation = new Transformation(1 / 360,
            0.5, -1 / 360, 0.5);
    }
}