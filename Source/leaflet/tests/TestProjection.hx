package leaflet.tests;

import leaflet.Projection;
import leaflet.projection.LonLat;
import leaflet.projection.SphericalMercator;

class TestProjection extends haxe.unit.TestCase {

    public function testStandardProject () {
        var latLng = new LatLng(51.5, 4.3);
        var point = LonLat.project(latLng);
        assertEquals(point.toString(), 'Point(4.3, 51.5)');
    }
    
    public function testSpehMerProject () {
        var latLng = new LatLng(51.5, 4.3);
        var point = SphericalMercator.project(latLng);
        assertEquals(point.toString(), 'Point(0.0750491578357562, 1.05206568677041)');
    }

}