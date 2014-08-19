package leaflet;

import leaflet.Leaflet;
import leaflet.Point;
import leaflet.LatLng;
import leaflet.Projection;
import leaflet.Transformation;

class CRS {
    public var projection:Dynamic;
    public var transformation:Transformation;

    public function new () {
        // this.projection = new Projection();
    }

    public function latLngToPoint (latlng:LatLng, zoom) {
        var projectedPoint = this.projection.project(latlng);
        var scale = this.scale(zoom);

        return this.transformation._transform(projectedPoint, scale);
    }

    public function pointToLatLng (point:Point, zoom) {
        var scale = this.scale(zoom);
        var untransformedPoint = this.transformation.untransform(
            point, scale);

        return this.projection.unproject(untransformedPoint);
    }

    private function project (latlng) {
        return this.projection.project(latlng);
    }

    private function scale (zoom) {
        return 256 * Math.pow(2, zoom);
    }

    public function getSize (zoom) {
        var s = this.scale(zoom);
        return L.point(s, s);
    }
}