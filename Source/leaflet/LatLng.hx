// LatLng.hx
package leaflet;

import leaflet.Point;
import leaflet.Leaflet;

class LatLng {

    public var lat:Float;
    public var lng:Float;
    public var alt:Float;

    public var DEG_TO_RAD = Math.PI / 180;
    public var RAD_TO_DEG = 180 / Math.PI;
    public var MAX_MARGIN = 1.0E-9;

    public function new (lat, lng, ?alt) {
        this.lat = lat;
        this.lng = lng;

        if (alt != null) {
            this.alt = alt;
        }
    }

    public function equals (obj) {
        if (obj == null) {
            return false;
        }

        obj = L.latLng(obj);

        var margin = Math.max(
            Math.abs(this.lat - obj.lat),
            Math.abs(this.lng - obj.lng));
        return margin <= this.MAX_MARGIN;
    }

    public function toString (precision) {
        return 'LatLng(' +
            Std.string(this.lat) + ', ' +
            Std.string(this.lng) + ')';
    }

    public function distanceTo (other:LatLng) {
        var R = 6378137;
        var d2r = this.DEG_TO_RAD;
        var dLat = (other.lat - this.lat) * d2r;
        var dLon = (other.lng - this.lng) * d2r;
        var lat1 = this.lat * d2r;
        var lat2 = other.lat * d2r;
        var sin1 = Math.sin(dLat / 2);
        var sin2 = Math.sin(dLon / 2);

        var a = sin1 * sin1 + sin2 * sin2 * Math.cos(lat1) * Math.cos(lat2);

        return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    }

    public function wrap (a, b) {
        var lng = this.lng;

        a = if (a != null) a else -180;
        b = if (b != null) b else 180;
        var plusThis:Float; 
        if (lng < a || lng == b) {
            plusThis = b;
        } else {
            plusThis = a;
        }
        lng = (lng + b) % (b - a) + (plusThis);

        return new LatLng(this.lat, lng);
    }

}