package leaflet.tests;

import leaflet.tests.TestBounds;
import leaflet.tests.TestTransformation;
import leaflet.tests.TestLatLng;

class Tests {
    static function main(){
        var r = new haxe.unit.TestRunner();
        r.add(new TestBounds());
        r.add(new TestTransformation());
        r.add(new TestLatLng());
        r.run();
    }
}
