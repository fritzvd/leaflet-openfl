package leaflet.tests;

import leaflet.Bounds;
import leaflet.Point;

class TestBounds extends haxe.unit.TestCase {

    public function testExtend () {
        var localB = new Bounds(new Point(4.0, 5.0), new Point(8.0, 9.0));
        var localCopy = new Bounds(new Point(4.0, 5.0), new Point(8.0, 9.0));
        localB.extend(new Point(10.0, 12.0));

        // minimum should remain the same
        assertEquals(localB.min.toString(), new Point(4.0, 5.0).toString());

        // maximum should have changed
        assertTrue((localB.max.x > localCopy.max.x));
        assertTrue((localB.max.y > localCopy.max.y));
    }

    public function testGetCenter () {
        var localB = new Bounds(new Point(1.0, 1.0), new Point(4.0, 4.0));
        var centerPoint =localB.getCenter();

        assertEquals(centerPoint.x, 2.5);
        assertEquals(centerPoint.y, 2.5);
        assertEquals(centerPoint.toString(), new Point(2.5, 2.5).toString());
    }

    public function testGetBottomLeft () {
        var localB = new Bounds(new Point(1.0, 1.0), new Point(4.0, 4.0));
        var bottomLeft = localB.getBottomLeft();

        assertEquals(bottomLeft.toString(), 'Point(1, 4)');
    }

    
}