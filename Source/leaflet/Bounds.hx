// Bounds.hx

package leaflet;

import leaflet.Leaflet;
import leaflet.Util;
import leaflet.Point;

class Bounds {

    public var min:Point;
    public var max:Point;

    public function new (a:Dynamic, ?b:Point) {
        if (Type.getClassName(Type.getClass(a)) == 'Array') {
            loopPoints(a);
        } else if (b != null) {
            extend(a);
            extend(b);
        }
    }

    private function loopPoints (pointArray:Array<Point>) {
        for (point in pointArray) {
            extend(point);
        }
    }

    public function extend(point:Point) {
        point = L.point(point);
        if (this.min == null && this.max == null) {
            this.min = point.clone();
            this.max = point.clone();
        } else {
            this.min.x = Math.min(point.x, this.min.x);
            this.max.x = Math.max(point.x, this.max.x);
            this.min.y = Math.min(point.y, this.min.y); 
            this.max.y = Math.max(point.y, this.max.y); 
        }
        return this;
    }

    public function getCenter (?round=false) {
        return new Point(
            (this.min.x + this.max.x) / 2,
            (this.min.y + this.max.y) / 2, round);
    }

    public function getBottomLeft () {
        return new Point(this.min.x, this.max.y);
    }

    public function getTopRight () {
        return new Point(this.max.x, this.min.y);
    }

    public function getSize () {
        return this.max.subtract(this.min);
    }

    public function contains (obj:Dynamic) {
        // private storage of min max value of object.
        var oMin:Dynamic = null;
        var oMax:Dynamic = null;

        if (Type.typeof(obj) == TInt ||
            Type.typeof(obj) == TFloat ||
            Type.getClassName(Type.getClass(obj)) == 'leaflet.Point') {
            obj = L.point(obj);
        } else {
            obj = L.bounds(obj);
        }

        if (Type.getClassName(Type.getClass(obj)) == 'leaflet.Bounds') {
            oMin = obj.min;
            oMax = obj.max;
        } else {
            oMin = oMax = obj;
        }

        return (oMin.x >= this.min.x) &&
               (oMax.x <= this.max.x) &&
               (oMin.x >= this.min.y) &&
               (oMax.y <= this.max.y);
    }

    public function intersects (bounds:Dynamic) {
        bounds = L.bounds(bounds);

        var lMin = this.min;
        var lMax = this.max;
        var lMin2 = this.min;
        var lMax2 = this.max;
        var xIntersects = (lMax2.x >= lMin.x) && (lMin2.x <= lMax.x);
        var yIntersects = (lMax2.y >= lMin.y) && (lMin2.y <= lMax.y);

        return xIntersects && yIntersects;
    }

    public function isValid () {
        return (this.min != null && this.max != null);
    }

}   