// LatLngBounds.hx

package leaflet;

import leaflet.LatLng;
import leaflet.Leaflet;

class LatLngBounds {

    public var _southWest:LatLng = null;
    public var _northEast:LatLng = null;

    public function new (southWest:Dynamic, northEast:LatLng) {
        if (southWest == null) return;
        this.extend(southWest);
        this.extend(northEast);
    }

    public function extend(obj:Dynamic) {
        if (obj == null) return;
        // trace(this._southWest);
        // trace(obj);
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

                this._northEast.lat = Math.max(obj.lat, this._northEast.lat);
                this._northEast.lng = Math.max(obj.lng, this._northEast.lng);
            }
        } else if (Type.getClassName(Type.getClass(obj)) == 'leaflet.LatLngBounds') {
            this.extend(obj._southWest);
            this.extend(obj._northEast);
        }

        return;
    }

    public function pad (bufferRatio:Float) {
        var sw = this._southWest;
        var ne = this._northEast;
        var heightBuffer = Math.abs(sw.lat - ne.lat) * bufferRatio;
        var widthBuffer = Math.abs(sw.lng - ne.lng) * bufferRatio;

        return L.latLngBounds(
            new LatLng(sw.lat - heightBuffer, sw.lng - widthBuffer),
            new LatLng(ne.lat + heightBuffer, ne.lng + widthBuffer)
            );
    }

    public function getCenter () {
        return new LatLng(
            (this._southWest.lat + this._northEast.lat) / 2,
            (this._southWest.lng + this._northEast.lng) / 2);
    }

    public function getSouthWest () {
        return this._southWest;
    }

    public function getNorthEast () {
        return this._northEast;
    }

    public function getNorthWest () {
        return new LatLng(this.getNorth(), this.getWest());
    }

    public function getSouthEast () {
        return new LatLng(this.getSouth(), this.getEast());
    }

    public function getWest () {
        return this._southWest.lng;
    }

    public function getSouth () {
        return this._southWest.lat;
    }

    public function getEast () {
        return this._northEast.lng;
    }

    public function getNorth () {
        return this._northEast.lat;
    }

    public function contains (obj:Dynamic) {
        if (Type.getClassName(Type.getClass(obj)) == 'leaflet.LatLng' ||
            Type.getClassName(Type.getClass(obj)) == 'Array') {
            obj = L.latLng(obj);
        } else {
            obj = L.latLngBounds(obj);
        }

        var sw = this._southWest;
        var ne = this._northEast;
        var sw2;
        var ne2;

        if (Type.getClassName(Type.getClass(obj)) == 'leaflet.LatLngBounds') {
            sw2 = obj.getSouthWest();
            ne2 = obj.getNorthEast();
        } else {
            sw2 = obj;
            ne2 = obj;
        }

        return (sw2.lat >= sw.lat) && (ne2.lat <= ne.lat) &&
               (sw2.lng >= sw.lng) && (ne2.lng <= ne.lng);
    }

    public function intersects (bounds) {
        bounds = L.latLngBounds(bounds);

        var sw = this._southWest;
        var ne = this._northEast;
        var sw2 = bounds.getSouthWest();
        var ne2 = bounds.getNorthEast();

        var latIntersects = (ne2.lat >= sw.lat) && (sw2.lat <= ne.lat);
        var lngIntersects = (ne2.lng >= sw.lng) && (sw2.lng <= ne.lng);

        return latIntersects && lngIntersects;
    }

    public function toBBoxString () {
        return ([this.getWest(), this.getSouth(),
                this.getEast(), this.getNorth()]).join(',');
    }

    public function equals (bounds:LatLngBounds) {
        if (bounds == null) return false;

        bounds = L.latLngBounds(bounds);

        return this._southWest.equals(bounds.getSouthWest()) &&
               this._northEast.equals(bounds.getNorthEast());
    }

    public function isValid () {
        return (this._southWest != null &&
                this._northEast != null);
    }
}