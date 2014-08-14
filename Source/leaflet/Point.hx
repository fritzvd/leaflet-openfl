// Point.hx
package leaflet;

import leaflet.Leaflet;

class Point {

    public var x:Float;
    public var y:Float;

    public function new (x:Float, y:Float, ?round:Bool) {
        this.x = (round ? Math.round(x) : x);
        this.y = (round ? Math.round(y) : y);
    }

    public function clone () {
        return new Point(this.x, this.y);
    }

    public function add (point) {
        return this.clone()._add(L.point(point));
    }

    public function _add (point) {
        this.x += point.x;
        this.y += point.y;
        return this;
    }

    //TODO: why won't this work like the add/_add function..
    public function subtract (point) {
        return this.clone()._subtract(L.point(point));
    }

    public function _subtract (point:Point) {
        this.x -= point.x;
        this.y -= point.y;
        return this;
    }

    public function divideBy (num:Float) {
        return this.clone()._divideBy(num);
    }

    public function _divideBy (num:Float) {
        this.x /= num;
        this.y /= num;
        return this;
    }

    public function multiplyBy (num:Float) {
        return this.clone()._multiplyBy(num);
    }

    public function _multiplyBy (num:Float) {
        this.x /= num;
        this.y /= num;
        return this;
    }

    public function round () {
        return this.clone()._round();
    }

    public function _round () {
        this.x = Math.round(this.x);
        this.y = Math.round(this.y);
        return this;
    }

    public function floor () {
        return this.clone()._floor();
    }

    public function _floor () {
        this.x = Math.floor(this.x);
        this.y = Math.floor(this.y);
        return this;
    }

    public function distanceTo (point) {
        point = L.point(point);

        var x = point.x - this.x;
        var y = point.y - this.y;

        return Math.sqrt(x * x + y * y);
    }

    public function equals (point) {
        point = L.point(point);

        return point.x == this.x && 
               point.y == this.y;
    }

    public function contains (point) {
        point = L.point(point);

        return Math.abs(point.x) <= Math.abs(this.x) &&
               Math.abs(point.y) <= Math.abs(this.y);
    }

    public function toString () {
        return 'Point(' +
                Std.string(this.x) + ', ' +
                Std.string(this.y) + ')';
    }

}