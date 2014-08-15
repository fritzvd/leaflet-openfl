package leaflet.tests;

import leaflet.LatLngBounds;
import leaflet.LatLng;

class TestLatLngBounds extends haxe.unit.TestCase {

    public function testSmoke () {
        var latLngBnds = new LatLngBounds(
            new LatLng(51.5, 4.3), new LatLng(54.3, 6.4));
        assertEquals(latLngBnds._southWest.lat, 51.5);
        assertEquals(latLngBnds._southWest.lng, 4.3);
        assertEquals(latLngBnds._northEast.lat, 54.3);
        assertEquals(latLngBnds._northEast.lng, 6.4);
    }

    public function testExtend () {
        var latLngBnds = new LatLngBounds(
            new LatLng(51.5, 4.3), new LatLng(54.3, 6.4));
        latLngBnds.extend(new LatLng(50.0, 4.0));
        assertEquals(latLngBnds._southWest.lat, 50.0);
        assertEquals(latLngBnds._southWest.lng, 4.0);
    }
    
    public function testPad () {
        var latLngBnds = new LatLngBounds(
            new LatLng(51.5, 4.3), new LatLng(54.3, 6.4));
        var lB = latLngBnds.pad(0.5);
        assertEquals(lB._southWest.lat, 50.1);
        assertEquals(Std.string(lB._southWest.lng), Std.string(3.25));
        assertEquals(Std.string(lB._northEast.lat), Std.string(55.7));
        assertEquals(Std.string(lB._northEast.lng), Std.string(7.45));
    }

    public function testGetCenter () {
        var latLngBnds = new LatLngBounds(
            new LatLng(51.5, 4.3), new LatLng(54.3, 6.4));
        var center = latLngBnds.getCenter();
        assertEquals(center.toString(), 'LatLng(52.9, 5.35)');
    }

    public function testToBBoxString () {
        var latLngBnds = new LatLngBounds(
            new LatLng(51.5, 4.3), new LatLng(54.3, 6.4));
        assertEquals(latLngBnds.toBBoxString(), '4.3,51.5,6.4,54.3');
    }

    public function testEquals () {
        var latLngBnds = new LatLngBounds(
            new LatLng(51.5, 4.3), new LatLng(54.3, 6.4));
        assertTrue(latLngBnds.equals(latLngBnds));
    }
}