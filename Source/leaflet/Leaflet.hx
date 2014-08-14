/*
 Leaflet, a JavaScript library for mobile-friendly interactive maps. http://leafletjs.com
 (c) 2010-2013, Vladimir Agafonkin
 (c) 2010-2011, CloudMade


 attempt at a port for OpenFL/Haxe by @fritzvd
*/

package leaflet;

import leaflet.Util;
import leaflet.Point;
import leaflet.Bounds;
import leaflet.LatLng;

class L {

    public function new () {

    }
 
    public function extend(dest, org) {
        return Util.extend(dest, org);
    }

    public static function point (x:Dynamic, ?y:Float, ?round = false) {
        if (Type.getClassName(Type.getClass(x)) == 'leaflet.Point') {
            return x;
        }
         if (Type.getClassName(Type.getClass(x)) == 'Array') {
            return new Point(x[0], x[1]);
        }
        if (y != null) {
            return new Point(x, y, round);
        }
        return x;
    }

    public static function latLng (a:Dynamic, ?b:Float) {
        if (Type.getClassName(Type.getClass(a)) == 'leaflet.LatLng') {
            return a;
        }
         if (Type.getClassName(Type.getClass(a)) == 'Array') {
            return new  LatLng(a[0], a[1]);
        }
        if (b != null) {
            return new LatLng(a, b);
        }
        return a;
    }

    public static function bounds (a:Dynamic, ?b:Point) {
        if (a == null || 
            Type.getClassName(Type.getClass(a)) == 'leaflet.Bounds') {
            return a;
        }
        return new Bounds(a, b);
    }
    
    public static function bounds (a:Dynamic, ?b:Point) {
        if (a == null || 
            Type.getClassName(Type.getClass(a)) == 'leaflet.Bounds') {
            return a;
        }
        return new Bounds(a, b);
    }
}