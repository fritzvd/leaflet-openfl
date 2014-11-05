package leaflet;

import leaflet.LMap;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLRequest;

class TileLayer extends Sprite {
    private var _url:String;
    public var _map:LMap;

    public function new (url ) {
        super();
        _url = url;
        this.update(_url);
    }

    public function addTo (map) {
        this._map = map;
        this._map.addLayer(this);
        return this;
    }

    public function getCenter() {
        return this._map.getCenter();
    }

    public whichTiles(

    public function getTile (tile, tilePoint) {
      // tiles in queue calculated how many and where.   
    }

    public function loadTile (url) {
        var loader  =  new openfl.display.Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, jean);
        loader.load( new openfl.net.URLRequest(url));
    }

    public function addTile(data:Event) {
        var bit = cast(data.currentTarget.content, openfl.display.Bitmap);
        addChild(bit);
    }

    public function jean (data:Event) {
        trace('blurav');
    }


}
