package leaflet.crs;

import leaflet.CRS;
import leaflet.Projection;
import leaflet.projection.SphericalMercator;
import leaflet.Transformation;
import leaflet.LatLng;

class EPSG3857 extends CRS {

    public var code = 'EPSG:3857';
    public function new () {
        super();
        this.projection = SphericalMercator;
        this.transformation = new Transformation(0.5 / Math.PI,
            0.5, -0.5 / Math.PI, 0.5);
    }

    public override function project (latlng:LatLng) {
        var projectedPoint = this.projection.project(latlng);
        var earthRadius = 6378137;
        return projectedPoint.multiplyBy(earthRadius);
    }
}