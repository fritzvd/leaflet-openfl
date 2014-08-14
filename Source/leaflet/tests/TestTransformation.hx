// TestTransformation.hx

package leaflet.tests;

import leaflet.Transformation;
import leaflet.Point;

class TestTransformation extends haxe.unit.TestCase {
    public function testSmoke () {
        var a = 1;
        var lTrans = new Transformation(a, 2, 3, 4);
        assertTrue(lTrans != null);
        assertEquals(lTrans._a, a);
    }

    public function testTransform () {
        var lTrans = new Transformation(1, 2, 3, 4);
        var transPoint = lTrans.transform(new Point(5.0, 4.0), 1);
        assertEquals(transPoint.x, 7);
    }

    public function testUntransform () {
        var lTrans = new Transformation(1, 2, 3, 4);
        var transPoint = lTrans.untransform(new Point(7.0, 16.0), 1);
        assertEquals(transPoint.x, 5);   
    }
}