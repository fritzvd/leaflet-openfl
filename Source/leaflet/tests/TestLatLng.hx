package leaflet.tests;

import leaflet.LatLng;

class TestLatLng extends haxe.unit.TestCase {

    public function testSmoke () {
        var latLng = new LatLng(51.5, 4.3);
        assertTrue(latLng != null);
    }

    public function testDistanceTo () {
        var latLng = new LatLng(51.5, 4.3);
        var distance = latLng.distanceTo(new LatLng(latLng.lat, latLng.lng));
        var distance1 = latLng.distanceTo(new LatLng(latLng.lat + 0.5, latLng.lng + 0.5));
        assertEquals(distance, 0);
        assertEquals(Math.round(distance1), Math.round(65462.6199632026));
    }


    public function testEquals () {
        var latLng = new LatLng(51.5, 4.3);
        var equalOrNot = latLng.equals(new LatLng(51.5, 4.3));
        assertTrue(equalOrNot);
    }
    
}