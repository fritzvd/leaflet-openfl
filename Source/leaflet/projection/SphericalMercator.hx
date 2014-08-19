// SphericalMercator.hx

package leaflet.projection;

import leaflet.LatLng;
import leaflet.Projection;
import leaflet.Point;

class SphericalMercator extends Projection {
    public static var MAX_LATITUDE = 85.0511287798;

    public static function project (latlng:LatLng) {
        var d = latlng.DEG_TO_RAD;
        var max = MAX_LATITUDE;
        var lat = Math.max(Math.min(max, latlng.lat), -max);
        var x = latlng.lng * d;
        var y = lat * d;

        y = Math.log(Math.tan((Math.PI / 4) + (y / 2)));

        return new Point(x, y);
    }

    public static function unproject (point:Point) {
        var latlng = new LatLng(0,0);
        var d = latlng.RAD_TO_DEG;
        latlng.lng = point.x * d;
        latlng.lat = (2 * Math.atan(Math.exp(point.y)) - (Math.PI / 2)) * d;

        return latlng;
    }
}