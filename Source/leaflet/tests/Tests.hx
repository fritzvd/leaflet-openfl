package leaflet.tests;

import leaflet.tests.TestBounds;
import leaflet.tests.TestTransformation;
import leaflet.tests.TestLatLng;
import leaflet.tests.TestLatLngBounds;
import leaflet.tests.TestProjection;
import leaflet.tests.TestCRS;

class Tests {
    static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new TestBounds());
        r.add(new TestTransformation());
        r.add(new TestLatLng());
        r.add(new TestLatLngBounds());
        r.add(new TestProjection());
        r.add(new TestCRS());
        r.run();
    }
}
