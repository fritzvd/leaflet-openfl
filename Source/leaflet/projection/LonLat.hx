// SphericalMercator.hx

package leaflet.projection;

import leaflet.Projection;
import leaflet.LatLng;
import leaflet.Point;

class LonLat extends Projection {
    public static function project (latlng:LatLng) {
        return new Point(latlng.lng, latlng.lat);
    }

    public static function unproject (point:Point) {
        return new LatLng(point.y, point.x);
    }
}