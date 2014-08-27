// Map.hx
package leaflet;

import leaflet.Leaflet;
import openfl.display.Sprite;
import leaflet.LatLng;
import leaflet.Point;
import leaflet.Bounds;
import leaflet.Util;
import leaflet.crs.Simple;
import openfl.events.Event;

class LMap {
    private var events:Events; 
    private var _layers:Map<String, Dynamic>;
    private var _lastId:Int;
    private var _zoom:Int;
    private var _loaded:Bool;
    private var _maxBounds:Bounds;
    private var _crs:Dynamic;
    private var _minZoom:Int;
    private var _maxZoom:Int;
    private var _size:Point;
    private var _panes:Dynamic;
    private var _initialLeftPoint:Int;
    private var _initialTopLeftPoint:Point;
    private var _initialCenter:Point;
    private var _sprite:Sprite;

    public function new (sprite, ?crs:Dynamic) {
        _sprite = sprite;
        events = new Events();
        if (crs == null) {
            _crs = new Simple();
        } else {
            _crs = crs;
        }
        _size = new Point (sprite.stage.stageHeight, sprite.stage.stageWidth);
        trace(_size);
        _initialCenter = new Point(0,0);
    }

    public function setView (center:Point, ?zoom) {
        if (zoom == null) {
            zoom = this.getZoom();
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

    public function setZoomAround (latlng:LatLng, zoom:Int) {
        var containerPoint:Point;
        var scale = getZoomScale(zoom);
        var viewHalf = getSize().divideBy(2);
        // if (Type.getClassName(Type.getClass(latlng)) == 'leaflet.Point') {
        //     containerPoint = latlng;
        // } else {
            containerPoint = latLngToContainerPoint(latlng);
        // }
        var centerOffset = containerPoint
            .subtract(viewHalf).multiplyBy(1 - 1 / scale);
        var newCenter = containerPointToLatLng(viewHalf.add(centerOffset));
        return this.setView(newCenter, zoom);
    }

    public function fitBounds (bounds:Dynamic) {
        if (Type.getClassName(Type.getClass(bounds)) == 'leaflet.Bounds') {
            bounds = bounds.getBounds();
        } else {
            bounds = L.latLngBounds(bounds);
        }
        var zoom = getZoom();
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
        bounds = L.bounds(bounds);
        _maxBounds = bounds;

        if (bounds == null) {
            return events.removeEventListener('moveend', _panInsideMaxBounds);
        }

        if (_loaded) {
            events.dispatchEvent(new Event('moveend'));

        }

        return events.addEventListener('moveend', _panInsideMaxBounds);
    }

    public function panInsideBounds (bounds) {
        var center:Point = getCenter();
        var newCenter = _limitCenter(center, _zoom, bounds);

        if (center.equals(newCenter)) { return this; }

        return panTo(newCenter);
    }

    public function addLayer (layer) {
        var id = Util.stamp(layer, _lastId);
        if (_layers[Std.string(id)] != null) { return this; }

        _layers[Std.string(id)] = layer;

        // if (layer.options)
        if (_loaded) {
            // _layerAdd(layer);
        }

        return this;
    }

    public function removeLayer (layer) {
        var id = Std.string(Util.stamp(layer, _lastId));

        if (_layers[id] == null) { return this; }
        
        if (_loaded) {
            // layer.onRemove(this);
        }

        return this;
    }

    public function hasLayer (layer) {
        if (layer == null) { return false; }
        var id = Util.stamp(layer, _lastId);
        return _layers.exists(Std.string(id));
    }

    public function invalidateSize (options) {

    }

    private function _panInsideMaxBounds (e) {
        //
        return e;
    }

    private function _limitCenter (center, zoom, bounds) {
        return center;
    }

    public function getCenter () {
        if (_initialCenter == null) {
            _initialCenter = new Point(0.0, 0.0);
        }
        return _initialCenter;
    }

    public function getBounds () {
        var bounds:Bounds = getPixelBounds();
        var sw = unproject(bounds.getBottomLeft());
        var ne = unproject(bounds.getTopRight());

        return L.latLngBounds(sw, ne);
    }

    public function getMinZoom () {
        return _minZoom;
    }

    public function getZoom () {
        return _zoom;
    }

    public function getMaxZoom () {
        return _maxZoom;
    }

    public function getZoomScale (toZoom) {
        return _crs.scale(toZoom) / _crs.scale(toZoom);
    }

    public function getBoundsZoom (bounds, ?inside, ?padding) {
        // var zoom = this.getMin
    }

    public function getSize () {
        if (_size == null) {
            // _size = new Point(openfl.media)
        }
        return _size;
    }

    public function getPixelBounds () {
        var topLeftPoint = _getTopLeftPoint();
        return L.bounds(topLeftPoint, topLeftPoint.add(getSize()));
    }

    public function getPixelOrigin () {
        _checkIfLoaded();
        return _initialTopLeftPoint;
    }

    public function getPanes () {
        return _panes;
    }

    public function _resetView (latlng, ?zoom) {
        
    }

    public function _rawPanBy (point) {
        
    }

    public function _limitZoom (zoom) {
        return zoom;
    }

    public function _checkIfLoaded () {
        if (_loaded != true) {
            // break;
            // throw new haxe.macro.Expr.Error('not loaded', 'here');
        }
    }


    public function project (latlng, ?zoom) {
        if (zoom == null) {
            zoom = this._zoom;
        }
        return _crs.latLngToPoint(L.latLng(latlng), _zoom);
    }

    public function unproject (point, ?zoom) {
       if (zoom == null) {
            zoom = this._zoom;
        }
        return _crs.pointToLatLng(L.point(point), zoom);
    }

    public function layerPointToLatLng (point) {
        var projectedPoint = L.point(point).add(getPixelOrigin());
        return unproject(point);
    }

    public function latLngToLayerPoint (latlng){
        var projectedPoint = project(L.latLng(latlng))._round();
        return projectedPoint;
    }

    public function layerPointToContainerPoint (point:Point) {
        return L.point(point).subtract(_getMapPanePos());
    }

    public function latLngToContainerPoint (latlng) {
        return layerPointToContainerPoint(latLngToLayerPoint(
            L.latLng(latlng)));
    }

    public function containerPointToLatLng (point) {
        return L.point(point).subtract(_getMapPanePos());
    }

    public function _getMapPanePos () {
        return new Point(0,0);
    }

    public function _getTopLeftPoint () {
        return new Point(0,0);
    }

}