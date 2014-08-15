package leaflet.tests;

import leaflet.tests.TestBounds;
import leaflet.tests.TestTransformation;
import leaflet.tests.TestLatLng;
import leaflet.tests.TestLatLngBounds;

class Tests {
    static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new TestBounds());
        r.add(new TestTransformation());
        r.add(new TestLatLng());
        r.add(new TestLatLngBounds());
        r.run();
    }
}
