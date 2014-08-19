// Transformation.hx

package leaflet;

import leaflet.Leaflet;
import leaflet.Point;

class Transformation {

    public var _a:Float;
    public var _b:Float;
    public var _c:Float;
    public var _d:Float;

    public function new (a, b, c, d) {
        this._a = a;
        this._b = b;
        this._c = c;
        this._d = d;
    }

    public function transform (point:Point, scale:Float) {
        return this._transform(point.clone(), scale);
    }

    public function _transform (point:Point, scale:Float) {
        scale = if (scale != null) scale else 1;
        point.x = scale * (this._a * point.x + this._b);
        point.y = scale * (this._c * point.y + this._d);
        return point;
    }

    public function untransform (point:Point, scale:Float) {
        scale = if (scale != null) scale else 1;
        return new Point(
            (point.x / scale - this._b) / this._a,
            (point.y / scale - this._d) / this._c);
    }

}