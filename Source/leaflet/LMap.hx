// Map.hx
package leaflet;

import leaflet.Leaflet;
import leaflet.Bounds;
import openfl.events.Event;
// import openfl.events.EventDispatcher;

class LMap {
    public var events:Events; 

    private var _zoom;
    private var _loaded:Bool;
    private var _maxBounds:Bounds;

    public function new () {
        events = new Events();
    }

    public function setView (center, zoom) {
        var zoom;
        if (zoom == null) {
            zoom = this.getZoom();
        } else {
            zoom = zoom;
        }
        _resetView(L.latLng(center), _limitZoom(zoom));
        return this;
    }

    public function setZoom (zoom) {
        if (this._loaded) {
            this._zoom = this._limitZoom(zoom);
            return this;
        }
        return setView(getCenter(), zoom);
    }

    public function zoomIn (delta) {
        if (delta == null) { delta = 1; }
        return setZoom(_zoom + (delta));
    }

    public function zoomOut (delta) {
        if (delta == null) { delta = 1; }
        return setZoom(_zoom - (delta));
    }

    public function setZoomAround (latlng, zoom) {
        var scale = getZoomScale(zoom);
        var viewHalf = getSize().divideBy(2);
        if (Type.getClassName(Type.getClass(latlng)) == 'leaflet.Point') {
            var containerPoint = latlng;
        } else {
            var containerPoint = latLngToContainerPoint(latlng);
        }
        var centerOffset = containerPoint
            .subtract(viewHalf).multiplyBy(1 - 1 / scale);
        var newCenter = containerPointToLatLng(viewHalf.add(centerOffset));
        return this.setView(newCenter, zoom);
    }

    public function fitBounds (bounds) {
        if (Type.getClassName(Type.getClass(bounds)) == 'leaflet.Bounds') {
            bounds = bounds.getBounds();
        } else {
            bounds = L.latLngBounds(bounds);
        }
        var center = bounds.getSouthWest();
        return setView(center, zoom);
    }

    public function fitWorld () {
        return fitBounds([[-90, -180], [90, 180]]);
    }

    public function panTo (center) {
        return setView(center, _zoom);
    }

    public function panBy (offset) {
        events.dispatchEvent(new Event('movestart'));
        _rawPanBy(L.point(offset));

        events.dispatchEvent(new Event('move'));
        return events.dispatchEvent(new Event('moveend'));
    }

    public function setMaxBounds (bounds) {
        bounds = L.latLngBounds(bounds);
        _maxBounds = bounds;

        if (bounds == null) {
            return events.removeEventListener('moveend', _panInsideMaxBounds);
        }

        if (_loaded) {
            _panInsideMaxBounds();
        }

        return events.addEventListener('moveend', _panInsideMaxBounds);
    }

    public function panInsideBounds (bounds) {
        var center:Point = getCenter();
        var newCenter = _limitCenter(center, _zoom, bounds);

        if (center.equals(newCenter)) { return this; }
    }

    public function addLayer (layer) {

    }

    private function _panInsideMaxBounds() {
        //
    }

    private function _limitCenter (center, zoom, bounds) {
        //
    }

}