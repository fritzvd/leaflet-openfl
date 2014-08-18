// Projection.hx
// Took a slightly different approach to original leaflet-src
// Default is LonLat.
// Spherical Mercator will inherit and override these functions

package leaflet;

import leaflet.Leaflet;
import leaflet.LatLng;
import leaflet.Point;

class Projection {

    public static function project (latlng:LatLng) {
        return new L.Point(latlng.lng, latlng.lat);
    }

    public static function unproject (point) {
        return new L.LatLng(point.y, point.x);
    }

}