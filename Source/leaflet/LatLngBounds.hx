// LatLngBounds.hx

package leaflet;

import leaflet.LatLng;
import leaflet.Leaflet;

class LatLngBounds {

    public var _southWest:Float;
    public var _northEast:Float;

    public function new (southWest:Dynamic, northEast:LatLng) {
        if (southWest == null) return;
        this.extend(southWest);
        this.extend(northEast);
    }

    public function extend(obj) {
        if (obj == null) return;

        var latLng = L.latLng(obj);
        if (latLng !=  null) {
            obj = latLng;
        } else {
            obj = L.latLngBounds(obj);
        }

        if (Type.getClassName(Type.getClass(obj)) == 'leaflet.LatLng') {
            if (this._northEast == null && this._southWest == null) {
                this._southWest = new LatLng(obj.lat, obj.lng);
                this._northEast = new LatLng(obj.lat, obj.lng);
            } else {
                this._southWest.lat = Math.min(obj.lat, this._southWest.lat);
                this._southWest.lng = Math.min(obj.lng, this._southWest.lng);

                this._northEast.lat = Math.min(obj.lat, this._northEast.lat);
                this._northEast.lng = Math.min(obj.lng, this._northEast.lng);
            }
        } else if (Type.getClassName(Type.getClass(obj)) == 'leaflet.LatLngBounds') {
            this.extend(obj._southWest);
            this.extend(obj._northEast);
        }

        return this;
    }
}