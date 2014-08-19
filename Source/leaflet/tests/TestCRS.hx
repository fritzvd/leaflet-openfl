package leaflet.tests;

import leaflet.Projection;
import leaflet.projection.LonLat;
import leaflet.projection.SphericalMercator;
import leaflet.crs.Simple;
import leaflet.crs.EPSG3857;

class TestCRS extends haxe.unit.TestCase {

    public function testSimpleCRS () {
        var latLng = new LatLng(51.5, 4.3);
        var crs = new Simple();
        var point = crs.latLngToPoint(latLng, 1);
        assertEquals(point.toString(), 'Point(8.6, -103)');
    }
    
    public function testEPSG3857 () {
        var latLng = new LatLng(51.5, 4.3);
        var crs = new EPSG3857();
        var projpoint = crs.project(latLng);
        assertEquals(projpoint.toString(),
            'Point(1.17666268121485e-08, 1.64948743931089e-07)');
    }

    public function testEPSG4326 () {
        var latLng = new LatLng(51.5, 4.3);
        var crs = new EPSG3857();
        var projpoint = crs.latLngToPoint(latLng, 1);
        assertEquals(projpoint.toString(),
            'Point(262.115555555556, 170.269975292478)');
    }
}